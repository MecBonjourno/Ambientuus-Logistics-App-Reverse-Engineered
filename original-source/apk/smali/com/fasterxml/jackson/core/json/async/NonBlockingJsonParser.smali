.class public Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;
.super Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParserBase;
.source "NonBlockingJsonParser.java"

# interfaces
.implements Lcom/fasterxml/jackson/core/async/ByteArrayFeeder;


# static fields
.field protected static final _icLatin1:[I

.field private static final _icUTF8:[I


# instance fields
.field protected _inputBuffer:[B

.field protected _origBufferLen:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icUTF8:[I

    .line 23
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeLatin1()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icLatin1:[I

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)V
    .locals 1
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "parserFeatures"    # I
    .param p3, "sym"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParserBase;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)V

    .line 34
    sget-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->NO_BYTES:[B

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 58
    return-void
.end method

.method private final _decodeCharEscape()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2737
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    sub-int/2addr v0, v1

    .line 2738
    .local v0, "left":I
    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    .line 2739
    const/4 v1, 0x0

    const/4 v2, -0x1

    invoke-direct {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitEscaped(II)I

    move-result v1

    return v1

    .line 2741
    :cond_0
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeFastCharEscape()I

    move-result v1

    return v1
.end method

.method private final _decodeFastCharEscape()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2746
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    .line 2747
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_0

    .line 2773
    int-to-char v1, v0

    .line 2774
    .local v1, "ch":C
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_handleUnrecognizedCharacterEscape(C)C

    move-result v2

    return v2

    .line 2767
    .end local v1    # "ch":C
    :sswitch_0
    nop

    .line 2778
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    .line 2779
    .local v1, "ch":I
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    .line 2780
    .local v2, "digit":I
    move v3, v2

    .line 2782
    .local v3, "result":I
    if-ltz v2, :cond_0

    .line 2783
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v4, v5

    .line 2784
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    .line 2785
    if-ltz v2, :cond_0

    .line 2786
    shl-int/lit8 v4, v3, 0x4

    or-int v3, v4, v2

    .line 2787
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v4, v5

    .line 2788
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    .line 2789
    if-ltz v2, :cond_0

    .line 2790
    shl-int/lit8 v4, v3, 0x4

    or-int v3, v4, v2

    .line 2791
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v4, v5

    .line 2792
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    .line 2793
    if-ltz v2, :cond_0

    .line 2794
    shl-int/lit8 v4, v3, 0x4

    or-int/2addr v4, v2

    return v4

    .line 2799
    :cond_0
    and-int/lit16 v4, v1, 0xff

    const-string v5, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2800
    const/4 v4, -0x1

    return v4

    .line 2752
    .end local v1    # "ch":I
    .end local v2    # "digit":I
    .end local v3    # "result":I
    :sswitch_1
    const/16 v1, 0x9

    return v1

    .line 2758
    :sswitch_2
    const/16 v1, 0xd

    return v1

    .line 2754
    :sswitch_3
    const/16 v1, 0xa

    return v1

    .line 2756
    :sswitch_4
    const/16 v1, 0xc

    return v1

    .line 2750
    :sswitch_5
    const/16 v1, 0x8

    return v1

    .line 2764
    :sswitch_6
    int-to-char v1, v0

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_6
        0x2f -> :sswitch_6
        0x5c -> :sswitch_6
        0x62 -> :sswitch_5
        0x66 -> :sswitch_4
        0x6e -> :sswitch_3
        0x72 -> :sswitch_2
        0x74 -> :sswitch_1
        0x75 -> :sswitch_0
    .end sparse-switch
.end method

.method private _decodeSplitEscaped(II)I
    .locals 6
    .param p1, "value"    # I
    .param p2, "bytesRead"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2287
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/4 v2, -0x1

    if-lt v0, v1, :cond_0

    .line 2288
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quoted32:I

    .line 2289
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quotedDigits:I

    .line 2290
    return v2

    .line 2292
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    .line 2293
    .local v0, "c":I
    if-ne p2, v2, :cond_2

    .line 2294
    sparse-switch v0, :sswitch_data_0

    .line 2320
    int-to-char v1, v0

    .line 2321
    .local v1, "ch":C
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_handleUnrecognizedCharacterEscape(C)C

    move-result v2

    return v2

    .line 2314
    .end local v1    # "ch":C
    :sswitch_0
    nop

    .line 2324
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v1, v3, :cond_1

    .line 2325
    const/4 v1, 0x0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quotedDigits:I

    .line 2326
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quoted32:I

    .line 2327
    return v2

    .line 2329
    :cond_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v1, v3

    .line 2330
    const/4 p2, 0x0

    goto :goto_0

    .line 2299
    :sswitch_1
    const/16 v1, 0x9

    return v1

    .line 2305
    :sswitch_2
    const/16 v1, 0xd

    return v1

    .line 2301
    :sswitch_3
    const/16 v1, 0xa

    return v1

    .line 2303
    :sswitch_4
    const/16 v1, 0xc

    return v1

    .line 2297
    :sswitch_5
    const/16 v1, 0x8

    return v1

    .line 2311
    :sswitch_6
    return v0

    .line 2332
    :cond_2
    :goto_0
    and-int/lit16 v0, v0, 0xff

    .line 2334
    :goto_1
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v1

    .line 2335
    .local v1, "digit":I
    if-gez v1, :cond_3

    .line 2336
    const-string v3, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2338
    :cond_3
    shl-int/lit8 v3, p1, 0x4

    or-int p1, v3, v1

    .line 2339
    add-int/lit8 p2, p2, 0x1

    const/4 v3, 0x4

    if-ne p2, v3, :cond_4

    .line 2340
    return p1

    .line 2342
    :cond_4
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_5

    .line 2343
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quotedDigits:I

    .line 2344
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quoted32:I

    .line 2345
    return v2

    .line 2347
    :cond_5
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 v0, v3, 0xff

    .line 2348
    .end local v1    # "digit":I
    goto :goto_1

    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_6
        0x2f -> :sswitch_6
        0x5c -> :sswitch_6
        0x62 -> :sswitch_5
        0x66 -> :sswitch_4
        0x6e -> :sswitch_3
        0x72 -> :sswitch_2
        0x74 -> :sswitch_1
        0x75 -> :sswitch_0
    .end sparse-switch
.end method

.method private final _decodeSplitMultiByte(IIZ)Z
    .locals 4
    .param p1, "c"    # I
    .param p2, "type"    # I
    .param p3, "gotNext"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2612
    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p2, :pswitch_data_0

    .line 2650
    const/16 v0, 0x20

    if-ge p1, v0, :cond_4

    .line 2652
    const-string/jumbo v0, "string value"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_0

    .line 2641
    :pswitch_0
    and-int/lit8 p1, p1, 0x7

    .line 2642
    if-eqz p3, :cond_0

    .line 2643
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v2

    invoke-direct {p0, p1, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitUTF8_4(III)Z

    move-result v0

    return v0

    .line 2645
    :cond_0
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2646
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2647
    const/16 v1, 0x2c

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2648
    return v0

    .line 2632
    :pswitch_1
    and-int/lit8 p1, p1, 0xf

    .line 2633
    if-eqz p3, :cond_1

    .line 2634
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v2

    invoke-direct {p0, p1, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitUTF8_3(III)Z

    move-result v0

    return v0

    .line 2636
    :cond_1
    const/16 v2, 0x2b

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2637
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2638
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2639
    return v0

    .line 2622
    :pswitch_2
    if-eqz p3, :cond_2

    .line 2624
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v2

    invoke-direct {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeUTF8_2(II)I

    move-result p1

    .line 2625
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v2, p1

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 2626
    return v1

    .line 2628
    :cond_2
    const/16 v1, 0x2a

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2629
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2630
    return v0

    .line 2614
    :pswitch_3
    const/4 v2, -0x1

    invoke-direct {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitEscaped(II)I

    move-result p1

    .line 2615
    if-gez p1, :cond_3

    .line 2616
    const/16 v1, 0x29

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2617
    return v0

    .line 2619
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v2, p1

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 2620
    return v1

    .line 2655
    :cond_4
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidChar(I)V

    .line 2657
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v2, p1

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 2658
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final _decodeSplitUTF8_3(III)Z
    .locals 5
    .param p1, "prev"    # I
    .param p2, "prevCount"    # I
    .param p3, "next"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2665
    const/16 v0, 0x80

    const/4 v1, 0x1

    if-ne p2, v1, :cond_2

    .line 2666
    and-int/lit16 v2, p3, 0xc0

    if-eq v2, v0, :cond_0

    .line 2667
    and-int/lit16 v2, p3, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2669
    :cond_0
    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v3, p3, 0x3f

    or-int p1, v2, v3

    .line 2670
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_1

    .line 2671
    const/16 v0, 0x2b

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2672
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2673
    const/4 v0, 0x2

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2674
    const/4 v0, 0x0

    return v0

    .line 2676
    :cond_1
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p3, v2, v3

    .line 2678
    :cond_2
    and-int/lit16 v2, p3, 0xc0

    if-eq v2, v0, :cond_3

    .line 2679
    and-int/lit16 v0, p3, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2681
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v3, p3, 0x3f

    or-int/2addr v2, v3

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 2682
    return v1
.end method

.method private final _decodeSplitUTF8_4(III)Z
    .locals 8
    .param p1, "prev"    # I
    .param p2, "prevCount"    # I
    .param p3, "next"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2690
    const/4 v0, 0x0

    const/16 v1, 0x2c

    const/4 v2, 0x2

    const/16 v3, 0x80

    const/4 v4, 0x1

    if-ne p2, v4, :cond_2

    .line 2691
    and-int/lit16 v5, p3, 0xc0

    if-eq v5, v3, :cond_0

    .line 2692
    and-int/lit16 v5, p3, 0xff

    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v5, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2694
    :cond_0
    shl-int/lit8 v5, p1, 0x6

    and-int/lit8 v6, p3, 0x3f

    or-int p1, v5, v6

    .line 2695
    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_1

    .line 2696
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2697
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2698
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2699
    return v0

    .line 2701
    :cond_1
    const/4 p2, 0x2

    .line 2702
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p3, v5, v6

    .line 2704
    :cond_2
    if-ne p2, v2, :cond_5

    .line 2705
    and-int/lit16 v2, p3, 0xc0

    if-eq v2, v3, :cond_3

    .line 2706
    and-int/lit16 v2, p3, 0xff

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2708
    :cond_3
    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v5, p3, 0x3f

    or-int p1, v2, v5

    .line 2709
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v2, v5, :cond_4

    .line 2710
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2711
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2712
    const/4 v1, 0x3

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2713
    return v0

    .line 2715
    :cond_4
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p3, v0, v1

    .line 2717
    :cond_5
    and-int/lit16 v0, p3, 0xc0

    if-eq v0, v3, :cond_6

    .line 2718
    and-int/lit16 v0, p3, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2720
    :cond_6
    shl-int/lit8 v0, p1, 0x6

    and-int/lit8 v1, p3, 0x3f

    or-int/2addr v0, v1

    const/high16 v1, 0x10000

    sub-int/2addr v0, v1

    .line 2722
    .local v0, "c":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    shr-int/lit8 v2, v0, 0xa

    const v3, 0xd800

    or-int/2addr v2, v3

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 2723
    and-int/lit16 v1, v0, 0x3ff

    const v2, 0xdc00

    or-int v0, v1, v2

    .line 2725
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v2, v0

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 2726
    return v4
.end method

.method private final _decodeUTF8_2(II)I
    .locals 2
    .param p1, "c"    # I
    .param p2, "d"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2811
    and-int/lit16 v0, p2, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_0

    .line 2812
    and-int/lit16 v0, p2, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2814
    :cond_0
    and-int/lit8 v0, p1, 0x1f

    shl-int/lit8 v0, v0, 0x6

    and-int/lit8 v1, p2, 0x3f

    or-int/2addr v0, v1

    return v0
.end method

.method private final _decodeUTF8_3(III)I
    .locals 3
    .param p1, "c"    # I
    .param p2, "d"    # I
    .param p3, "e"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2819
    and-int/lit8 p1, p1, 0xf

    .line 2820
    and-int/lit16 v0, p2, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_0

    .line 2821
    and-int/lit16 v0, p2, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2823
    :cond_0
    shl-int/lit8 v0, p1, 0x6

    and-int/lit8 v2, p2, 0x3f

    or-int p1, v0, v2

    .line 2824
    and-int/lit16 v0, p3, 0xc0

    if-eq v0, v1, :cond_1

    .line 2825
    and-int/lit16 v0, p3, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2827
    :cond_1
    shl-int/lit8 v0, p1, 0x6

    and-int/lit8 v1, p3, 0x3f

    or-int/2addr v0, v1

    return v0
.end method

.method private final _decodeUTF8_4(IIII)I
    .locals 3
    .param p1, "c"    # I
    .param p2, "d"    # I
    .param p3, "e"    # I
    .param p4, "f"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2834
    and-int/lit16 v0, p2, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_0

    .line 2835
    and-int/lit16 v0, p2, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2837
    :cond_0
    and-int/lit8 v0, p1, 0x7

    shl-int/lit8 v0, v0, 0x6

    and-int/lit8 v2, p2, 0x3f

    or-int p1, v0, v2

    .line 2838
    and-int/lit16 v0, p3, 0xc0

    if-eq v0, v1, :cond_1

    .line 2839
    and-int/lit16 v0, p3, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2841
    :cond_1
    shl-int/lit8 v0, p1, 0x6

    and-int/lit8 v2, p3, 0x3f

    or-int p1, v0, v2

    .line 2842
    and-int/lit16 v0, p4, 0xc0

    if-eq v0, v1, :cond_2

    .line 2843
    and-int/lit16 v0, p4, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidOther(II)V

    .line 2845
    :cond_2
    shl-int/lit8 v0, p1, 0x6

    and-int/lit8 v1, p4, 0x3f

    or-int/2addr v0, v1

    const/high16 v1, 0x10000

    sub-int/2addr v0, v1

    return v0
.end method

.method private final _fastParseName()Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1783
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 1784
    .local v0, "input":[B
    sget-object v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icLatin1:[I

    .line 1785
    .local v1, "codes":[I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1787
    .local v2, "ptr":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "ptr":I
    .local v3, "ptr":I
    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    .line 1788
    .local v2, "q0":I
    aget v4, v1, v2

    const/4 v5, 0x0

    const/16 v6, 0x22

    if-nez v4, :cond_8

    .line 1789
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "ptr":I
    .local v4, "ptr":I
    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    .line 1790
    .local v3, "i":I
    aget v7, v1, v3

    if-nez v7, :cond_6

    .line 1791
    shl-int/lit8 v7, v2, 0x8

    or-int/2addr v7, v3

    .line 1792
    .local v7, "q":I
    add-int/lit8 v8, v4, 0x1

    .end local v4    # "ptr":I
    .local v8, "ptr":I
    aget-byte v4, v0, v4

    and-int/lit16 v3, v4, 0xff

    .line 1793
    aget v4, v1, v3

    if-nez v4, :cond_4

    .line 1794
    shl-int/lit8 v4, v7, 0x8

    or-int/2addr v4, v3

    .line 1795
    .end local v7    # "q":I
    .local v4, "q":I
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "ptr":I
    .local v7, "ptr":I
    aget-byte v8, v0, v8

    and-int/lit16 v3, v8, 0xff

    .line 1796
    aget v8, v1, v3

    if-nez v8, :cond_2

    .line 1797
    shl-int/lit8 v8, v4, 0x8

    or-int v4, v8, v3

    .line 1798
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "ptr":I
    .restart local v8    # "ptr":I
    aget-byte v7, v0, v7

    and-int/lit16 v3, v7, 0xff

    .line 1799
    aget v7, v1, v3

    if-nez v7, :cond_0

    .line 1800
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    .line 1801
    invoke-direct {p0, v8, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parseMediumName(II)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 1803
    :cond_0
    if-ne v3, v6, :cond_1

    .line 1804
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1805
    const/4 v5, 0x4

    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(II)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 1807
    :cond_1
    return-object v5

    .line 1809
    .end local v8    # "ptr":I
    .restart local v7    # "ptr":I
    :cond_2
    if-ne v3, v6, :cond_3

    .line 1810
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1811
    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(II)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 1813
    :cond_3
    return-object v5

    .line 1815
    .end local v4    # "q":I
    .local v7, "q":I
    .restart local v8    # "ptr":I
    :cond_4
    if-ne v3, v6, :cond_5

    .line 1816
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1817
    const/4 v4, 0x2

    invoke-virtual {p0, v7, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(II)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 1819
    :cond_5
    return-object v5

    .line 1821
    .end local v7    # "q":I
    .end local v8    # "ptr":I
    .local v4, "ptr":I
    :cond_6
    if-ne v3, v6, :cond_7

    .line 1822
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1823
    const/4 v5, 0x1

    invoke-virtual {p0, v2, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(II)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 1825
    :cond_7
    return-object v5

    .line 1827
    .end local v4    # "ptr":I
    .local v3, "ptr":I
    :cond_8
    if-ne v2, v6, :cond_9

    .line 1828
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1829
    const-string v4, ""

    return-object v4

    .line 1831
    :cond_9
    return-object v5
.end method

.method private _finishAposName(III)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .param p1, "qlen"    # I
    .param p2, "currQuad"    # I
    .param p3, "currQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2139
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2140
    .local v0, "quads":[I
    sget-object v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icLatin1:[I

    .line 2143
    .local v1, "codes":[I
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/16 v4, 0x9

    if-lt v2, v3, :cond_0

    .line 2144
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    .line 2145
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2146
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2147
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2148
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v2

    .line 2150
    :cond_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v3, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    .line 2151
    .local v2, "ch":I
    const/16 v3, 0x27

    if-ne v2, v3, :cond_5

    .line 2152
    nop

    .line 2218
    .end local v2    # "ch":I
    if-lez p3, :cond_2

    .line 2219
    array-length v2, v0

    if-lt p1, v2, :cond_1

    .line 2220
    array-length v2, v0

    invoke-static {v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v2

    move-object v0, v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2222
    :cond_1
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "qlen":I
    .local v2, "qlen":I
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_padLastQuad(II)I

    move-result v3

    aput v3, v0, p1

    move p1, v2

    goto :goto_1

    .line 2223
    .end local v2    # "qlen":I
    .restart local p1    # "qlen":I
    :cond_2
    if-nez p1, :cond_3

    .line 2224
    const-string v2, ""

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 2226
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v2, v0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v2

    .line 2227
    .local v2, "name":Ljava/lang/String;
    if-nez v2, :cond_4

    .line 2228
    invoke-virtual {p0, v0, p1, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_addName([III)Ljava/lang/String;

    move-result-object v2

    .line 2230
    :cond_4
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 2155
    .local v2, "ch":I
    :cond_5
    const/16 v3, 0x22

    const/4 v5, 0x4

    if-eq v2, v3, :cond_d

    aget v3, v1, v2

    if-eqz v3, :cond_d

    .line 2156
    const/16 v3, 0x5c

    if-eq v2, v3, :cond_6

    .line 2158
    const-string v3, "name"

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_2

    .line 2161
    :cond_6
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeCharEscape()I

    move-result v2

    .line 2162
    if-gez v2, :cond_7

    .line 2163
    const/16 v3, 0x8

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2164
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    .line 2165
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    .line 2166
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2167
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2168
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v3

    .line 2171
    :cond_7
    :goto_2
    const/16 v3, 0x7f

    if-le v2, v3, :cond_d

    .line 2173
    if-lt p3, v5, :cond_9

    .line 2174
    array-length v3, v0

    if-lt p1, v3, :cond_8

    .line 2175
    array-length v3, v0

    invoke-static {v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v3

    move-object v0, v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2177
    :cond_8
    add-int/lit8 v3, p1, 0x1

    .end local p1    # "qlen":I
    .local v3, "qlen":I
    aput p2, v0, p1

    .line 2178
    const/4 p2, 0x0

    .line 2179
    const/4 p3, 0x0

    move p1, v3

    .line 2181
    .end local v3    # "qlen":I
    .restart local p1    # "qlen":I
    :cond_9
    const/16 v3, 0x800

    if-ge v2, v3, :cond_a

    .line 2182
    shl-int/lit8 v3, p2, 0x8

    shr-int/lit8 v4, v2, 0x6

    or-int/lit16 v4, v4, 0xc0

    or-int p2, v3, v4

    .line 2183
    add-int/lit8 p3, p3, 0x1

    goto :goto_3

    .line 2186
    :cond_a
    shl-int/lit8 v3, p2, 0x8

    shr-int/lit8 v4, v2, 0xc

    or-int/lit16 v4, v4, 0xe0

    or-int p2, v3, v4

    .line 2187
    add-int/lit8 p3, p3, 0x1

    .line 2189
    if-lt p3, v5, :cond_c

    .line 2190
    array-length v3, v0

    if-lt p1, v3, :cond_b

    .line 2191
    array-length v3, v0

    invoke-static {v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v3

    move-object v0, v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2193
    :cond_b
    add-int/lit8 v3, p1, 0x1

    .end local p1    # "qlen":I
    .restart local v3    # "qlen":I
    aput p2, v0, p1

    .line 2194
    const/4 p2, 0x0

    .line 2195
    const/4 p3, 0x0

    move p1, v3

    .line 2197
    .end local v3    # "qlen":I
    .restart local p1    # "qlen":I
    :cond_c
    shl-int/lit8 v3, p2, 0x8

    shr-int/lit8 v4, v2, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/lit16 v4, v4, 0x80

    or-int p2, v3, v4

    .line 2198
    add-int/lit8 p3, p3, 0x1

    .line 2201
    :goto_3
    and-int/lit8 v3, v2, 0x3f

    or-int/lit16 v2, v3, 0x80

    .line 2205
    :cond_d
    if-ge p3, v5, :cond_e

    .line 2206
    add-int/lit8 p3, p3, 0x1

    .line 2207
    shl-int/lit8 v3, p2, 0x8

    or-int p2, v3, v2

    goto :goto_4

    .line 2209
    :cond_e
    array-length v3, v0

    if-lt p1, v3, :cond_f

    .line 2210
    array-length v3, v0

    invoke-static {v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v3

    move-object v0, v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2212
    :cond_f
    add-int/lit8 v3, p1, 0x1

    .end local p1    # "qlen":I
    .restart local v3    # "qlen":I
    aput p2, v0, p1

    .line 2213
    move p1, v2

    .line 2214
    .end local p2    # "currQuad":I
    .local p1, "currQuad":I
    const/4 p2, 0x1

    move p3, p2

    move p2, p1

    move p1, v3

    .line 2216
    .end local v2    # "ch":I
    .end local v3    # "qlen":I
    .local p1, "qlen":I
    .restart local p2    # "currQuad":I
    :goto_4
    goto/16 :goto_0
.end method

.method private final _finishAposString()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2515
    sget-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icUTF8:[I

    .line 2516
    .local v0, "codes":[I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 2518
    .local v1, "inputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v2

    .line 2519
    .local v2, "outBuf":[C
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v3

    .line 2520
    .local v3, "outPtr":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2521
    .local v4, "ptr":I
    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    add-int/lit8 v5, v5, -0x5

    .line 2527
    .local v5, "safeEnd":I
    :goto_0
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/16 v7, 0x2d

    if-lt v4, v6, :cond_0

    .line 2528
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2529
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2530
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2531
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v6

    .line 2533
    :cond_0
    array-length v6, v2

    if-lt v3, v6, :cond_1

    .line 2534
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2535
    const/4 v3, 0x0

    .line 2537
    :cond_1
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    array-length v8, v2

    sub-int/2addr v8, v3

    add-int/2addr v8, v4

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 2538
    .local v6, "max":I
    :goto_1
    if-ge v4, v6, :cond_a

    .line 2539
    add-int/lit8 v8, v4, 0x1

    .end local v4    # "ptr":I
    .local v8, "ptr":I
    aget-byte v4, v1, v4

    and-int/lit16 v4, v4, 0xff

    .line 2540
    .local v4, "c":I
    aget v9, v0, v4

    if-eqz v9, :cond_8

    const/16 v9, 0x22

    if-eq v4, v9, :cond_8

    .line 2541
    nop

    .line 2553
    .end local v6    # "max":I
    if-lt v8, v5, :cond_4

    .line 2554
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2555
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2556
    aget v6, v0, v4

    iget v9, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-ge v8, v9, :cond_2

    const/4 v9, 0x1

    goto :goto_2

    :cond_2
    const/4 v9, 0x0

    :goto_2
    invoke-direct {p0, v4, v6, v9}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitMultiByte(IIZ)Z

    move-result v6

    if-nez v6, :cond_3

    .line 2557
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    .line 2558
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v6

    .line 2560
    :cond_3
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v2

    .line 2561
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v3

    .line 2562
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2563
    .end local v8    # "ptr":I
    .local v6, "ptr":I
    move v4, v6

    goto :goto_0

    .line 2566
    .end local v6    # "ptr":I
    .restart local v8    # "ptr":I
    :cond_4
    aget v6, v0, v4

    packed-switch v6, :pswitch_data_0

    .line 2591
    const/16 v6, 0x20

    if-ge v4, v6, :cond_6

    .line 2593
    const-string/jumbo v6, "string value"

    invoke-virtual {p0, v4, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_4

    .line 2579
    :pswitch_0
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "ptr":I
    .local v7, "ptr":I
    aget-byte v6, v6, v8

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v9, v7, 0x1

    .end local v7    # "ptr":I
    .local v9, "ptr":I
    aget-byte v7, v8, v7

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v10, v9, 0x1

    .end local v9    # "ptr":I
    .local v10, "ptr":I
    aget-byte v8, v8, v9

    invoke-direct {p0, v4, v6, v7, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeUTF8_4(IIII)I

    move-result v4

    .line 2582
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "outPtr":I
    .local v6, "outPtr":I
    shr-int/lit8 v7, v4, 0xa

    const v8, 0xd800

    or-int/2addr v7, v8

    int-to-char v7, v7

    aput-char v7, v2, v3

    .line 2583
    array-length v3, v2

    if-lt v6, v3, :cond_5

    .line 2584
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2585
    const/4 v3, 0x0

    .end local v6    # "outPtr":I
    .restart local v3    # "outPtr":I
    goto :goto_3

    .line 2583
    .end local v3    # "outPtr":I
    .restart local v6    # "outPtr":I
    :cond_5
    move v3, v6

    .line 2587
    .end local v6    # "outPtr":I
    .restart local v3    # "outPtr":I
    :goto_3
    and-int/lit16 v6, v4, 0x3ff

    const v7, 0xdc00

    or-int v4, v6, v7

    .line 2589
    move v6, v10

    goto :goto_5

    .line 2576
    .end local v10    # "ptr":I
    .restart local v8    # "ptr":I
    :pswitch_1
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "ptr":I
    .restart local v7    # "ptr":I
    aget-byte v6, v6, v8

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v9, v7, 0x1

    .end local v7    # "ptr":I
    .restart local v9    # "ptr":I
    aget-byte v7, v8, v7

    invoke-direct {p0, v4, v6, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeUTF8_3(III)I

    move-result v4

    .line 2577
    move v6, v9

    goto :goto_5

    .line 2573
    .end local v9    # "ptr":I
    .restart local v8    # "ptr":I
    :pswitch_2
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "ptr":I
    .restart local v7    # "ptr":I
    aget-byte v6, v6, v8

    invoke-direct {p0, v4, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeUTF8_2(II)I

    move-result v4

    .line 2574
    move v6, v7

    goto :goto_5

    .line 2568
    .end local v7    # "ptr":I
    .restart local v8    # "ptr":I
    :pswitch_3
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2569
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeFastCharEscape()I

    move-result v4

    .line 2570
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2571
    .end local v8    # "ptr":I
    .local v6, "ptr":I
    goto :goto_5

    .line 2596
    .end local v6    # "ptr":I
    .restart local v8    # "ptr":I
    :cond_6
    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidChar(I)V

    .line 2600
    :goto_4
    move v6, v8

    .end local v8    # "ptr":I
    .restart local v6    # "ptr":I
    :goto_5
    array-length v7, v2

    if-lt v3, v7, :cond_7

    .line 2601
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2602
    const/4 v3, 0x0

    .line 2605
    :cond_7
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v8, v4

    aput-char v8, v2, v3

    move v4, v6

    move v3, v7

    goto/16 :goto_0

    .line 2543
    .end local v7    # "outPtr":I
    .restart local v3    # "outPtr":I
    .local v6, "max":I
    .restart local v8    # "ptr":I
    :cond_8
    const/16 v9, 0x27

    if-ne v4, v9, :cond_9

    .line 2544
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2545
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2546
    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    return-object v7

    .line 2548
    :cond_9
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "outPtr":I
    .local v9, "outPtr":I
    int-to-char v10, v4

    aput-char v10, v2, v3

    move v4, v8

    move v3, v9

    goto/16 :goto_1

    .line 2550
    .end local v6    # "max":I
    .end local v8    # "ptr":I
    .end local v9    # "outPtr":I
    .restart local v3    # "outPtr":I
    .local v4, "ptr":I
    :cond_a
    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final _finishBOM(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .param p1, "bytesHandled"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 453
    nop

    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-ge v0, v1, :cond_1

    .line 454
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 455
    .local v0, "ch":I
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 459
    :pswitch_0
    iget-wide v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputProcessed:J

    const-wide/16 v3, 0x3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputProcessed:J

    .line 460
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startDocument(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 462
    :pswitch_1
    const/16 v1, 0xbf

    if-eq v0, v1, :cond_0

    .line 463
    const-string v1, "Unexpected byte 0x%02x following 0xEF 0xBB; should get 0xBF as third byte of UTF-8 BOM"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportError(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 467
    :pswitch_2
    const/16 v1, 0xbb

    if-eq v0, v1, :cond_0

    .line 468
    const-string v1, "Unexpected byte 0x%02x following 0xEF; should get 0xBB as second byte UTF-8 BOM"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportError(Ljava/lang/String;Ljava/lang/Object;)V

    .line 472
    :cond_0
    :goto_1
    nop

    .end local v0    # "ch":I
    add-int/lit8 p1, p1, 0x1

    .line 473
    goto :goto_0

    .line 474
    :cond_1
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 475
    const/4 v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 476
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final _finishCComment(IZ)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "fromMinorState"    # I
    .param p2, "gotStar"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1025
    nop

    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_1

    .line 1026
    if-eqz p2, :cond_0

    const/16 v0, 0x34

    goto :goto_1

    :cond_0
    const/16 v0, 0x35

    :goto_1
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1027
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 1028
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1030
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 1031
    .local v0, "ch":I
    const/16 v1, 0x20

    if-ge v0, v1, :cond_4

    .line 1032
    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    .line 1033
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    .line 1034
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 1035
    :cond_2
    const/16 v1, 0xd

    if-ne v0, v1, :cond_3

    .line 1036
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    .line 1037
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 1038
    :cond_3
    const/16 v1, 0x9

    if-eq v0, v1, :cond_6

    .line 1039
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 1041
    :cond_4
    const/16 v1, 0x2a

    if-ne v0, v1, :cond_5

    .line 1042
    const/4 p2, 0x1

    .line 1043
    goto :goto_0

    .line 1044
    :cond_5
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_6

    .line 1045
    if-eqz p2, :cond_6

    .line 1046
    nop

    .line 1051
    .end local v0    # "ch":I
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startAfterComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1049
    .restart local v0    # "ch":I
    :cond_6
    :goto_2
    const/4 p2, 0x0

    .line 1050
    .end local v0    # "ch":I
    goto :goto_0
.end method

.method private final _finishCppComment(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "fromMinorState"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 999
    nop

    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 1000
    const/16 v0, 0x36

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1001
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 1002
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1004
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 1005
    .local v0, "ch":I
    const/16 v1, 0x20

    if-ge v0, v1, :cond_3

    .line 1006
    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    .line 1007
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    .line 1008
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    .line 1009
    goto :goto_1

    .line 1010
    :cond_1
    const/16 v1, 0xd

    if-ne v0, v1, :cond_2

    .line 1011
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    .line 1012
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    .line 1013
    nop

    .line 1019
    .end local v0    # "ch":I
    :goto_1
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startAfterComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1014
    .restart local v0    # "ch":I
    :cond_2
    const/16 v1, 0x9

    if-eq v0, v1, :cond_3

    .line 1015
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwInvalidSpace(I)V

    .line 1018
    .end local v0    # "ch":I
    :cond_3
    goto :goto_0
.end method

.method private final _finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "fromMinorState"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 969
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_YAML_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_features:I

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->enabledIn(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 970
    const/16 v0, 0x23

    const-string v1, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_YAML_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 973
    :cond_0
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_1

    .line 974
    const/16 v0, 0x37

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 975
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 976
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 978
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 979
    .local v0, "ch":I
    const/16 v1, 0x20

    if-ge v0, v1, :cond_4

    .line 980
    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    .line 981
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    .line 982
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    .line 983
    goto :goto_1

    .line 984
    :cond_2
    const/16 v1, 0xd

    if-ne v0, v1, :cond_3

    .line 985
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    .line 986
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    .line 987
    nop

    .line 993
    .end local v0    # "ch":I
    :goto_1
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startAfterComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 988
    .restart local v0    # "ch":I
    :cond_3
    const/16 v1, 0x9

    if-eq v0, v1, :cond_4

    .line 989
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwInvalidSpace(I)V

    .line 992
    .end local v0    # "ch":I
    :cond_4
    goto :goto_0
.end method

.method private final _finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2389
    sget-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icUTF8:[I

    .line 2390
    .local v0, "codes":[I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 2392
    .local v1, "inputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v2

    .line 2393
    .local v2, "outBuf":[C
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v3

    .line 2394
    .local v3, "outPtr":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2395
    .local v4, "ptr":I
    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    add-int/lit8 v5, v5, -0x5

    .line 2402
    .local v5, "safeEnd":I
    :goto_0
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/16 v7, 0x28

    if-lt v4, v6, :cond_0

    .line 2403
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2404
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2405
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2406
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v6

    .line 2408
    :cond_0
    array-length v6, v2

    if-lt v3, v6, :cond_1

    .line 2409
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2410
    const/4 v3, 0x0

    .line 2412
    :cond_1
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    array-length v8, v2

    sub-int/2addr v8, v3

    add-int/2addr v8, v4

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 2413
    .local v6, "max":I
    :goto_1
    if-ge v4, v6, :cond_a

    .line 2414
    add-int/lit8 v8, v4, 0x1

    .end local v4    # "ptr":I
    .local v8, "ptr":I
    aget-byte v4, v1, v4

    and-int/lit16 v4, v4, 0xff

    .line 2415
    .local v4, "c":I
    aget v9, v0, v4

    if-eqz v9, :cond_9

    .line 2416
    nop

    .line 2422
    .end local v6    # "max":I
    const/16 v6, 0x22

    if-ne v4, v6, :cond_2

    .line 2423
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2424
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2425
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    return-object v6

    .line 2428
    :cond_2
    if-lt v8, v5, :cond_5

    .line 2429
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2430
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2431
    aget v6, v0, v4

    iget v9, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-ge v8, v9, :cond_3

    const/4 v9, 0x1

    goto :goto_2

    :cond_3
    const/4 v9, 0x0

    :goto_2
    invoke-direct {p0, v4, v6, v9}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitMultiByte(IIZ)Z

    move-result v6

    if-nez v6, :cond_4

    .line 2432
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    .line 2433
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v6

    .line 2435
    :cond_4
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v2

    .line 2436
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v3

    .line 2437
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2438
    .end local v8    # "ptr":I
    .local v6, "ptr":I
    move v4, v6

    goto :goto_0

    .line 2441
    .end local v6    # "ptr":I
    .restart local v8    # "ptr":I
    :cond_5
    aget v6, v0, v4

    packed-switch v6, :pswitch_data_0

    .line 2466
    const/16 v6, 0x20

    if-ge v4, v6, :cond_7

    .line 2468
    const-string/jumbo v6, "string value"

    invoke-virtual {p0, v4, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_4

    .line 2454
    :pswitch_0
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "ptr":I
    .local v7, "ptr":I
    aget-byte v6, v6, v8

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v9, v7, 0x1

    .end local v7    # "ptr":I
    .local v9, "ptr":I
    aget-byte v7, v8, v7

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v10, v9, 0x1

    .end local v9    # "ptr":I
    .local v10, "ptr":I
    aget-byte v8, v8, v9

    invoke-direct {p0, v4, v6, v7, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeUTF8_4(IIII)I

    move-result v4

    .line 2457
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "outPtr":I
    .local v6, "outPtr":I
    shr-int/lit8 v7, v4, 0xa

    const v8, 0xd800

    or-int/2addr v7, v8

    int-to-char v7, v7

    aput-char v7, v2, v3

    .line 2458
    array-length v3, v2

    if-lt v6, v3, :cond_6

    .line 2459
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2460
    const/4 v3, 0x0

    .end local v6    # "outPtr":I
    .restart local v3    # "outPtr":I
    goto :goto_3

    .line 2458
    .end local v3    # "outPtr":I
    .restart local v6    # "outPtr":I
    :cond_6
    move v3, v6

    .line 2462
    .end local v6    # "outPtr":I
    .restart local v3    # "outPtr":I
    :goto_3
    and-int/lit16 v6, v4, 0x3ff

    const v7, 0xdc00

    or-int v4, v6, v7

    .line 2464
    move v6, v10

    goto :goto_5

    .line 2451
    .end local v10    # "ptr":I
    .restart local v8    # "ptr":I
    :pswitch_1
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "ptr":I
    .restart local v7    # "ptr":I
    aget-byte v6, v6, v8

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v9, v7, 0x1

    .end local v7    # "ptr":I
    .restart local v9    # "ptr":I
    aget-byte v7, v8, v7

    invoke-direct {p0, v4, v6, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeUTF8_3(III)I

    move-result v4

    .line 2452
    move v6, v9

    goto :goto_5

    .line 2448
    .end local v9    # "ptr":I
    .restart local v8    # "ptr":I
    :pswitch_2
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "ptr":I
    .restart local v7    # "ptr":I
    aget-byte v6, v6, v8

    invoke-direct {p0, v4, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeUTF8_2(II)I

    move-result v4

    .line 2449
    move v6, v7

    goto :goto_5

    .line 2443
    .end local v7    # "ptr":I
    .restart local v8    # "ptr":I
    :pswitch_3
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2444
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeFastCharEscape()I

    move-result v4

    .line 2445
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2446
    .end local v8    # "ptr":I
    .local v6, "ptr":I
    goto :goto_5

    .line 2471
    .end local v6    # "ptr":I
    .restart local v8    # "ptr":I
    :cond_7
    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidChar(I)V

    .line 2475
    :goto_4
    move v6, v8

    .end local v8    # "ptr":I
    .restart local v6    # "ptr":I
    :goto_5
    array-length v7, v2

    if-lt v3, v7, :cond_8

    .line 2476
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2477
    const/4 v3, 0x0

    .line 2480
    :cond_8
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v8, v4

    aput-char v8, v2, v3

    move v4, v6

    move v3, v7

    goto/16 :goto_0

    .line 2418
    .end local v7    # "outPtr":I
    .restart local v3    # "outPtr":I
    .local v6, "max":I
    .restart local v8    # "ptr":I
    :cond_9
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "outPtr":I
    .local v9, "outPtr":I
    int-to-char v10, v4

    aput-char v10, v2, v3

    move v4, v8

    move v3, v9

    goto/16 :goto_1

    .line 2420
    .end local v6    # "max":I
    .end local v8    # "ptr":I
    .end local v9    # "outPtr":I
    .restart local v3    # "outPtr":I
    .local v4, "ptr":I
    :cond_a
    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private _finishUnquotedName(III)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "qlen"    # I
    .param p2, "currQuad"    # I
    .param p3, "currQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2091
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2092
    .local v0, "quads":[I
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8JsNames()[I

    move-result-object v1

    .line 2097
    .local v1, "codes":[I
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_0

    .line 2098
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    .line 2099
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2100
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2101
    const/16 v2, 0xa

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2102
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v2

    .line 2104
    :cond_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    .line 2105
    .local v2, "ch":I
    aget v3, v1, v2

    if-eqz v3, :cond_4

    .line 2106
    nop

    .line 2123
    .end local v2    # "ch":I
    if-lez p3, :cond_2

    .line 2124
    array-length v2, v0

    if-lt p1, v2, :cond_1

    .line 2125
    array-length v2, v0

    invoke-static {v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v2

    move-object v0, v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2127
    :cond_1
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "qlen":I
    .local v2, "qlen":I
    aput p2, v0, p1

    move p1, v2

    .line 2129
    .end local v2    # "qlen":I
    .restart local p1    # "qlen":I
    :cond_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v2, v0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v2

    .line 2130
    .local v2, "name":Ljava/lang/String;
    if-nez v2, :cond_3

    .line 2131
    invoke-virtual {p0, v0, p1, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_addName([III)Ljava/lang/String;

    move-result-object v2

    .line 2133
    :cond_3
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 2108
    .local v2, "ch":I
    :cond_4
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2110
    const/4 v3, 0x4

    if-ge p3, v3, :cond_5

    .line 2111
    add-int/lit8 p3, p3, 0x1

    .line 2112
    shl-int/lit8 v3, p2, 0x8

    or-int p2, v3, v2

    goto :goto_1

    .line 2114
    :cond_5
    array-length v3, v0

    if-lt p1, v3, :cond_6

    .line 2115
    array-length v3, v0

    invoke-static {v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v3

    move-object v0, v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2117
    :cond_6
    add-int/lit8 v3, p1, 0x1

    .end local p1    # "qlen":I
    .local v3, "qlen":I
    aput p2, v0, p1

    .line 2118
    move p1, v2

    .line 2119
    .end local p2    # "currQuad":I
    .local p1, "currQuad":I
    const/4 p2, 0x1

    move p3, p2

    move p2, p1

    move p1, v3

    .line 2121
    .end local v2    # "ch":I
    .end local v3    # "qlen":I
    .local p1, "qlen":I
    .restart local p2    # "currQuad":I
    :goto_1
    goto :goto_0
.end method

.method private _handleOddName(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2047
    const/4 v0, 0x4

    const/4 v1, 0x0

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 2063
    :sswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2056
    :sswitch_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2058
    :sswitch_2
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2059
    invoke-direct {p0, v1, v1, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2051
    :sswitch_3
    sget-object v2, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_YAML_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_features:I

    invoke-virtual {v2, v3}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->enabledIn(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2052
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2066
    :cond_0
    :goto_0
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_UNQUOTED_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2069
    int-to-char v0, p1

    .line 2070
    .local v0, "c":C
    const-string/jumbo v2, "was expecting double-quote to start field name"

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2074
    .end local v0    # "c":C
    :cond_1
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8JsNames()[I

    move-result-object v0

    .line 2076
    .local v0, "codes":[I
    aget v2, v0, p1

    if-eqz v2, :cond_2

    .line 2077
    const-string/jumbo v2, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name"

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2080
    :cond_2
    const/4 v2, 0x1

    invoke-direct {p0, v1, p1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishUnquotedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x23 -> :sswitch_3
        0x27 -> :sswitch_2
        0x2f -> :sswitch_1
        0x5d -> :sswitch_0
    .end sparse-switch
.end method

.method private final _parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .param p1, "qlen"    # I
    .param p2, "currQuad"    # I
    .param p3, "currQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1933
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 1934
    .local v0, "quads":[I
    sget-object v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icLatin1:[I

    .line 1937
    .local v1, "codes":[I
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/4 v4, 0x7

    if-lt v2, v3, :cond_0

    .line 1938
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    .line 1939
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 1940
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 1941
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1942
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v2

    .line 1944
    :cond_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v3, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    .line 1945
    .local v2, "ch":I
    aget v3, v1, v2

    const/4 v5, 0x4

    if-nez v3, :cond_3

    .line 1946
    if-ge p3, v5, :cond_1

    .line 1947
    add-int/lit8 p3, p3, 0x1

    .line 1948
    shl-int/lit8 v3, p2, 0x8

    or-int p2, v3, v2

    .line 1949
    goto :goto_0

    .line 1951
    :cond_1
    array-length v3, v0

    if-lt p1, v3, :cond_2

    .line 1952
    array-length v3, v0

    invoke-static {v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v3

    move-object v0, v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 1954
    :cond_2
    add-int/lit8 v3, p1, 0x1

    .end local p1    # "qlen":I
    .local v3, "qlen":I
    aput p2, v0, p1

    .line 1955
    move p2, v2

    .line 1956
    const/4 p3, 0x1

    .line 1957
    move p1, v3

    goto :goto_0

    .line 1961
    .end local v3    # "qlen":I
    .restart local p1    # "qlen":I
    :cond_3
    const/16 v3, 0x22

    if-ne v2, v3, :cond_8

    .line 1962
    nop

    .line 2023
    .end local v2    # "ch":I
    if-lez p3, :cond_5

    .line 2024
    array-length v2, v0

    if-lt p1, v2, :cond_4

    .line 2025
    array-length v2, v0

    invoke-static {v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v2

    move-object v0, v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2027
    :cond_4
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "qlen":I
    .local v2, "qlen":I
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_padLastQuad(II)I

    move-result v3

    aput v3, v0, p1

    move p1, v2

    goto :goto_1

    .line 2028
    .end local v2    # "qlen":I
    .restart local p1    # "qlen":I
    :cond_5
    if-nez p1, :cond_6

    .line 2029
    const-string v2, ""

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 2031
    :cond_6
    :goto_1
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v2, v0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v2

    .line 2032
    .local v2, "name":Ljava/lang/String;
    if-nez v2, :cond_7

    .line 2033
    invoke-virtual {p0, v0, p1, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_addName([III)Ljava/lang/String;

    move-result-object v2

    .line 2035
    :cond_7
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 1965
    .local v2, "ch":I
    :cond_8
    const/16 v3, 0x5c

    if-eq v2, v3, :cond_9

    .line 1967
    const-string v3, "name"

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_2

    .line 1970
    :cond_9
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeCharEscape()I

    move-result v2

    .line 1971
    if-gez v2, :cond_a

    .line 1972
    const/16 v3, 0x8

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1973
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    .line 1974
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    .line 1975
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 1976
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 1977
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v3

    .line 1984
    :cond_a
    :goto_2
    array-length v3, v0

    if-lt p1, v3, :cond_b

    .line 1985
    array-length v3, v0

    invoke-static {v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v3

    move-object v0, v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 1987
    :cond_b
    const/16 v3, 0x7f

    if-le v2, v3, :cond_f

    .line 1989
    if-lt p3, v5, :cond_c

    .line 1990
    add-int/lit8 v3, p1, 0x1

    .end local p1    # "qlen":I
    .restart local v3    # "qlen":I
    aput p2, v0, p1

    .line 1991
    const/4 p2, 0x0

    .line 1992
    const/4 p3, 0x0

    move p1, v3

    .line 1994
    .end local v3    # "qlen":I
    .restart local p1    # "qlen":I
    :cond_c
    const/16 v3, 0x800

    if-ge v2, v3, :cond_d

    .line 1995
    shl-int/lit8 v3, p2, 0x8

    shr-int/lit8 v4, v2, 0x6

    or-int/lit16 v4, v4, 0xc0

    or-int p2, v3, v4

    .line 1996
    add-int/lit8 p3, p3, 0x1

    goto :goto_3

    .line 1999
    :cond_d
    shl-int/lit8 v3, p2, 0x8

    shr-int/lit8 v4, v2, 0xc

    or-int/lit16 v4, v4, 0xe0

    or-int p2, v3, v4

    .line 2000
    add-int/lit8 p3, p3, 0x1

    .line 2002
    if-lt p3, v5, :cond_e

    .line 2003
    add-int/lit8 v3, p1, 0x1

    .end local p1    # "qlen":I
    .restart local v3    # "qlen":I
    aput p2, v0, p1

    .line 2004
    const/4 p2, 0x0

    .line 2005
    const/4 p3, 0x0

    move p1, v3

    .line 2007
    .end local v3    # "qlen":I
    .restart local p1    # "qlen":I
    :cond_e
    shl-int/lit8 v3, p2, 0x8

    shr-int/lit8 v4, v2, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/lit16 v4, v4, 0x80

    or-int p2, v3, v4

    .line 2008
    add-int/lit8 p3, p3, 0x1

    .line 2011
    :goto_3
    and-int/lit8 v3, v2, 0x3f

    or-int/lit16 v2, v3, 0x80

    .line 2013
    :cond_f
    if-ge p3, v5, :cond_10

    .line 2014
    add-int/lit8 p3, p3, 0x1

    .line 2015
    shl-int/lit8 v3, p2, 0x8

    or-int p2, v3, v2

    .line 2016
    goto/16 :goto_0

    .line 2018
    :cond_10
    add-int/lit8 v3, p1, 0x1

    .end local p1    # "qlen":I
    .restart local v3    # "qlen":I
    aput p2, v0, p1

    .line 2019
    move p2, v2

    .line 2020
    const/4 p3, 0x1

    .line 2021
    .end local v2    # "ch":I
    move p1, v3

    goto/16 :goto_0
.end method

.method private final _parseMediumName(II)Ljava/lang/String;
    .locals 6
    .param p1, "ptr"    # I
    .param p2, "q2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1836
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 1837
    .local v0, "input":[B
    sget-object v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icLatin1:[I

    .line 1840
    .local v1, "codes":[I
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "ptr":I
    .local v2, "ptr":I
    aget-byte p1, v0, p1

    and-int/lit16 p1, p1, 0xff

    .line 1841
    .local p1, "i":I
    aget v3, v1, p1

    const/4 v4, 0x0

    const/16 v5, 0x22

    if-nez v3, :cond_6

    .line 1842
    shl-int/lit8 v3, p2, 0x8

    or-int p2, v3, p1

    .line 1843
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "ptr":I
    .local v3, "ptr":I
    aget-byte v2, v0, v2

    and-int/lit16 p1, v2, 0xff

    .line 1844
    aget v2, v1, p1

    if-nez v2, :cond_4

    .line 1845
    shl-int/lit8 v2, p2, 0x8

    or-int p2, v2, p1

    .line 1846
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "ptr":I
    .restart local v2    # "ptr":I
    aget-byte v3, v0, v3

    and-int/lit16 p1, v3, 0xff

    .line 1847
    aget v3, v1, p1

    if-nez v3, :cond_2

    .line 1848
    shl-int/lit8 v3, p2, 0x8

    or-int p2, v3, p1

    .line 1849
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "ptr":I
    .restart local v3    # "ptr":I
    aget-byte v2, v0, v2

    and-int/lit16 p1, v2, 0xff

    .line 1850
    aget v2, v1, p1

    if-nez v2, :cond_0

    .line 1851
    invoke-direct {p0, v3, p1, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parseMediumName2(III)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1853
    :cond_0
    if-ne p1, v5, :cond_1

    .line 1854
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1855
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    const/4 v4, 0x4

    invoke-virtual {p0, v2, p2, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(III)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1857
    :cond_1
    return-object v4

    .line 1859
    .end local v3    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_2
    if-ne p1, v5, :cond_3

    .line 1860
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1861
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    const/4 v4, 0x3

    invoke-virtual {p0, v3, p2, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(III)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1863
    :cond_3
    return-object v4

    .line 1865
    .end local v2    # "ptr":I
    .restart local v3    # "ptr":I
    :cond_4
    if-ne p1, v5, :cond_5

    .line 1866
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1867
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    const/4 v4, 0x2

    invoke-virtual {p0, v2, p2, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(III)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1869
    :cond_5
    return-object v4

    .line 1871
    .end local v3    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_6
    if-ne p1, v5, :cond_7

    .line 1872
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1873
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    const/4 v4, 0x1

    invoke-virtual {p0, v3, p2, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(III)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1875
    :cond_7
    return-object v4
.end method

.method private final _parseMediumName2(III)Ljava/lang/String;
    .locals 6
    .param p1, "ptr"    # I
    .param p2, "q3"    # I
    .param p3, "q2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1880
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 1881
    .local v0, "input":[B
    sget-object v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icLatin1:[I

    .line 1884
    .local v1, "codes":[I
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "ptr":I
    .local v2, "ptr":I
    aget-byte p1, v0, p1

    and-int/lit16 p1, p1, 0xff

    .line 1885
    .local p1, "i":I
    aget v3, v1, p1

    const/4 v4, 0x0

    const/16 v5, 0x22

    if-eqz v3, :cond_1

    .line 1886
    if-ne p1, v5, :cond_0

    .line 1887
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1888
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    const/4 v4, 0x1

    invoke-virtual {p0, v3, p3, p2, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(IIII)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1890
    :cond_0
    return-object v4

    .line 1892
    :cond_1
    shl-int/lit8 v3, p2, 0x8

    or-int p2, v3, p1

    .line 1893
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "ptr":I
    .local v3, "ptr":I
    aget-byte v2, v0, v2

    and-int/lit16 p1, v2, 0xff

    .line 1894
    aget v2, v1, p1

    if-eqz v2, :cond_3

    .line 1895
    if-ne p1, v5, :cond_2

    .line 1896
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1897
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    const/4 v4, 0x2

    invoke-virtual {p0, v2, p3, p2, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1899
    :cond_2
    return-object v4

    .line 1901
    :cond_3
    shl-int/lit8 v2, p2, 0x8

    or-int p2, v2, p1

    .line 1902
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "ptr":I
    .restart local v2    # "ptr":I
    aget-byte v3, v0, v3

    and-int/lit16 p1, v3, 0xff

    .line 1903
    aget v3, v1, p1

    if-eqz v3, :cond_5

    .line 1904
    if-ne p1, v5, :cond_4

    .line 1905
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1906
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    const/4 v4, 0x3

    invoke-virtual {p0, v3, p3, p2, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(IIII)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1908
    :cond_4
    return-object v4

    .line 1910
    :cond_5
    shl-int/lit8 v3, p2, 0x8

    or-int p2, v3, p1

    .line 1911
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "ptr":I
    .restart local v3    # "ptr":I
    aget-byte v2, v0, v2

    and-int/lit16 p1, v2, 0xff

    .line 1912
    if-ne p1, v5, :cond_6

    .line 1913
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1914
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quad1:I

    const/4 v4, 0x4

    invoke-virtual {p0, v2, p3, p2, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_findName(IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1917
    :cond_6
    return-object v4
.end method

.method private final _skipWS(I)I
    .locals 4
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 923
    nop

    :cond_0
    const/16 v0, 0x20

    if-eq p1, v0, :cond_3

    .line 924
    const/16 v1, 0xa

    if-ne p1, v1, :cond_1

    .line 925
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    .line 926
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    goto :goto_0

    .line 927
    :cond_1
    const/16 v1, 0xd

    if-ne p1, v1, :cond_2

    .line 928
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    .line 929
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    goto :goto_0

    .line 930
    :cond_2
    const/16 v1, 0x9

    if-eq p1, v1, :cond_3

    .line 931
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwInvalidSpace(I)V

    .line 934
    :cond_3
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_4

    .line 935
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 936
    const/4 v0, 0x0

    return v0

    .line 938
    :cond_4
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 p1, v1, 0xff

    .line 939
    if-le p1, v0, :cond_0

    .line 940
    return p1
.end method

.method private final _startAfterComment(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "fromMinorState"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1057
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 1058
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1059
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1061
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 1062
    .local v0, "ch":I
    sparse-switch p1, :sswitch_data_0

    .line 1077
    invoke-static {}, Lcom/fasterxml/jackson/core/util/VersionUtil;->throwInternal()V

    .line 1078
    const/4 v1, 0x0

    return-object v1

    .line 1074
    :sswitch_0
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValueAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1072
    :sswitch_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValueExpectColon(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1070
    :sswitch_2
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValueExpectComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1068
    :sswitch_3
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1066
    :sswitch_4
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFieldNameAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1064
    :sswitch_5
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFieldName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_5
        0x5 -> :sswitch_4
        0xc -> :sswitch_3
        0xd -> :sswitch_2
        0xe -> :sswitch_1
        0xf -> :sswitch_0
    .end sparse-switch
.end method

.method private final _startDocument(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 411
    and-int/lit16 p1, p1, 0xff

    .line 414
    const/16 v0, 0xef

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    if-eq v0, v1, :cond_0

    .line 415
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishBOM(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 419
    :cond_0
    :goto_0
    const/16 v0, 0x20

    if-gt p1, v0, :cond_7

    .line 420
    if-eq p1, v0, :cond_3

    .line 421
    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 422
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRow:I

    .line 423
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    goto :goto_1

    .line 424
    :cond_1
    const/16 v0, 0xd

    if-ne p1, v0, :cond_2

    .line 425
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowAlt:I

    .line 426
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    goto :goto_1

    .line 427
    :cond_2
    const/16 v0, 0x9

    if-eq p1, v0, :cond_3

    .line 428
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_throwInvalidSpace(I)V

    .line 431
    :cond_3
    :goto_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v2, :cond_6

    .line 432
    const/4 v0, 0x3

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 433
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closed:Z

    if-eqz v0, :cond_4

    .line 434
    const/4 v0, 0x0

    return-object v0

    .line 437
    :cond_4
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_endOfInput:Z

    if-eqz v0, :cond_5

    .line 438
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 440
    :cond_5
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 442
    :cond_6
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v2

    and-int/lit16 p1, v0, 0xff

    goto :goto_0

    .line 444
    :cond_7
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method private final _startFieldName(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 492
    const/16 v0, 0x20

    if-gt p1, v0, :cond_0

    .line 493
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 494
    if-gtz p1, :cond_0

    .line 495
    const/4 v0, 0x4

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 496
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 499
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_updateTokenLocation()V

    .line 500
    const/16 v0, 0x22

    if-eq p1, v0, :cond_2

    .line 501
    const/16 v0, 0x7d

    if-ne p1, v0, :cond_1

    .line 502
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 504
    :cond_1
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_handleOddName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 507
    :cond_2
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0xd

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-gt v0, v1, :cond_3

    .line 508
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fastParseName()Ljava/lang/String;

    move-result-object v0

    .line 509
    .local v0, "n":Ljava/lang/String;
    if-eqz v0, :cond_3

    .line 510
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 513
    .end local v0    # "n":Ljava/lang/String;
    :cond_3
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method private final _startFieldNameAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 519
    const/4 v0, 0x5

    const/16 v1, 0x20

    if-gt p1, v1, :cond_0

    .line 520
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 521
    if-gtz p1, :cond_0

    .line 522
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 523
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 526
    :cond_0
    const/16 v2, 0x2c

    const/16 v3, 0x7d

    if-eq p1, v2, :cond_4

    .line 527
    if-ne p1, v3, :cond_1

    .line 528
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 530
    :cond_1
    const/16 v2, 0x23

    if-ne p1, v2, :cond_2

    .line 531
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 533
    :cond_2
    const/16 v2, 0x2f

    if-ne p1, v2, :cond_3

    .line 534
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 536
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "was expecting comma to separate "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->typeDesc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " entries"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 538
    :cond_4
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 539
    .local v0, "ptr":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/4 v4, 0x4

    if-lt v0, v2, :cond_5

    .line 540
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 541
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 543
    :cond_5
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    aget-byte p1, v2, v0

    .line 544
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 545
    if-gt p1, v1, :cond_6

    .line 546
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 547
    if-gtz p1, :cond_6

    .line 548
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 549
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 552
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_updateTokenLocation()V

    .line 553
    const/16 v1, 0x22

    if-eq p1, v1, :cond_8

    .line 554
    if-ne p1, v3, :cond_7

    .line 555
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_TRAILING_COMMA:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_features:I

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->enabledIn(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 556
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 559
    :cond_7
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_handleOddName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 562
    :cond_8
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0xd

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-gt v1, v2, :cond_9

    .line 563
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fastParseName()Ljava/lang/String;

    move-result-object v1

    .line 564
    .local v1, "n":Ljava/lang/String;
    if-eqz v1, :cond_9

    .line 565
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 568
    .end local v1    # "n":Ljava/lang/String;
    :cond_9
    const/4 v1, 0x0

    invoke-direct {p0, v1, v1, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method private final _startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "fromMinorState"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 945
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_features:I

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->enabledIn(I)Z

    move-result v0

    const/16 v1, 0x2f

    if-nez v0, :cond_0

    .line 946
    const-string v0, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 950
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v2, :cond_1

    .line 951
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 952
    const/16 v0, 0x33

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 953
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 955
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v2

    .line 956
    .local v0, "ch":I
    const/16 v2, 0x2a

    if-ne v0, v2, :cond_2

    .line 957
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishCComment(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 959
    :cond_2
    if-ne v0, v1, :cond_3

    .line 960
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishCppComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 962
    :cond_3
    and-int/lit16 v1, v0, 0xff

    const-string/jumbo v2, "was expecting either \'*\' or \'/\' for a comment"

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 963
    const/4 v1, 0x0

    return-object v1
.end method

.method private final _startValue(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 585
    const/16 v0, 0x20

    const/16 v1, 0xc

    if-gt p1, v0, :cond_0

    .line 586
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 587
    if-gtz p1, :cond_0

    .line 588
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 589
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 592
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_updateTokenLocation()V

    .line 593
    const/16 v0, 0x22

    if-ne p1, v0, :cond_1

    .line 594
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 596
    :cond_1
    sparse-switch p1, :sswitch_data_0

    .line 635
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 632
    :sswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 630
    :sswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 624
    :sswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 622
    :sswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNullToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 620
    :sswitch_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 628
    :sswitch_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 626
    :sswitch_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 618
    :sswitch_7
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 608
    :sswitch_8
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 602
    :sswitch_9
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 600
    :sswitch_a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 598
    :sswitch_b
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x23 -> :sswitch_b
        0x2d -> :sswitch_a
        0x2f -> :sswitch_9
        0x30 -> :sswitch_8
        0x31 -> :sswitch_7
        0x32 -> :sswitch_7
        0x33 -> :sswitch_7
        0x34 -> :sswitch_7
        0x35 -> :sswitch_7
        0x36 -> :sswitch_7
        0x37 -> :sswitch_7
        0x38 -> :sswitch_7
        0x39 -> :sswitch_7
        0x5b -> :sswitch_6
        0x5d -> :sswitch_5
        0x66 -> :sswitch_4
        0x6e -> :sswitch_3
        0x74 -> :sswitch_2
        0x7b -> :sswitch_1
        0x7d -> :sswitch_0
    .end sparse-switch
.end method

.method private final _startValueAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 815
    const/16 v0, 0x20

    const/16 v1, 0xf

    if-gt p1, v0, :cond_0

    .line 816
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 817
    if-gtz p1, :cond_0

    .line 818
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 819
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 822
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_updateTokenLocation()V

    .line 823
    const/16 v0, 0x22

    if-ne p1, v0, :cond_1

    .line 824
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 826
    :cond_1
    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 867
    :sswitch_0
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_TRAILING_COMMA:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 868
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 864
    :sswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 854
    :sswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 852
    :sswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNullToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 850
    :sswitch_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 859
    :sswitch_5
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_TRAILING_COMMA:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 860
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 856
    :sswitch_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 848
    :sswitch_7
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 838
    :sswitch_8
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 832
    :sswitch_9
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 830
    :sswitch_a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 828
    :sswitch_b
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 873
    :cond_2
    :goto_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x23 -> :sswitch_b
        0x2d -> :sswitch_a
        0x2f -> :sswitch_9
        0x30 -> :sswitch_8
        0x31 -> :sswitch_7
        0x32 -> :sswitch_7
        0x33 -> :sswitch_7
        0x34 -> :sswitch_7
        0x35 -> :sswitch_7
        0x36 -> :sswitch_7
        0x37 -> :sswitch_7
        0x38 -> :sswitch_7
        0x39 -> :sswitch_7
        0x5b -> :sswitch_6
        0x5d -> :sswitch_5
        0x66 -> :sswitch_4
        0x6e -> :sswitch_3
        0x74 -> :sswitch_2
        0x7b -> :sswitch_1
        0x7d -> :sswitch_0
    .end sparse-switch
.end method

.method private final _startValueExpectColon(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 740
    const/16 v0, 0xe

    const/16 v1, 0x20

    if-gt p1, v1, :cond_0

    .line 741
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 742
    if-gtz p1, :cond_0

    .line 743
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 744
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 747
    :cond_0
    const/16 v2, 0x3a

    if-eq p1, v2, :cond_3

    .line 748
    const/16 v2, 0x2f

    if-ne p1, v2, :cond_1

    .line 749
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 751
    :cond_1
    const/16 v2, 0x23

    if-ne p1, v2, :cond_2

    .line 752
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 755
    :cond_2
    const-string/jumbo v0, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 757
    :cond_3
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 758
    .local v0, "ptr":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/16 v3, 0xc

    if-lt v0, v2, :cond_4

    .line 759
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 760
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 762
    :cond_4
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    aget-byte p1, v2, v0

    .line 763
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 764
    if-gt p1, v1, :cond_5

    .line 765
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 766
    if-gtz p1, :cond_5

    .line 767
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 768
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 771
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_updateTokenLocation()V

    .line 772
    const/16 v1, 0x22

    if-ne p1, v1, :cond_6

    .line 773
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 775
    :cond_6
    sparse-switch p1, :sswitch_data_0

    .line 807
    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 804
    :sswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 800
    :sswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 798
    :sswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNullToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 796
    :sswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 802
    :sswitch_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 794
    :sswitch_5
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 787
    :sswitch_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 781
    :sswitch_7
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 779
    :sswitch_8
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 777
    :sswitch_9
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    :sswitch_data_0
    .sparse-switch
        0x23 -> :sswitch_9
        0x2d -> :sswitch_8
        0x2f -> :sswitch_7
        0x30 -> :sswitch_6
        0x31 -> :sswitch_5
        0x32 -> :sswitch_5
        0x33 -> :sswitch_5
        0x34 -> :sswitch_5
        0x35 -> :sswitch_5
        0x36 -> :sswitch_5
        0x37 -> :sswitch_5
        0x38 -> :sswitch_5
        0x39 -> :sswitch_5
        0x5b -> :sswitch_4
        0x66 -> :sswitch_3
        0x6e -> :sswitch_2
        0x74 -> :sswitch_1
        0x7b -> :sswitch_0
    .end sparse-switch
.end method

.method private final _startValueExpectComma(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 645
    const/16 v0, 0xd

    const/16 v1, 0x20

    if-gt p1, v1, :cond_0

    .line 646
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 647
    if-gtz p1, :cond_0

    .line 648
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 649
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 652
    :cond_0
    const/16 v2, 0x2c

    if-eq p1, v2, :cond_5

    .line 653
    const/16 v2, 0x5d

    if-ne p1, v2, :cond_1

    .line 654
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 656
    :cond_1
    const/16 v2, 0x7d

    if-ne p1, v2, :cond_2

    .line 657
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 659
    :cond_2
    const/16 v2, 0x2f

    if-ne p1, v2, :cond_3

    .line 660
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 662
    :cond_3
    const/16 v2, 0x23

    if-ne p1, v2, :cond_4

    .line 663
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 665
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "was expecting comma to separate "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->typeDesc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " entries"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 667
    :cond_5
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 668
    .local v0, "ptr":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/16 v3, 0xf

    if-lt v0, v2, :cond_6

    .line 669
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 670
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 672
    :cond_6
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    aget-byte p1, v2, v0

    .line 673
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 674
    if-gt p1, v1, :cond_7

    .line 675
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_skipWS(I)I

    move-result p1

    .line 676
    if-gtz p1, :cond_7

    .line 677
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 678
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 681
    :cond_7
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_updateTokenLocation()V

    .line 682
    const/16 v1, 0x22

    if-ne p1, v1, :cond_8

    .line 683
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 685
    :cond_8
    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 723
    :sswitch_0
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_TRAILING_COMMA:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 724
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 720
    :sswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 710
    :sswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 708
    :sswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNullToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 706
    :sswitch_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 715
    :sswitch_5
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_TRAILING_COMMA:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 716
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 712
    :sswitch_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 704
    :sswitch_7
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 697
    :sswitch_8
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 691
    :sswitch_9
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 689
    :sswitch_a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 687
    :sswitch_b
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 729
    :cond_9
    :goto_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    :sswitch_data_0
    .sparse-switch
        0x23 -> :sswitch_b
        0x2d -> :sswitch_a
        0x2f -> :sswitch_9
        0x30 -> :sswitch_8
        0x31 -> :sswitch_7
        0x32 -> :sswitch_7
        0x33 -> :sswitch_7
        0x34 -> :sswitch_7
        0x35 -> :sswitch_7
        0x36 -> :sswitch_7
        0x37 -> :sswitch_7
        0x38 -> :sswitch_7
        0x39 -> :sswitch_7
        0x5b -> :sswitch_6
        0x5d -> :sswitch_5
        0x66 -> :sswitch_4
        0x6e -> :sswitch_3
        0x74 -> :sswitch_2
        0x7b -> :sswitch_1
        0x7d -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method protected _decodeEscaped()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 138
    invoke-static {}, Lcom/fasterxml/jackson/core/util/VersionUtil;->throwInternal()V

    .line 139
    const/16 v0, 0x20

    return v0
.end method

.method protected _finishErrorToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1225
    nop

    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-ge v0, v1, :cond_1

    .line 1226
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    .line 1231
    .local v0, "i":I
    int-to-char v1, v0

    .line 1232
    .local v1, "ch":C
    invoke-static {v1}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1235
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 1236
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v2

    const/16 v3, 0x100

    if-ge v2, v3, :cond_0

    .line 1237
    goto :goto_0

    .line 1240
    :cond_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportErrorToken(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 1242
    .end local v0    # "i":I
    .end local v1    # "ch":C
    :cond_1
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0
.end method

.method protected _finishErrorTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1247
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportErrorToken(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected final _finishFieldWithEscape()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2236
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quoted32:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quotedDigits:I

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitEscaped(II)I

    move-result v0

    .line 2237
    .local v0, "ch":I
    if-gez v0, :cond_0

    .line 2238
    const/16 v1, 0x8

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 2239
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 2241
    :cond_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    array-length v2, v2

    if-lt v1, v2, :cond_1

    .line 2242
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    const/16 v2, 0x20

    invoke-static {v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->growArrayBy([II)[I

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    .line 2244
    :cond_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 2245
    .local v1, "currQuad":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    .line 2246
    .local v2, "currQuadBytes":I
    const/16 v3, 0x7f

    const/4 v4, 0x4

    if-le v0, v3, :cond_5

    .line 2248
    if-lt v2, v4, :cond_2

    .line 2249
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    aput v1, v3, v5

    .line 2250
    const/4 v1, 0x0

    .line 2251
    const/4 v2, 0x0

    .line 2253
    :cond_2
    const/16 v3, 0x800

    if-ge v0, v3, :cond_3

    .line 2254
    shl-int/lit8 v3, v1, 0x8

    shr-int/lit8 v5, v0, 0x6

    or-int/lit16 v5, v5, 0xc0

    or-int v1, v3, v5

    .line 2255
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2258
    :cond_3
    shl-int/lit8 v3, v1, 0x8

    shr-int/lit8 v5, v0, 0xc

    or-int/lit16 v5, v5, 0xe0

    or-int v1, v3, v5

    .line 2260
    add-int/lit8 v2, v2, 0x1

    if-lt v2, v4, :cond_4

    .line 2261
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    aput v1, v3, v5

    .line 2262
    const/4 v1, 0x0

    .line 2263
    const/4 v2, 0x0

    .line 2265
    :cond_4
    shl-int/lit8 v3, v1, 0x8

    shr-int/lit8 v5, v0, 0x6

    and-int/lit8 v5, v5, 0x3f

    or-int/lit16 v5, v5, 0x80

    or-int v1, v3, v5

    .line 2266
    add-int/lit8 v2, v2, 0x1

    .line 2269
    :goto_0
    and-int/lit8 v3, v0, 0x3f

    or-int/lit16 v0, v3, 0x80

    .line 2271
    :cond_5
    if-ge v2, v4, :cond_6

    .line 2272
    add-int/lit8 v2, v2, 0x1

    .line 2273
    shl-int/lit8 v3, v1, 0x8

    or-int v1, v3, v0

    goto :goto_1

    .line 2275
    :cond_6
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadBuffer:[I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    aput v1, v3, v4

    .line 2276
    move v1, v0

    .line 2277
    const/4 v2, 0x1

    .line 2279
    :goto_1
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    const/16 v4, 0x9

    if-ne v3, v4, :cond_7

    .line 2280
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    invoke-direct {p0, v3, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 2282
    :cond_7
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    invoke-direct {p0, v3, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3
.end method

.method protected _finishFloatExponent(ZI)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .param p1, "checkSign"    # Z
    .param p2, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1727
    if-eqz p1, :cond_2

    .line 1728
    const/16 v0, 0x20

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1729
    const/16 v1, 0x2d

    if-eq p2, v1, :cond_0

    const/16 v1, 0x2b

    if-ne p2, v1, :cond_2

    .line 1730
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v2, p2

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 1731
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_1

    .line 1732
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1733
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1734
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1736
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p2, v0, v1

    .line 1740
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v0

    .line 1741
    .local v0, "outBuf":[C
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v1

    .line 1742
    .local v1, "outPtr":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1744
    .local v2, "expLen":I
    :goto_0
    const/16 v3, 0x30

    if-lt p2, v3, :cond_5

    const/16 v3, 0x39

    if-gt p2, v3, :cond_5

    .line 1745
    add-int/lit8 v2, v2, 0x1

    .line 1746
    array-length v3, v0

    if-lt v1, v3, :cond_3

    .line 1747
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v0

    .line 1749
    :cond_3
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "outPtr":I
    .local v3, "outPtr":I
    int-to-char v4, p2

    aput-char v4, v0, v1

    .line 1750
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v1, v4, :cond_4

    .line 1751
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1752
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1753
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 1755
    :cond_4
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p2, v1, v4

    move v1, v3

    goto :goto_0

    .line 1758
    .end local v3    # "outPtr":I
    .restart local v1    # "outPtr":I
    :cond_5
    and-int/lit16 p2, p2, 0xff

    .line 1759
    if-nez v2, :cond_6

    .line 1760
    const-string v3, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1763
    :cond_6
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1764
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1766
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1767
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3
.end method

.method protected _finishFloatFraction()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1678
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fractLength:I

    .line 1679
    .local v0, "fractLen":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v1

    .line 1680
    .local v1, "outBuf":[C
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v2

    .line 1684
    .local v2, "outPtr":I
    :goto_0
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    move v4, v3

    .local v4, "ch":I
    const/16 v5, 0x30

    if-lt v3, v5, :cond_2

    const/16 v3, 0x39

    if-gt v4, v3, :cond_2

    .line 1685
    add-int/lit8 v0, v0, 0x1

    .line 1686
    array-length v3, v1

    if-lt v2, v3, :cond_0

    .line 1687
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v1

    .line 1689
    :cond_0
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "outPtr":I
    .local v3, "outPtr":I
    int-to-char v5, v4

    aput-char v5, v1, v2

    .line 1690
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v2, v5, :cond_1

    .line 1691
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1692
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fractLength:I

    .line 1693
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v2

    .line 1690
    :cond_1
    move v2, v3

    goto :goto_0

    .line 1699
    .end local v3    # "outPtr":I
    .restart local v2    # "outPtr":I
    :cond_2
    if-nez v0, :cond_3

    .line 1700
    const-string v3, "Decimal point not followed by a digit"

    invoke-virtual {p0, v4, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1702
    :cond_3
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fractLength:I

    .line 1703
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1706
    const/16 v3, 0x65

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v4, v3, :cond_5

    const/16 v3, 0x45

    if-ne v4, v3, :cond_4

    goto :goto_1

    .line 1718
    :cond_4
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    sub-int/2addr v3, v6

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1719
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1721
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1722
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 1707
    :cond_5
    :goto_1
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v7, v4

    invoke-virtual {v3, v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 1708
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1709
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v3, v5, :cond_6

    .line 1710
    const/16 v3, 0x1f

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1711
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v3

    .line 1713
    :cond_6
    const/16 v3, 0x20

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1714
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v3, v3, v5

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {p0, v6, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishFloatExponent(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3
.end method

.method protected _finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "expToken"    # Ljava/lang/String;
    .param p2, "matched"    # I
    .param p3, "result"    # Lcom/fasterxml/jackson/core/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1148
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1151
    .local v0, "end":I
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_0

    .line 1152
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 1153
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 1155
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    .line 1156
    .local v1, "ch":I
    if-ne p2, v0, :cond_2

    .line 1157
    const/16 v2, 0x30

    if-lt v1, v2, :cond_1

    const/16 v2, 0x5d

    if-eq v1, v2, :cond_1

    const/16 v2, 0x7d

    if-ne v1, v2, :cond_3

    .line 1158
    :cond_1
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 1162
    :cond_2
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_4

    .line 1163
    nop

    .line 1168
    .end local v1    # "ch":I
    :cond_3
    const/16 v1, 0x32

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1169
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy(Ljava/lang/String;II)V

    .line 1170
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishErrorToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1165
    .restart local v1    # "ch":I
    :cond_4
    add-int/lit8 p2, p2, 0x1

    .line 1166
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1167
    .end local v1    # "ch":I
    goto :goto_0
.end method

.method protected _finishKeywordTokenWithEOF(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .param p1, "expToken"    # Ljava/lang/String;
    .param p2, "matched"    # I
    .param p3, "result"    # Lcom/fasterxml/jackson/core/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1176
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 1177
    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p3

    .line 1179
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy(Ljava/lang/String;II)V

    .line 1180
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishErrorTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "type"    # I
    .param p2, "matched"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1185
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_nonStdToken(I)Ljava/lang/String;

    move-result-object v0

    .line 1186
    .local v0, "expToken":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1189
    .local v1, "end":I
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_0

    .line 1190
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_nonStdTokenType:I

    .line 1191
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    .line 1192
    const/16 v2, 0x13

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1193
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v2

    .line 1195
    :cond_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    .line 1196
    .local v2, "ch":I
    if-ne p2, v1, :cond_2

    .line 1197
    const/16 v3, 0x30

    if-lt v2, v3, :cond_1

    const/16 v3, 0x5d

    if-eq v2, v3, :cond_1

    const/16 v3, 0x7d

    if-ne v2, v3, :cond_3

    .line 1198
    :cond_1
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueNonStdNumberComplete(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 1202
    :cond_2
    invoke-virtual {v0, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_4

    .line 1203
    nop

    .line 1208
    .end local v2    # "ch":I
    :cond_3
    const/16 v2, 0x32

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1209
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy(Ljava/lang/String;II)V

    .line 1210
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishErrorToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 1205
    .restart local v2    # "ch":I
    :cond_4
    add-int/lit8 p2, p2, 0x1

    .line 1206
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1207
    .end local v2    # "ch":I
    goto :goto_0
.end method

.method protected _finishNonStdTokenWithEOF(II)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "type"    # I
    .param p2, "matched"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1215
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_nonStdToken(I)Ljava/lang/String;

    move-result-object v0

    .line 1216
    .local v0, "expToken":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ne p2, v1, :cond_0

    .line 1217
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueNonStdNumberComplete(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1219
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy(Ljava/lang/String;II)V

    .line 1220
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishErrorTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected _finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1552
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_numberNegative:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1555
    .local v0, "negMod":I
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_1

    .line 1556
    const/16 v1, 0x1a

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1557
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1558
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 1560
    :cond_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    .line 1561
    .local v1, "ch":I
    const/16 v2, 0x30

    if-ge v1, v2, :cond_2

    .line 1562
    const/16 v2, 0x2e

    if-ne v1, v2, :cond_3

    .line 1563
    add-int v2, p2, v0

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1564
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1565
    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 1569
    :cond_2
    const/16 v2, 0x39

    if-le v1, v2, :cond_5

    .line 1570
    const/16 v2, 0x65

    if-eq v1, v2, :cond_4

    const/16 v2, 0x45

    if-ne v1, v2, :cond_3

    goto :goto_1

    .line 1585
    .end local v1    # "ch":I
    :cond_3
    add-int v1, p2, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1586
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1587
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1571
    .restart local v1    # "ch":I
    :cond_4
    :goto_1
    add-int v2, p2, v0

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1572
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1573
    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 1577
    :cond_5
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1578
    array-length v2, p1

    if-lt p2, v2, :cond_6

    .line 1581
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    .line 1583
    :cond_6
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "outPtr":I
    .local v2, "outPtr":I
    int-to-char v3, v1

    aput-char v3, p1, p2

    .line 1584
    .end local v1    # "ch":I
    move p2, v2

    goto :goto_0
.end method

.method protected _finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1501
    nop

    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 1502
    const/16 v0, 0x19

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1503
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1505
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 1506
    .local v0, "ch":I
    const/4 v1, 0x2

    const/16 v2, 0x2d

    const/4 v3, 0x0

    const/16 v4, 0x30

    const/4 v5, 0x1

    if-ge v0, v4, :cond_1

    .line 1507
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_3

    .line 1508
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v6

    .line 1509
    .local v6, "outBuf":[C
    aput-char v2, v6, v3

    .line 1510
    aput-char v4, v6, v5

    .line 1511
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1512
    invoke-virtual {p0, v6, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1514
    .end local v6    # "outBuf":[C
    :cond_1
    const/16 v6, 0x39

    if-le v0, v6, :cond_5

    .line 1515
    const/16 v6, 0x65

    if-eq v0, v6, :cond_4

    const/16 v6, 0x45

    if-ne v0, v6, :cond_2

    goto :goto_1

    .line 1525
    :cond_2
    const/16 v1, 0x5d

    if-eq v0, v1, :cond_3

    const/16 v1, 0x7d

    if-eq v0, v1, :cond_3

    .line 1526
    const-string v1, "expected digit (0-9), decimal point (.) or exponent indicator (e/E) to follow \'0\'"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1545
    :cond_3
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    sub-int/2addr v1, v5

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1546
    const-string v1, "0"

    invoke-virtual {p0, v3, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueCompleteInt(ILjava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1516
    :cond_4
    :goto_1
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v6

    .line 1517
    .restart local v6    # "outBuf":[C
    aput-char v2, v6, v3

    .line 1518
    aput-char v4, v6, v5

    .line 1519
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1520
    invoke-virtual {p0, v6, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1532
    .end local v6    # "outBuf":[C
    :cond_5
    sget-object v6, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NUMERIC_LEADING_ZEROS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 1533
    const-string v6, "Leading zeroes not allowed"

    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportInvalidNumber(Ljava/lang/String;)V

    .line 1535
    :cond_6
    if-ne v0, v4, :cond_7

    .line 1536
    goto :goto_0

    .line 1538
    :cond_7
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 1540
    .local v4, "outBuf":[C
    aput-char v2, v4, v3

    .line 1541
    int-to-char v2, v0

    aput-char v2, v4, v5

    .line 1542
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1543
    invoke-virtual {p0, v4, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected _finishNumberLeadingZeroes()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1450
    nop

    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 1451
    const/16 v0, 0x18

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1452
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1454
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 1455
    .local v0, "ch":I
    const/4 v1, 0x0

    const/16 v2, 0x30

    const/4 v3, 0x1

    if-ge v0, v2, :cond_1

    .line 1456
    const/16 v4, 0x2e

    if-ne v0, v4, :cond_3

    .line 1457
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 1458
    .local v4, "outBuf":[C
    aput-char v2, v4, v1

    .line 1459
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1460
    invoke-virtual {p0, v4, v3, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1462
    .end local v4    # "outBuf":[C
    :cond_1
    const/16 v4, 0x39

    if-le v0, v4, :cond_5

    .line 1463
    const/16 v4, 0x65

    if-eq v0, v4, :cond_4

    const/16 v4, 0x45

    if-ne v0, v4, :cond_2

    goto :goto_1

    .line 1472
    :cond_2
    const/16 v2, 0x5d

    if-eq v0, v2, :cond_3

    const/16 v2, 0x7d

    if-eq v0, v2, :cond_3

    .line 1473
    const-string v2, "expected digit (0-9), decimal point (.) or exponent indicator (e/E) to follow \'0\'"

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1491
    :cond_3
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1492
    const-string v2, "0"

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueCompleteInt(ILjava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1464
    :cond_4
    :goto_1
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 1465
    .restart local v4    # "outBuf":[C
    aput-char v2, v4, v1

    .line 1466
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1467
    invoke-virtual {p0, v4, v3, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1479
    .end local v4    # "outBuf":[C
    :cond_5
    sget-object v4, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NUMERIC_LEADING_ZEROS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 1480
    const-string v4, "Leading zeroes not allowed"

    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportInvalidNumber(Ljava/lang/String;)V

    .line 1482
    :cond_6
    if-ne v0, v2, :cond_7

    .line 1483
    goto :goto_0

    .line 1485
    :cond_7
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    .line 1487
    .local v2, "outBuf":[C
    int-to-char v4, v0

    aput-char v4, v2, v1

    .line 1488
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1489
    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected _finishNumberMinus(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1427
    const-string v0, "expected digit (0-9) to follow minus sign, for valid numeric value"

    const/4 v1, 0x2

    const/16 v2, 0x30

    if-gt p1, v2, :cond_1

    .line 1428
    if-ne p1, v2, :cond_0

    .line 1429
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1431
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    goto :goto_0

    .line 1432
    :cond_1
    const/16 v2, 0x39

    if-le p1, v2, :cond_3

    .line 1433
    const/16 v2, 0x49

    if-ne p1, v2, :cond_2

    .line 1434
    const/4 v0, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1436
    :cond_2
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1438
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v0

    .line 1439
    .local v0, "outBuf":[C
    const/4 v2, 0x0

    const/16 v3, 0x2d

    aput-char v3, v0, v2

    .line 1440
    int-to-char v2, p1

    const/4 v3, 0x1

    aput-char v2, v0, v3

    .line 1441
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1442
    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected final _finishToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    const/4 v1, 0x0

    const/16 v2, 0x2d

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_0

    .line 326
    :pswitch_0
    invoke-static {}, Lcom/fasterxml/jackson/core/util/VersionUtil;->throwInternal()V

    .line 327
    const/4 v0, 0x0

    return-object v0

    .line 324
    :pswitch_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 322
    :pswitch_2
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishCppComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 320
    :pswitch_3
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishCComment(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 318
    :pswitch_4
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    invoke-direct {p0, v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishCComment(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 316
    :pswitch_5
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 311
    :pswitch_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishErrorToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 308
    :pswitch_7
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 286
    :pswitch_8
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    invoke-direct {p0, v0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitUTF8_4(III)Z

    move-result v0

    if-nez v0, :cond_0

    .line 287
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 289
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    if-ne v0, v2, :cond_1

    .line 290
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 292
    :cond_1
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 278
    :pswitch_9
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    invoke-direct {p0, v0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitUTF8_3(III)Z

    move-result v0

    if-nez v0, :cond_2

    .line 279
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 281
    :cond_2
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    if-ne v0, v2, :cond_3

    .line 282
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 284
    :cond_3
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 272
    :pswitch_a
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    invoke-direct {p0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeUTF8_2(II)I

    move-result v1

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 273
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    if-ne v0, v2, :cond_4

    .line 274
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 276
    :cond_4
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 296
    :pswitch_b
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quoted32:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quotedDigits:I

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_decodeSplitEscaped(II)I

    move-result v0

    .line 297
    .local v0, "c":I
    if-gez v0, :cond_5

    .line 298
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 300
    :cond_5
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v3, v0

    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 302
    .end local v0    # "c":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorStateAfterSplit:I

    if-ne v0, v2, :cond_6

    .line 303
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 305
    :cond_6
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 270
    :pswitch_c
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 267
    :pswitch_d
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v2

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishFloatExponent(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 265
    :pswitch_e
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v3, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishFloatExponent(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 263
    :pswitch_f
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishFloatFraction()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 260
    :pswitch_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 258
    :pswitch_11
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 256
    :pswitch_12
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberLeadingZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 254
    :pswitch_13
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberMinus(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 251
    :pswitch_14
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_nonStdTokenType:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 249
    :pswitch_15
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v2, "false"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 247
    :pswitch_16
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    const-string/jumbo v2, "true"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 245
    :pswitch_17
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v2, "null"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 238
    :pswitch_18
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValueAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 242
    :pswitch_19
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValueExpectColon(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 240
    :pswitch_1a
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValueExpectComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 236
    :pswitch_1b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 231
    :pswitch_1c
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    invoke-direct {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishUnquotedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 229
    :pswitch_1d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    invoke-direct {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 227
    :pswitch_1e
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishFieldWithEscape()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 225
    :pswitch_1f
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_quadLength:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pendingBytes:I

    invoke-direct {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 221
    :pswitch_20
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFieldNameAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 219
    :pswitch_21
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFieldName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 217
    :pswitch_22
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishBOM(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_22
        :pswitch_0
        :pswitch_0
        :pswitch_21
        :pswitch_20
        :pswitch_0
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_0
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected final _finishTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 339
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 340
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    const/4 v2, 0x0

    sparse-switch v1, :sswitch_data_0

    .line 399
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ": was expecting rest of token (internal state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidEOF(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 400
    return-object v0

    .line 356
    :sswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishErrorTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 382
    :sswitch_1
    const-string v1, ": was expecting fraction after exponent marker"

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidEOF(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 390
    :sswitch_2
    const-string v1, ": was expecting closing \'*/\' for comment"

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportInvalidEOF(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 395
    :sswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 376
    :sswitch_4
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 379
    :sswitch_5
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 367
    :sswitch_6
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v1

    .line 368
    .local v1, "len":I
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_numberNegative:Z

    if-eqz v2, :cond_0

    .line 369
    add-int/lit8 v1, v1, -0x1

    .line 371
    :cond_0
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 373
    .end local v1    # "len":I
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 363
    :sswitch_7
    const-string v1, "0"

    invoke-virtual {p0, v2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueCompleteInt(ILjava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 354
    :sswitch_8
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_nonStdTokenType:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNonStdTokenWithEOF(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 352
    :sswitch_9
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v3, "false"

    invoke-virtual {p0, v3, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordTokenWithEOF(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 350
    :sswitch_a
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    const-string/jumbo v3, "true"

    invoke-virtual {p0, v3, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordTokenWithEOF(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 348
    :sswitch_b
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_pending32:I

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v3, "null"

    invoke-virtual {p0, v3, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordTokenWithEOF(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 344
    :sswitch_c
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 342
    :sswitch_d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_d
        0xc -> :sswitch_c
        0x10 -> :sswitch_b
        0x11 -> :sswitch_a
        0x12 -> :sswitch_9
        0x13 -> :sswitch_8
        0x18 -> :sswitch_7
        0x19 -> :sswitch_7
        0x1a -> :sswitch_6
        0x1e -> :sswitch_4
        0x1f -> :sswitch_1
        0x20 -> :sswitch_5
        0x32 -> :sswitch_0
        0x34 -> :sswitch_2
        0x35 -> :sswitch_2
        0x36 -> :sswitch_3
        0x37 -> :sswitch_3
    .end sparse-switch
.end method

.method protected _reportErrorToken(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "actualToken"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1253
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\'null\', \'true\' or \'false\'"

    const-string v2, "Unrecognized token \'%s\': was expecting %s"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportError(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1255
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0
.end method

.method protected _startAposString()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2486
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2487
    .local v0, "ptr":I
    const/4 v1, 0x0

    .line 2488
    .local v1, "outPtr":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    .line 2489
    .local v2, "outBuf":[C
    sget-object v3, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icUTF8:[I

    .line 2491
    .local v3, "codes":[I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    array-length v5, v2

    add-int/2addr v5, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 2492
    .local v4, "max":I
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 2493
    .local v5, "inputBuffer":[B
    :goto_0
    if-ge v0, v4, :cond_2

    .line 2494
    aget-byte v6, v5, v0

    and-int/lit16 v6, v6, 0xff

    .line 2495
    .local v6, "c":I
    const/16 v7, 0x27

    if-ne v6, v7, :cond_0

    .line 2496
    add-int/lit8 v7, v0, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2497
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2498
    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    return-object v7

    .line 2501
    :cond_0
    aget v7, v3, v6

    if-eqz v7, :cond_1

    .line 2502
    goto :goto_1

    .line 2504
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 2505
    add-int/lit8 v7, v1, 0x1

    .end local v1    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v8, v6

    aput-char v8, v2, v1

    .line 2506
    .end local v6    # "c":I
    move v1, v7

    goto :goto_0

    .line 2507
    .end local v7    # "outPtr":I
    .restart local v1    # "outPtr":I
    :cond_2
    :goto_1
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2508
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2509
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    return-object v6
.end method

.method protected _startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1089
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1090
    .local v0, "ptr":I
    add-int/lit8 v1, v0, 0x4

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-ge v1, v2, :cond_2

    .line 1091
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 1092
    .local v1, "buf":[B
    add-int/lit8 v2, v0, 0x1

    .end local v0    # "ptr":I
    .local v2, "ptr":I
    aget-byte v0, v1, v0

    const/16 v3, 0x61

    if-ne v0, v3, :cond_1

    add-int/lit8 v0, v2, 0x1

    .end local v2    # "ptr":I
    .restart local v0    # "ptr":I
    aget-byte v2, v1, v2

    const/16 v3, 0x6c

    if-ne v2, v3, :cond_2

    add-int/lit8 v2, v0, 0x1

    .end local v0    # "ptr":I
    .restart local v2    # "ptr":I
    aget-byte v0, v1, v0

    const/16 v3, 0x73

    if-ne v0, v3, :cond_1

    add-int/lit8 v0, v2, 0x1

    .end local v2    # "ptr":I
    .restart local v0    # "ptr":I
    aget-byte v2, v1, v2

    const/16 v3, 0x65

    if-ne v2, v3, :cond_2

    .line 1096
    aget-byte v2, v1, v0

    and-int/lit16 v2, v2, 0xff

    .line 1097
    .local v2, "ch":I
    const/16 v3, 0x30

    if-lt v2, v3, :cond_0

    const/16 v3, 0x5d

    if-eq v2, v3, :cond_0

    const/16 v3, 0x7d

    if-ne v2, v3, :cond_2

    .line 1098
    :cond_0
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1099
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 1092
    .end local v0    # "ptr":I
    .local v2, "ptr":I
    :cond_1
    move v0, v2

    .line 1103
    .end local v1    # "buf":[B
    .end local v2    # "ptr":I
    .restart local v0    # "ptr":I
    :cond_2
    const/16 v1, 0x12

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1104
    const-string v1, "false"

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected _startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .param p3, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1592
    const/4 v0, 0x0

    .line 1593
    .local v0, "fractLen":I
    const/16 v1, 0x39

    const/16 v2, 0x30

    const/16 v3, 0x2e

    if-ne p3, v3, :cond_5

    .line 1594
    array-length v4, p1

    if-lt p2, v4, :cond_0

    .line 1595
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    .line 1597
    :cond_0
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "outPtr":I
    .local v4, "outPtr":I
    aput-char v3, p1, p2

    move p2, v4

    .line 1599
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_0
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_1

    .line 1600
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1601
    const/16 v1, 0x1e

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1602
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fractLength:I

    .line 1603
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 1605
    :cond_1
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p3, v3, v4

    .line 1606
    if-lt p3, v2, :cond_4

    if-le p3, v1, :cond_2

    goto :goto_1

    .line 1614
    :cond_2
    array-length v3, p1

    if-lt p2, v3, :cond_3

    .line 1615
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    .line 1617
    :cond_3
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .local v3, "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1618
    add-int/lit8 v0, v0, 0x1

    move p2, v3

    goto :goto_0

    .line 1607
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :cond_4
    :goto_1
    and-int/lit16 p3, p3, 0xff

    .line 1609
    if-nez v0, :cond_5

    .line 1610
    const-string v3, "Decimal point not followed by a digit"

    invoke-virtual {p0, p3, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1621
    :cond_5
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_fractLength:I

    .line 1622
    const/4 v3, 0x0

    .line 1623
    .local v3, "expLen":I
    const/16 v4, 0x65

    if-eq p3, v4, :cond_6

    const/16 v4, 0x45

    if-ne p3, v4, :cond_11

    .line 1624
    :cond_6
    array-length v4, p1

    if-lt p2, v4, :cond_7

    .line 1625
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    .line 1627
    :cond_7
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    int-to-char v5, p3

    aput-char v5, p1, p2

    .line 1628
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/4 v6, 0x0

    if-lt p2, v5, :cond_8

    .line 1629
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p2, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1630
    const/16 p2, 0x1f

    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1631
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1632
    sget-object p2, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p2

    .line 1634
    :cond_8
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p2, p2, v5

    .line 1635
    .end local p3    # "ch":I
    .local p2, "ch":I
    const/16 p3, 0x2d

    const/16 v5, 0x20

    if-eq p2, p3, :cond_a

    const/16 p3, 0x2b

    if-ne p2, p3, :cond_9

    goto :goto_2

    :cond_9
    move p3, v4

    goto :goto_3

    .line 1636
    :cond_a
    :goto_2
    array-length p3, p1

    if-lt v4, p3, :cond_b

    .line 1637
    iget-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    .line 1639
    :cond_b
    add-int/lit8 p3, v4, 0x1

    .end local v4    # "outPtr":I
    .local p3, "outPtr":I
    int-to-char v7, p2

    aput-char v7, p1, v4

    .line 1640
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v4, v7, :cond_c

    .line 1641
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1642
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1643
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1644
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 1646
    :cond_c
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p2, v4, v6

    .line 1648
    :goto_3
    if-lt p2, v2, :cond_f

    if-gt p2, v1, :cond_f

    .line 1649
    add-int/lit8 v3, v3, 0x1

    .line 1650
    array-length v4, p1

    if-lt p3, v4, :cond_d

    .line 1651
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    .line 1653
    :cond_d
    add-int/lit8 v4, p3, 0x1

    .end local p3    # "outPtr":I
    .restart local v4    # "outPtr":I
    int-to-char v6, p2

    aput-char v6, p1, p3

    .line 1654
    iget p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt p3, v6, :cond_e

    .line 1655
    iget-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p3, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1656
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1657
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1658
    sget-object p3, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p3

    .line 1660
    :cond_e
    iget-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte p2, p3, v6

    move p3, v4

    goto :goto_3

    .line 1663
    .end local v4    # "outPtr":I
    .restart local p3    # "outPtr":I
    :cond_f
    and-int/lit16 p2, p2, 0xff

    .line 1664
    if-nez v3, :cond_10

    .line 1665
    const-string v1, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1669
    :cond_10
    move v8, p3

    move p3, p2

    move p2, v8

    .local p2, "outPtr":I
    .local p3, "ch":I
    :cond_11
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1670
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1672
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_expLength:I

    .line 1673
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected _startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1316
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_numberNegative:Z

    .line 1317
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_0

    .line 1318
    const/16 v0, 0x17

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1319
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1321
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    .line 1322
    .local v1, "ch":I
    const/4 v2, 0x2

    const-string v3, "expected digit (0-9) to follow minus sign, for valid numeric value"

    const/16 v4, 0x39

    const/16 v5, 0x30

    if-gt v1, v5, :cond_2

    .line 1323
    if-ne v1, v5, :cond_1

    .line 1324
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1327
    :cond_1
    invoke-virtual {p0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    goto :goto_0

    .line 1328
    :cond_2
    if-le v1, v4, :cond_4

    .line 1329
    const/16 v6, 0x49

    if-ne v1, v6, :cond_3

    .line 1330
    const/4 v0, 0x3

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1332
    :cond_3
    invoke-virtual {p0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1334
    :cond_4
    :goto_0
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v3

    .line 1335
    .local v3, "outBuf":[C
    const/4 v6, 0x0

    const/16 v7, 0x2d

    aput-char v7, v3, v6

    .line 1336
    int-to-char v6, v1

    aput-char v6, v3, v0

    .line 1337
    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/16 v8, 0x1a

    if-lt v6, v7, :cond_5

    .line 1338
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1339
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1340
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1341
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1343
    :cond_5
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v1, v2, v6

    .line 1344
    const/4 v2, 0x2

    .line 1347
    .local v2, "outPtr":I
    :goto_1
    if-ge v1, v5, :cond_6

    .line 1348
    const/16 v4, 0x2e

    if-ne v1, v4, :cond_7

    .line 1349
    add-int/lit8 v4, v2, -0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1350
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/2addr v4, v0

    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1351
    invoke-virtual {p0, v3, v2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1355
    :cond_6
    if-le v1, v4, :cond_9

    .line 1356
    const/16 v4, 0x65

    if-eq v1, v4, :cond_8

    const/16 v4, 0x45

    if-ne v1, v4, :cond_7

    goto :goto_2

    .line 1375
    :cond_7
    add-int/lit8 v0, v2, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1376
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1377
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1357
    :cond_8
    :goto_2
    add-int/lit8 v4, v2, -0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1358
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/2addr v4, v0

    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1359
    invoke-virtual {p0, v3, v2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1363
    :cond_9
    array-length v6, v3

    if-lt v2, v6, :cond_a

    .line 1365
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v3

    .line 1367
    :cond_a
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "outPtr":I
    .local v6, "outPtr":I
    int-to-char v7, v1

    aput-char v7, v3, v2

    .line 1368
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v2, v7, :cond_b

    .line 1369
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1370
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1371
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1373
    :cond_b
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v2, v2, v7

    and-int/lit16 v1, v2, 0xff

    move v2, v6

    goto :goto_1
.end method

.method protected _startNullToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1128
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1129
    .local v0, "ptr":I
    add-int/lit8 v1, v0, 0x3

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-ge v1, v2, :cond_3

    .line 1130
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 1131
    .local v1, "buf":[B
    add-int/lit8 v2, v0, 0x1

    .end local v0    # "ptr":I
    .local v2, "ptr":I
    aget-byte v0, v1, v0

    const/16 v3, 0x75

    if-ne v0, v3, :cond_2

    add-int/lit8 v0, v2, 0x1

    .end local v2    # "ptr":I
    .restart local v0    # "ptr":I
    aget-byte v2, v1, v2

    const/16 v3, 0x6c

    if-ne v2, v3, :cond_3

    add-int/lit8 v2, v0, 0x1

    .end local v0    # "ptr":I
    .restart local v2    # "ptr":I
    aget-byte v0, v1, v0

    if-ne v0, v3, :cond_1

    .line 1134
    aget-byte v0, v1, v2

    and-int/lit16 v0, v0, 0xff

    .line 1135
    .local v0, "ch":I
    const/16 v3, 0x30

    if-lt v0, v3, :cond_0

    const/16 v3, 0x5d

    if-eq v0, v3, :cond_0

    const/16 v3, 0x7d

    if-ne v0, v3, :cond_1

    .line 1136
    :cond_0
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1137
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 1141
    .end local v0    # "ch":I
    .end local v1    # "buf":[B
    :cond_1
    move v0, v2

    goto :goto_0

    .line 1131
    .restart local v1    # "buf":[B
    :cond_2
    move v0, v2

    .line 1141
    .end local v1    # "buf":[B
    .end local v2    # "ptr":I
    .local v0, "ptr":I
    :cond_3
    :goto_0
    const/16 v1, 0x10

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1142
    const-string v1, "null"

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected _startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1382
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1383
    .local v0, "ptr":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 1384
    const/16 v1, 0x18

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1385
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 1392
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    add-int/lit8 v2, v0, 0x1

    .end local v0    # "ptr":I
    .local v2, "ptr":I
    aget-byte v0, v1, v0

    and-int/lit16 v0, v0, 0xff

    .line 1394
    .local v0, "ch":I
    const/4 v1, 0x0

    const/16 v3, 0x30

    const/4 v4, 0x1

    if-ge v0, v3, :cond_1

    .line 1395
    const/16 v5, 0x2e

    if-ne v0, v5, :cond_3

    .line 1396
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1397
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1398
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v5

    .line 1399
    .local v5, "outBuf":[C
    aput-char v3, v5, v1

    .line 1400
    invoke-virtual {p0, v5, v4, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1402
    .end local v5    # "outBuf":[C
    :cond_1
    const/16 v5, 0x39

    if-le v0, v5, :cond_5

    .line 1403
    const/16 v5, 0x65

    if-eq v0, v5, :cond_4

    const/16 v5, 0x45

    if-ne v0, v5, :cond_2

    goto :goto_0

    .line 1413
    :cond_2
    const/16 v3, 0x5d

    if-eq v0, v3, :cond_3

    const/16 v3, 0x7d

    if-eq v0, v3, :cond_3

    .line 1414
    const-string v3, "expected digit (0-9), decimal point (.) or exponent indicator (e/E) to follow \'0\'"

    invoke-virtual {p0, v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1422
    :cond_3
    const-string v3, "0"

    invoke-virtual {p0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueCompleteInt(ILjava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1404
    :cond_4
    :goto_0
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1405
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1406
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v5

    .line 1407
    .restart local v5    # "outBuf":[C
    aput-char v3, v5, v1

    .line 1408
    invoke-virtual {p0, v5, v4, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1419
    .end local v5    # "outBuf":[C
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNumberLeadingZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected _startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1266
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_numberNegative:Z

    .line 1267
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1268
    .local v1, "outBuf":[C
    int-to-char v2, p1

    aput-char v2, v1, v0

    .line 1270
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/16 v3, 0x1a

    const/4 v4, 0x1

    if-lt v0, v2, :cond_0

    .line 1271
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1272
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1273
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1276
    :cond_0
    const/4 v0, 0x1

    .line 1278
    .local v0, "outPtr":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v2, v2, v5

    and-int/lit16 p1, v2, 0xff

    .line 1280
    :goto_0
    const/16 v2, 0x30

    if-ge p1, v2, :cond_1

    .line 1281
    const/16 v2, 0x2e

    if-ne p1, v2, :cond_2

    .line 1282
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1283
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/2addr v2, v4

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1284
    invoke-virtual {p0, v1, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 1288
    :cond_1
    const/16 v2, 0x39

    if-le p1, v2, :cond_4

    .line 1289
    const/16 v2, 0x65

    if-eq p1, v2, :cond_3

    const/16 v2, 0x45

    if-ne p1, v2, :cond_2

    goto :goto_1

    .line 1309
    :cond_2
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1310
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1311
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 1290
    :cond_3
    :goto_1
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_intLength:I

    .line 1291
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/2addr v2, v4

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1292
    invoke-virtual {p0, v1, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2

    .line 1296
    :cond_4
    array-length v2, v1

    if-lt v0, v2, :cond_5

    .line 1299
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v1

    .line 1301
    :cond_5
    add-int/lit8 v2, v0, 0x1

    .end local v0    # "outPtr":I
    .local v2, "outPtr":I
    int-to-char v5, p1

    aput-char v5, v1, v0

    .line 1302
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/2addr v0, v4

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v5, :cond_6

    .line 1303
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1304
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1305
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1307
    :cond_6
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v5

    and-int/lit16 p1, v0, 0xff

    move v0, v2

    goto :goto_0
.end method

.method protected _startString()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2359
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2360
    .local v0, "ptr":I
    const/4 v1, 0x0

    .line 2361
    .local v1, "outPtr":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    .line 2362
    .local v2, "outBuf":[C
    sget-object v3, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_icUTF8:[I

    .line 2364
    .local v3, "codes":[I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    array-length v5, v2

    add-int/2addr v5, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 2365
    .local v4, "max":I
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 2366
    .local v5, "inputBuffer":[B
    :goto_0
    if-ge v0, v4, :cond_1

    .line 2367
    aget-byte v6, v5, v0

    and-int/lit16 v6, v6, 0xff

    .line 2368
    .local v6, "c":I
    aget v7, v3, v6

    if-eqz v7, :cond_0

    .line 2369
    const/16 v7, 0x22

    if-ne v6, v7, :cond_1

    .line 2370
    add-int/lit8 v7, v0, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2371
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2372
    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    return-object v7

    .line 2376
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 2377
    add-int/lit8 v7, v1, 0x1

    .end local v1    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v8, v6

    aput-char v8, v2, v1

    .line 2378
    .end local v6    # "c":I
    move v1, v7

    goto :goto_0

    .line 2379
    .end local v7    # "outPtr":I
    .restart local v1    # "outPtr":I
    :cond_1
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v6, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2380
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 2381
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    return-object v6
.end method

.method protected _startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1109
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1110
    .local v0, "ptr":I
    add-int/lit8 v1, v0, 0x3

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-ge v1, v2, :cond_3

    .line 1111
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 1112
    .local v1, "buf":[B
    add-int/lit8 v2, v0, 0x1

    .end local v0    # "ptr":I
    .local v2, "ptr":I
    aget-byte v0, v1, v0

    const/16 v3, 0x72

    if-ne v0, v3, :cond_2

    add-int/lit8 v0, v2, 0x1

    .end local v2    # "ptr":I
    .restart local v0    # "ptr":I
    aget-byte v2, v1, v2

    const/16 v3, 0x75

    if-ne v2, v3, :cond_3

    add-int/lit8 v2, v0, 0x1

    .end local v0    # "ptr":I
    .restart local v2    # "ptr":I
    aget-byte v0, v1, v0

    const/16 v3, 0x65

    if-ne v0, v3, :cond_1

    .line 1115
    aget-byte v0, v1, v2

    and-int/lit16 v0, v0, 0xff

    .line 1116
    .local v0, "ch":I
    const/16 v3, 0x30

    if-lt v0, v3, :cond_0

    const/16 v3, 0x5d

    if-eq v0, v3, :cond_0

    const/16 v3, 0x7d

    if-ne v0, v3, :cond_1

    .line 1117
    :cond_0
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 1118
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    return-object v3

    .line 1122
    .end local v0    # "ch":I
    .end local v1    # "buf":[B
    :cond_1
    move v0, v2

    goto :goto_0

    .line 1112
    .restart local v1    # "buf":[B
    :cond_2
    move v0, v2

    .line 1122
    .end local v1    # "buf":[B
    .end local v2    # "ptr":I
    .local v0, "ptr":I
    :cond_3
    :goto_0
    const/16 v1, 0x11

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_minorState:I

    .line 1123
    const-string/jumbo v1, "true"

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1
.end method

.method protected _startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .param p1, "leadingComma"    # Z
    .param p2, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 878
    const/4 v0, 0x1

    sparse-switch p2, :sswitch_data_0

    goto :goto_0

    .line 880
    :sswitch_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v1

    if-nez v1, :cond_0

    .line 881
    goto :goto_0

    .line 905
    :sswitch_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 907
    :sswitch_2
    invoke-virtual {p0, v0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 888
    :cond_0
    :sswitch_3
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_MISSING_VALUES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 889
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 890
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 896
    :cond_1
    :sswitch_4
    goto :goto_0

    .line 903
    :sswitch_5
    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 898
    :sswitch_6
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 899
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 910
    :cond_2
    :goto_0
    const-string v0, "expected a valid value (number, String, array, object, \'true\', \'false\' or \'null\')"

    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 911
    const/4 v0, 0x0

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_6
        0x2b -> :sswitch_5
        0x2c -> :sswitch_3
        0x49 -> :sswitch_2
        0x4e -> :sswitch_1
        0x5d -> :sswitch_0
        0x7d -> :sswitch_4
    .end sparse-switch
.end method

.method public endOfInput()V
    .locals 1

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_endOfInput:Z

    .line 106
    return-void
.end method

.method public feedInput([BII)V
    .locals 4
    .param p1, "buf"    # [B
    .param p2, "start"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-ge v0, v1, :cond_0

    .line 81
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "Still have %d undecoded bytes, should not call \'feedInput\'"

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportError(Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    :cond_0
    if-ge p3, p2, :cond_1

    .line 84
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Input end (%d) may not be before start (%d)"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportError(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 87
    :cond_1
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_endOfInput:Z

    if-eqz v0, :cond_2

    .line 88
    const-string v0, "Already closed, can not feed more input"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_reportError(Ljava/lang/String;)V

    .line 91
    :cond_2
    iget-wide v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputProcessed:J

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_origBufferLen:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputProcessed:J

    .line 94
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    sub-int/2addr v0, v1

    sub-int v0, p2, v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputRowStart:I

    .line 97
    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    .line 98
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    .line 99
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    .line 100
    sub-int v0, p3, p2

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_origBufferLen:I

    .line 101
    return-void
.end method

.method public getNonBlockingInputFeeder()Lcom/fasterxml/jackson/core/async/ByteArrayFeeder;
    .locals 0

    .line 68
    return-object p0
.end method

.method public bridge synthetic getNonBlockingInputFeeder()Lcom/fasterxml/jackson/core/async/NonBlockingInputFeeder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->getNonBlockingInputFeeder()Lcom/fasterxml/jackson/core/async/ByteArrayFeeder;

    move-result-object v0

    return-object v0
.end method

.method public final needMoreInput()Z
    .locals 2

    .line 73
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_endOfInput:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public nextToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 153
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_3

    .line 154
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_closed:Z

    if-eqz v0, :cond_0

    .line 155
    return-object v2

    .line 158
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_endOfInput:Z

    if-eqz v0, :cond_2

    .line 161
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 162
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 164
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 166
    :cond_2
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 169
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_4

    .line 170
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_finishToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 174
    :cond_4
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_numTypesValid:I

    .line 175
    iget-wide v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_currInputProcessed:J

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    int-to-long v3, v3

    add-long/2addr v0, v3

    iput-wide v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_tokenInputTotal:J

    .line 177
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_binaryValue:[B

    .line 178
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 180
    .local v0, "ch":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_majorState:I

    packed-switch v1, :pswitch_data_0

    .line 203
    invoke-static {}, Lcom/fasterxml/jackson/core/util/VersionUtil;->throwInternal()V

    .line 204
    return-object v2

    .line 199
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValueExpectComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 196
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 193
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValueExpectColon(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 190
    :pswitch_3
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFieldNameAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 188
    :pswitch_4
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startFieldName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 185
    :pswitch_5
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 182
    :pswitch_6
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_startDocument(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public releaseBuffered(Ljava/io/OutputStream;)I
    .locals 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    sub-int/2addr v0, v1

    .line 128
    .local v0, "avail":I
    if-lez v0, :cond_0

    .line 129
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParser;->_inputPtr:I

    invoke-virtual {p1, v1, v2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 131
    :cond_0
    return v0
.end method
