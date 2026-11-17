.class public Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;
.super Lcom/fasterxml/jackson/core/base/ParserBase;
.source "UTF8DataInputJsonParser.java"


# static fields
.field static final BYTE_LF:B = 0xat

.field protected static final _icLatin1:[I

.field private static final _icUTF8:[I


# instance fields
.field protected _inputData:Ljava/io/DataInput;

.field protected _nextByte:I

.field protected _objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

.field private _quad1:I

.field protected _quadBuffer:[I

.field protected final _symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

.field protected _tokenIncomplete:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icUTF8:[I

    .line 45
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeLatin1()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icLatin1:[I

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILjava/io/DataInput;Lcom/fasterxml/jackson/core/ObjectCodec;Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;I)V
    .locals 1
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "features"    # I
    .param p3, "inputData"    # Ljava/io/DataInput;
    .param p4, "codec"    # Lcom/fasterxml/jackson/core/ObjectCodec;
    .param p5, "sym"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .param p6, "firstByte"    # I

    .line 112
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/base/ParserBase;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;I)V

    .line 74
    const/16 v0, 0x10

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 100
    const/4 v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 113
    iput-object p4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    .line 114
    iput-object p5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 115
    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    .line 116
    iput p6, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 117
    return-void
.end method

.method private final _checkMatchEnd(Ljava/lang/String;II)V
    .locals 2
    .param p1, "matchStr"    # Ljava/lang/String;
    .param p2, "i"    # I
    .param p3, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2168
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeCharForError(I)I

    move-result v0

    int-to-char v0, v0

    .line 2169
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2170
    const/4 v1, 0x0

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidToken(ILjava/lang/String;)V

    .line 2172
    :cond_0
    return-void
.end method

.method private _closeScope(I)V
    .locals 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 2830
    const/16 v0, 0x7d

    const/16 v1, 0x5d

    if-ne p1, v1, :cond_1

    .line 2831
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2832
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 2834
    :cond_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 2835
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 2837
    :cond_1
    if-ne p1, v0, :cond_3

    .line 2838
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2839
    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 2841
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 2842
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 2844
    :cond_3
    return-void
.end method

.method private final _decodeUtf8_2(I)I
    .locals 3
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2556
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2557
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_0

    .line 2558
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2560
    :cond_0
    and-int/lit8 v1, p1, 0x1f

    shl-int/lit8 v1, v1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int/2addr v1, v2

    return v1
.end method

.method private final _decodeUtf8_3(I)I
    .locals 4
    .param p1, "c1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2565
    and-int/lit8 p1, p1, 0xf

    .line 2566
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2567
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_0

    .line 2568
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2570
    :cond_0
    shl-int/lit8 v1, p1, 0x6

    and-int/lit8 v3, v0, 0x3f

    or-int/2addr v1, v3

    .line 2571
    .local v1, "c":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2572
    and-int/lit16 v3, v0, 0xc0

    if-eq v3, v2, :cond_1

    .line 2573
    and-int/lit16 v2, v0, 0xff

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2575
    :cond_1
    shl-int/lit8 v2, v1, 0x6

    and-int/lit8 v3, v0, 0x3f

    or-int v1, v2, v3

    .line 2576
    return v1
.end method

.method private final _decodeUtf8_4(I)I
    .locals 4
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2585
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2586
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_0

    .line 2587
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2589
    :cond_0
    and-int/lit8 v1, p1, 0x7

    shl-int/lit8 v1, v1, 0x6

    and-int/lit8 v3, v0, 0x3f

    or-int p1, v1, v3

    .line 2590
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2591
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v2, :cond_1

    .line 2592
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2594
    :cond_1
    shl-int/lit8 v1, p1, 0x6

    and-int/lit8 v3, v0, 0x3f

    or-int p1, v1, v3

    .line 2595
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2596
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v2, :cond_2

    .line 2597
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2603
    :cond_2
    shl-int/lit8 v1, p1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int/2addr v1, v2

    const/high16 v2, 0x10000

    sub-int/2addr v1, v2

    return v1
.end method

.method private _finishAndReturnString()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1853
    const/4 v0, 0x0

    .line 1854
    .local v0, "outPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1855
    .local v1, "outBuf":[C
    sget-object v2, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icUTF8:[I

    .line 1856
    .local v2, "codes":[I
    array-length v3, v1

    .line 1859
    .local v3, "outEnd":I
    :goto_0
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v4}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 1860
    .local v4, "c":I
    aget v5, v2, v4

    if-eqz v5, :cond_1

    .line 1861
    const/16 v5, 0x22

    if-ne v4, v5, :cond_0

    .line 1862
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentAndReturn(I)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 1864
    :cond_0
    invoke-direct {p0, v1, v0, v4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString2([CII)V

    .line 1865
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 1867
    :cond_1
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outPtr":I
    .local v5, "outPtr":I
    int-to-char v6, v4

    aput-char v6, v1, v0

    .line 1868
    .end local v4    # "c":I
    if-lt v5, v3, :cond_2

    .line 1869
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    invoke-direct {p0, v1, v5, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString2([CII)V

    .line 1870
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1868
    :cond_2
    move v0, v5

    goto :goto_0
.end method

.method private final _finishString2([CII)V
    .locals 5
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .param p3, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1877
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icUTF8:[I

    .line 1878
    .local v0, "codes":[I
    array-length v1, p1

    .line 1883
    .local v1, "outEnd":I
    :goto_0
    aget v2, v0, p3

    if-nez v2, :cond_1

    .line 1884
    if-lt p2, v1, :cond_0

    .line 1885
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1886
    const/4 p2, 0x0

    .line 1887
    array-length v1, p1

    .line 1889
    :cond_0
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "outPtr":I
    .local v2, "outPtr":I
    int-to-char v3, p3

    aput-char v3, p1, p2

    .line 1890
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {p2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p3

    move p2, v2

    goto :goto_0

    .line 1893
    .end local v2    # "outPtr":I
    .restart local p2    # "outPtr":I
    :cond_1
    const/16 v2, 0x22

    if-ne p3, v2, :cond_2

    .line 1894
    nop

    .line 1935
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1936
    return-void

    .line 1896
    :cond_2
    aget v2, v0, p3

    packed-switch v2, :pswitch_data_0

    .line 1919
    const/16 v2, 0x20

    if-ge p3, v2, :cond_4

    .line 1920
    const-string/jumbo v2, "string value"

    invoke-virtual {p0, p3, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_2

    .line 1907
    :pswitch_0
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeUtf8_4(I)I

    move-result p3

    .line 1909
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v2    # "outPtr":I
    shr-int/lit8 v3, p3, 0xa

    const v4, 0xd800

    or-int/2addr v3, v4

    int-to-char v3, v3

    aput-char v3, p1, p2

    .line 1910
    array-length p2, p1

    if-lt v2, p2, :cond_3

    .line 1911
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1912
    const/4 p2, 0x0

    .line 1913
    .end local v2    # "outPtr":I
    .restart local p2    # "outPtr":I
    array-length v1, p1

    goto :goto_1

    .line 1910
    .end local p2    # "outPtr":I
    .restart local v2    # "outPtr":I
    :cond_3
    move p2, v2

    .line 1915
    .end local v2    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_1
    and-int/lit16 v2, p3, 0x3ff

    const v3, 0xdc00

    or-int p3, v2, v3

    .line 1917
    goto :goto_2

    .line 1904
    :pswitch_1
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeUtf8_3(I)I

    move-result p3

    .line 1905
    goto :goto_2

    .line 1901
    :pswitch_2
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeUtf8_2(I)I

    move-result p3

    .line 1902
    goto :goto_2

    .line 1898
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeEscaped()C

    move-result p3

    .line 1899
    goto :goto_2

    .line 1923
    :cond_4
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidChar(I)V

    .line 1927
    :goto_2
    array-length v2, p1

    if-lt p2, v2, :cond_5

    .line 1928
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1929
    const/4 p2, 0x0

    .line 1930
    array-length v1, p1

    .line 1933
    :cond_5
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v2    # "outPtr":I
    int-to-char v3, p3

    aput-char v3, p1, p2

    .line 1881
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {p2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p3

    move p2, v2

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static _growArrayBy([II)[I
    .locals 1
    .param p0, "arr"    # [I
    .param p1, "more"    # I

    .line 2701
    if-nez p0, :cond_0

    .line 2702
    new-array v0, p1, [I

    return-object v0

    .line 2704
    :cond_0
    array-length v0, p0

    add-int/2addr v0, p1

    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    return-object v0
.end method

.method private final _handleLeadingZeroes()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1067
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 1069
    .local v0, "ch":I
    const/16 v1, 0x30

    if-lt v0, v1, :cond_3

    const/16 v2, 0x39

    if-le v0, v2, :cond_0

    goto :goto_1

    .line 1073
    :cond_0
    sget-object v2, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NUMERIC_LEADING_ZEROS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1074
    const-string v2, "Leading zeroes not allowed"

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->reportInvalidNumber(Ljava/lang/String;)V

    .line 1077
    :cond_1
    :goto_0
    if-ne v0, v1, :cond_2

    .line 1078
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    goto :goto_0

    .line 1080
    :cond_2
    return v0

    .line 1070
    :cond_3
    :goto_1
    return v0
.end method

.method private final _nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4

    .line 721
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopied:Z

    .line 722
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 723
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 726
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 727
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_0

    .line 728
    :cond_0
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 729
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 731
    :cond_1
    :goto_0
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0
.end method

.method private final _nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 678
    const/16 v0, 0x22

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    .line 679
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 680
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 682
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 716
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 687
    :sswitch_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 688
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 690
    :sswitch_1
    const-string/jumbo v0, "true"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 691
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 696
    :sswitch_2
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 697
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 693
    :sswitch_3
    const-string v0, "false"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 694
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 684
    :sswitch_4
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 685
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 714
    :sswitch_5
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 699
    :sswitch_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x2d -> :sswitch_6
        0x30 -> :sswitch_5
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

.method private final _parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 7
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .param p3, "c"    # I
    .param p4, "negative"    # Z
    .param p5, "integerPartLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1086
    const/4 v0, 0x0

    .line 1089
    .local v0, "fractLen":I
    const/16 v1, 0x2e

    const/16 v2, 0x39

    const/16 v3, 0x30

    if-ne p3, v1, :cond_3

    .line 1090
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outPtr":I
    .local v1, "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    move p2, v1

    .line 1094
    .end local v1    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p3

    .line 1095
    if-lt p3, v3, :cond_2

    if-le p3, v2, :cond_0

    .line 1096
    goto :goto_1

    .line 1098
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 1099
    array-length v1, p1

    if-lt p2, v1, :cond_1

    .line 1100
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1101
    const/4 p2, 0x0

    .line 1103
    :cond_1
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v1    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    move p2, v1

    goto :goto_0

    .line 1106
    .end local v1    # "outPtr":I
    .restart local p2    # "outPtr":I
    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 1107
    const-string v1, "Decimal point not followed by a digit"

    invoke-virtual {p0, p3, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1111
    :cond_3
    const/4 v1, 0x0

    .line 1112
    .local v1, "expLen":I
    const/16 v4, 0x65

    if-eq p3, v4, :cond_4

    const/16 v4, 0x45

    if-ne p3, v4, :cond_b

    .line 1113
    :cond_4
    array-length v4, p1

    if-lt p2, v4, :cond_5

    .line 1114
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1115
    const/4 p2, 0x0

    .line 1117
    :cond_5
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "outPtr":I
    .local v4, "outPtr":I
    int-to-char v5, p3

    aput-char v5, p1, p2

    .line 1118
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {p2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p2

    .line 1120
    .end local p3    # "c":I
    .local p2, "c":I
    const/16 p3, 0x2d

    if-eq p2, p3, :cond_7

    const/16 p3, 0x2b

    if-ne p2, p3, :cond_6

    goto :goto_2

    :cond_6
    move p3, p2

    move p2, v4

    goto :goto_3

    .line 1121
    :cond_7
    :goto_2
    array-length p3, p1

    if-lt v4, p3, :cond_8

    .line 1122
    iget-object p3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1123
    const/4 v4, 0x0

    .line 1125
    :cond_8
    add-int/lit8 p3, v4, 0x1

    .end local v4    # "outPtr":I
    .local p3, "outPtr":I
    int-to-char v5, p2

    aput-char v5, p1, v4

    .line 1126
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v4}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p2

    move v6, p3

    move p3, p2

    move p2, v6

    .line 1128
    .local p2, "outPtr":I
    .local p3, "c":I
    :goto_3
    if-gt p3, v2, :cond_a

    if-lt p3, v3, :cond_a

    .line 1129
    add-int/lit8 v1, v1, 0x1

    .line 1130
    array-length v4, p1

    if-lt p2, v4, :cond_9

    .line 1131
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1132
    const/4 p2, 0x0

    .line 1134
    :cond_9
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    int-to-char v5, p3

    aput-char v5, p1, p2

    .line 1135
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {p2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p3

    move p2, v4

    goto :goto_3

    .line 1138
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    :cond_a
    if-nez v1, :cond_b

    .line 1139
    const-string v2, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p3, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1145
    :cond_b
    iput p3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 1146
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1147
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_verifyRootSpace()V

    .line 1149
    :cond_c
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1152
    invoke-virtual {p0, p4, p5, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->resetFloat(ZIII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    return-object v2
.end method

.method private final _parseLongName(III)Ljava/lang/String;
    .locals 9
    .param p1, "q"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1318
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    aput v3, v1, v2

    .line 1319
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    aput p2, v1, v2

    .line 1320
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v3, 0x2

    aput p3, v1, v3

    .line 1323
    sget-object v6, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icLatin1:[I

    .line 1324
    .local v6, "codes":[I
    const/4 v1, 0x3

    move v4, v1

    move v1, p1

    .line 1327
    .end local p1    # "q":I
    .local v1, "q":I
    .local v4, "qlen":I
    :goto_0
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v5}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v5

    .line 1328
    .local v5, "i":I
    aget v7, v6, v5

    const/16 v8, 0x22

    if-eqz v7, :cond_1

    .line 1329
    if-ne v5, v8, :cond_0

    .line 1330
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    invoke-direct {p0, v3, v4, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName([IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1332
    :cond_0
    move v3, v1

    .end local v1    # "q":I
    .local v3, "q":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    move v2, v4

    move v4, v5

    .end local v5    # "i":I
    .local v2, "qlen":I
    .local v4, "i":I
    const/4 v5, 0x1

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v1

    move v7, v2

    move v5, v3

    .end local v2    # "qlen":I
    .end local v3    # "q":I
    .local v5, "q":I
    .local v7, "qlen":I
    return-object v1

    .line 1335
    .end local v7    # "qlen":I
    .restart local v1    # "q":I
    .local v4, "qlen":I
    .local v5, "i":I
    :cond_1
    move v7, v4

    move v4, v5

    move v5, v1

    .end local v1    # "q":I
    .local v4, "i":I
    .local v5, "q":I
    .restart local v7    # "qlen":I
    shl-int/lit8 v1, v5, 0x8

    or-int/2addr v1, v4

    .line 1336
    .end local v5    # "q":I
    .restart local v1    # "q":I
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v5}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 1337
    aget v5, v6, v4

    if-eqz v5, :cond_3

    .line 1338
    if-ne v4, v8, :cond_2

    .line 1339
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    invoke-direct {p0, v2, v7, v1, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName([IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1341
    :cond_2
    move v3, v1

    .end local v1    # "q":I
    .restart local v3    # "q":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v5, 0x2

    move-object v0, p0

    move v2, v7

    .end local v7    # "qlen":I
    .restart local v2    # "qlen":I
    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v1

    move v5, v4

    move v4, v3

    .end local v2    # "qlen":I
    .end local v3    # "q":I
    .local v4, "q":I
    .local v5, "i":I
    .restart local v7    # "qlen":I
    return-object v1

    .line 1344
    .end local v5    # "i":I
    .restart local v1    # "q":I
    .local v4, "i":I
    :cond_3
    move v5, v4

    move v4, v1

    .end local v1    # "q":I
    .local v4, "q":I
    .restart local v5    # "i":I
    shl-int/lit8 v1, v4, 0x8

    or-int/2addr v1, v5

    .line 1345
    .end local v4    # "q":I
    .restart local v1    # "q":I
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v4}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 1346
    .end local v5    # "i":I
    .local v4, "i":I
    aget v5, v6, v4

    if-eqz v5, :cond_5

    .line 1347
    if-ne v4, v8, :cond_4

    .line 1348
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v3, 0x3

    invoke-direct {p0, v2, v7, v1, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName([IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1350
    :cond_4
    move v3, v1

    .end local v1    # "q":I
    .restart local v3    # "q":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v5, 0x3

    move-object v0, p0

    move v2, v7

    .end local v7    # "qlen":I
    .restart local v2    # "qlen":I
    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v1

    move v5, v4

    move v4, v3

    .end local v2    # "qlen":I
    .end local v3    # "q":I
    .local v4, "q":I
    .restart local v5    # "i":I
    .restart local v7    # "qlen":I
    return-object v1

    .line 1353
    .end local v5    # "i":I
    .restart local v1    # "q":I
    .local v4, "i":I
    :cond_5
    move v5, v4

    move v4, v1

    .end local v1    # "q":I
    .local v4, "q":I
    .restart local v5    # "i":I
    shl-int/lit8 v1, v4, 0x8

    or-int/2addr v1, v5

    .line 1354
    .end local v4    # "q":I
    .restart local v1    # "q":I
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v4}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 1355
    .end local v5    # "i":I
    .local v4, "i":I
    aget v5, v6, v4

    if-eqz v5, :cond_7

    .line 1356
    if-ne v4, v8, :cond_6

    .line 1357
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v3, 0x4

    invoke-direct {p0, v2, v7, v1, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName([IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1359
    :cond_6
    move v3, v1

    .end local v1    # "q":I
    .restart local v3    # "q":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v5, 0x4

    move-object v0, p0

    move v2, v7

    .end local v7    # "qlen":I
    .restart local v2    # "qlen":I
    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v1

    move v5, v4

    move v4, v3

    .end local v2    # "qlen":I
    .end local v3    # "q":I
    .local v4, "q":I
    .restart local v5    # "i":I
    .restart local v7    # "qlen":I
    return-object v1

    .line 1363
    .end local v5    # "i":I
    .restart local v1    # "q":I
    .local v4, "i":I
    :cond_7
    move v5, v4

    move v4, v1

    .end local v1    # "q":I
    .local v4, "q":I
    .restart local v5    # "i":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    array-length v1, v1

    if-lt v7, v1, :cond_8

    .line 1364
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    invoke-static {v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1366
    :cond_8
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "qlen":I
    .local v8, "qlen":I
    aput v4, v1, v7

    .line 1367
    move v1, v5

    .line 1368
    .end local v4    # "q":I
    .end local v5    # "i":I
    .restart local v1    # "q":I
    move v4, v8

    goto/16 :goto_0
.end method

.method private final _parseMediumName(I)Ljava/lang/String;
    .locals 4
    .param p1, "q2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1240
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icLatin1:[I

    .line 1243
    .local v0, "codes":[I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 1244
    .local v1, "i":I
    aget v2, v0, v1

    const/16 v3, 0x22

    if-eqz v2, :cond_1

    .line 1245
    const/4 v2, 0x1

    if-ne v1, v3, :cond_0

    .line 1246
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(III)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1248
    :cond_0
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1250
    :cond_1
    shl-int/lit8 v2, p1, 0x8

    or-int p1, v2, v1

    .line 1251
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 1252
    aget v2, v0, v1

    if-eqz v2, :cond_3

    .line 1253
    const/4 v2, 0x2

    if-ne v1, v3, :cond_2

    .line 1254
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(III)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1256
    :cond_2
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1258
    :cond_3
    shl-int/lit8 v2, p1, 0x8

    or-int p1, v2, v1

    .line 1259
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 1260
    aget v2, v0, v1

    if-eqz v2, :cond_5

    .line 1261
    const/4 v2, 0x3

    if-ne v1, v3, :cond_4

    .line 1262
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(III)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1264
    :cond_4
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1266
    :cond_5
    shl-int/lit8 v2, p1, 0x8

    or-int p1, v2, v1

    .line 1267
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 1268
    aget v2, v0, v1

    if-eqz v2, :cond_7

    .line 1269
    const/4 v2, 0x4

    if-ne v1, v3, :cond_6

    .line 1270
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(III)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1272
    :cond_6
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(IIII)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1274
    :cond_7
    invoke-direct {p0, v1, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseMediumName2(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private final _parseMediumName2(II)Ljava/lang/String;
    .locals 13
    .param p1, "q3"    # I
    .param p2, "q2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1279
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icLatin1:[I

    .line 1282
    .local v0, "codes":[I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v6

    .line 1283
    .local v6, "i":I
    aget v1, v0, v6

    const/16 v2, 0x22

    if-eqz v1, :cond_1

    .line 1284
    if-ne v6, v2, :cond_0

    .line 1285
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    const/4 v2, 0x1

    invoke-direct {p0, v1, p2, p1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(IIII)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1287
    :cond_0
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    const/4 v7, 0x1

    move-object v2, p0

    move v5, p1

    move v4, p2

    .end local p1    # "q3":I
    .end local p2    # "q2":I
    .local v4, "q2":I
    .local v5, "q3":I
    invoke-direct/range {v2 .. v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(IIIII)Ljava/lang/String;

    move-result-object p1

    move-object v7, v2

    move v9, v4

    .end local v4    # "q2":I
    .local v9, "q2":I
    return-object p1

    .line 1289
    .end local v5    # "q3":I
    .end local v9    # "q2":I
    .restart local p1    # "q3":I
    .restart local p2    # "q2":I
    :cond_1
    move-object v7, p0

    move v5, p1

    move v9, p2

    .end local p1    # "q3":I
    .end local p2    # "q2":I
    .restart local v5    # "q3":I
    .restart local v9    # "q2":I
    shl-int/lit8 p1, v5, 0x8

    or-int v10, p1, v6

    .line 1290
    .end local v5    # "q3":I
    .local v10, "q3":I
    iget-object p1, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v11

    .line 1291
    .end local v6    # "i":I
    .local v11, "i":I
    aget p1, v0, v11

    if-eqz p1, :cond_3

    .line 1292
    if-ne v11, v2, :cond_2

    .line 1293
    iget p1, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    const/4 p2, 0x2

    invoke-direct {p0, p1, v9, v10, p2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(IIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1295
    :cond_2
    iget v8, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    const/4 v12, 0x2

    invoke-direct/range {v7 .. v12}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(IIIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1297
    :cond_3
    shl-int/lit8 p1, v10, 0x8

    or-int v10, p1, v11

    .line 1298
    iget-object p1, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v11

    .line 1299
    aget p1, v0, v11

    if-eqz p1, :cond_5

    .line 1300
    if-ne v11, v2, :cond_4

    .line 1301
    iget p1, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    const/4 p2, 0x3

    invoke-direct {p0, p1, v9, v10, p2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(IIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1303
    :cond_4
    iget v8, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    const/4 v12, 0x3

    invoke-direct/range {v7 .. v12}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(IIIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1305
    :cond_5
    shl-int/lit8 p1, v10, 0x8

    or-int v10, p1, v11

    .line 1306
    iget-object p1, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v11

    .line 1307
    aget p1, v0, v11

    if-eqz p1, :cond_7

    .line 1308
    if-ne v11, v2, :cond_6

    .line 1309
    iget p1, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    const/4 p2, 0x4

    invoke-direct {p0, p1, v9, v10, p2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(IIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1311
    :cond_6
    iget v8, v7, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    const/4 v12, 0x4

    invoke-direct/range {v7 .. v12}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(IIIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1313
    :cond_7
    invoke-direct {p0, v11, v9, v10}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseLongName(III)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private _reportInvalidOther(I)V
    .locals 2
    .param p1, "mask"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 2696
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid UTF-8 middle byte 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportError(Ljava/lang/String;)V

    .line 2697
    return-void
.end method

.method private final _skipCComment()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2374
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeComment()[I

    move-result-object v0

    .line 2375
    .local v0, "codes":[I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2380
    .local v1, "i":I
    :cond_0
    :goto_0
    aget v2, v0, v1

    .line 2381
    .local v2, "code":I
    if-eqz v2, :cond_1

    .line 2382
    sparse-switch v2, :sswitch_data_0

    .line 2404
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidChar(I)V

    goto :goto_1

    .line 2384
    :sswitch_0
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2385
    const/16 v3, 0x2f

    if-ne v1, v3, :cond_0

    .line 2386
    return-void

    .line 2391
    :sswitch_1
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    .line 2392
    goto :goto_1

    .line 2400
    :sswitch_2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_4()V

    .line 2401
    goto :goto_1

    .line 2397
    :sswitch_3
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_3()V

    .line 2398
    goto :goto_1

    .line 2394
    :sswitch_4
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_2()V

    .line 2395
    nop

    .line 2407
    :cond_1
    :goto_1
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2408
    .end local v2    # "code":I
    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_4
        0x3 -> :sswitch_3
        0x4 -> :sswitch_2
        0xa -> :sswitch_1
        0xd -> :sswitch_1
        0x2a -> :sswitch_0
    .end sparse-switch
.end method

.method private final _skipColon()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2275
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 2276
    .local v0, "i":I
    if-gez v0, :cond_0

    .line 2277
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    goto :goto_0

    .line 2279
    :cond_0
    const/4 v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 2282
    :goto_0
    const/16 v1, 0x3a

    const/16 v2, 0x9

    const/16 v3, 0x23

    const/16 v4, 0x2f

    const/4 v5, 0x1

    const/16 v6, 0x20

    if-ne v0, v1, :cond_8

    .line 2283
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2284
    if-le v0, v6, :cond_3

    .line 2285
    if-eq v0, v4, :cond_2

    if-ne v0, v3, :cond_1

    goto :goto_1

    .line 2288
    :cond_1
    return v0

    .line 2286
    :cond_2
    :goto_1
    invoke-direct {p0, v0, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon2(IZ)I

    move-result v1

    return v1

    .line 2290
    :cond_3
    if-eq v0, v6, :cond_4

    if-ne v0, v2, :cond_7

    .line 2291
    :cond_4
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2292
    if-le v0, v6, :cond_7

    .line 2293
    if-eq v0, v4, :cond_6

    if-ne v0, v3, :cond_5

    goto :goto_2

    .line 2296
    :cond_5
    return v0

    .line 2294
    :cond_6
    :goto_2
    invoke-direct {p0, v0, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon2(IZ)I

    move-result v1

    return v1

    .line 2299
    :cond_7
    invoke-direct {p0, v0, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon2(IZ)I

    move-result v1

    return v1

    .line 2301
    :cond_8
    if-eq v0, v6, :cond_9

    if-ne v0, v2, :cond_a

    .line 2302
    :cond_9
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v7}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2304
    :cond_a
    if-ne v0, v1, :cond_12

    .line 2305
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2306
    if-le v0, v6, :cond_d

    .line 2307
    if-eq v0, v4, :cond_c

    if-ne v0, v3, :cond_b

    goto :goto_3

    .line 2310
    :cond_b
    return v0

    .line 2308
    :cond_c
    :goto_3
    invoke-direct {p0, v0, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon2(IZ)I

    move-result v1

    return v1

    .line 2312
    :cond_d
    if-eq v0, v6, :cond_e

    if-ne v0, v2, :cond_11

    .line 2313
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2314
    if-le v0, v6, :cond_11

    .line 2315
    if-eq v0, v4, :cond_10

    if-ne v0, v3, :cond_f

    goto :goto_4

    .line 2318
    :cond_f
    return v0

    .line 2316
    :cond_10
    :goto_4
    invoke-direct {p0, v0, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon2(IZ)I

    move-result v1

    return v1

    .line 2321
    :cond_11
    invoke-direct {p0, v0, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon2(IZ)I

    move-result v1

    return v1

    .line 2323
    :cond_12
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon2(IZ)I

    move-result v1

    return v1
.end method

.method private final _skipColon2(IZ)I
    .locals 1
    .param p1, "i"    # I
    .param p2, "gotColon"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2329
    nop

    :goto_0
    const/16 v0, 0x20

    if-le p1, v0, :cond_4

    .line 2330
    const/16 v0, 0x2f

    if-ne p1, v0, :cond_0

    .line 2331
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipComment()V

    .line 2332
    goto :goto_1

    .line 2334
    :cond_0
    const/16 v0, 0x23

    if-ne p1, v0, :cond_1

    .line 2335
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipYAMLComment()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2336
    goto :goto_1

    .line 2339
    :cond_1
    if-eqz p2, :cond_2

    .line 2340
    return p1

    .line 2342
    :cond_2
    const/16 v0, 0x3a

    if-eq p1, v0, :cond_3

    .line 2343
    const-string/jumbo v0, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2345
    :cond_3
    const/4 p2, 0x1

    goto :goto_1

    .line 2349
    :cond_4
    const/16 v0, 0xd

    if-eq p1, v0, :cond_5

    const/16 v0, 0xa

    if-ne p1, v0, :cond_6

    .line 2350
    :cond_5
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    .line 2328
    :cond_6
    :goto_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    goto :goto_0
.end method

.method private final _skipComment()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2358
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    const/16 v1, 0x2f

    if-nez v0, :cond_0

    .line 2359
    const-string v0, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2361
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2362
    .local v0, "c":I
    if-ne v0, v1, :cond_1

    .line 2363
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipLine()V

    goto :goto_0

    .line 2364
    :cond_1
    const/16 v1, 0x2a

    if-ne v0, v1, :cond_2

    .line 2365
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipCComment()V

    goto :goto_0

    .line 2367
    :cond_2
    const-string/jumbo v1, "was expecting either \'*\' or \'/\' for a comment"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2369
    :goto_0
    return-void
.end method

.method private final _skipLine()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2427
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeComment()[I

    move-result-object v0

    .line 2429
    .local v0, "codes":[I
    :goto_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2430
    .local v1, "i":I
    aget v2, v0, v1

    .line 2431
    .local v2, "code":I
    if-eqz v2, :cond_0

    .line 2432
    sparse-switch v2, :sswitch_data_0

    .line 2449
    if-gez v2, :cond_0

    .line 2451
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidChar(I)V

    goto :goto_1

    .line 2438
    :sswitch_0
    goto :goto_1

    .line 2435
    :sswitch_1
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    .line 2436
    return-void

    .line 2446
    :sswitch_2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_4()V

    .line 2447
    goto :goto_1

    .line 2443
    :sswitch_3
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_3()V

    .line 2444
    goto :goto_1

    .line 2440
    :sswitch_4
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_2()V

    .line 2441
    nop

    .line 2455
    .end local v1    # "i":I
    .end local v2    # "code":I
    :cond_0
    :goto_1
    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_4
        0x3 -> :sswitch_3
        0x4 -> :sswitch_2
        0xa -> :sswitch_1
        0xd -> :sswitch_1
        0x2a -> :sswitch_0
    .end sparse-switch
.end method

.method private final _skipUtf8_2()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2608
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2609
    .local v0, "c":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_0

    .line 2610
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2612
    :cond_0
    return-void
.end method

.method private final _skipUtf8_3()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2620
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2621
    .local v0, "c":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_0

    .line 2622
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2624
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2625
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v2, :cond_1

    .line 2626
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2628
    :cond_1
    return-void
.end method

.method private final _skipUtf8_4()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2632
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2633
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_0

    .line 2634
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2636
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2637
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v2, :cond_1

    .line 2638
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2640
    :cond_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2641
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v2, :cond_2

    .line 2642
    and-int/lit16 v1, v0, 0xff

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2644
    :cond_2
    return-void
.end method

.method private final _skipWS()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2182
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 2183
    .local v0, "i":I
    if-gez v0, :cond_0

    .line 2184
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    goto :goto_0

    .line 2186
    :cond_0
    const/4 v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 2189
    :goto_0
    const/16 v1, 0x20

    if-le v0, v1, :cond_3

    .line 2190
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_2

    const/16 v1, 0x23

    if-ne v0, v1, :cond_1

    goto :goto_1

    .line 2193
    :cond_1
    return v0

    .line 2191
    :cond_2
    :goto_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipWSComment(I)I

    move-result v1

    return v1

    .line 2197
    :cond_3
    const/16 v1, 0xd

    if-eq v0, v1, :cond_4

    const/16 v1, 0xa

    if-ne v0, v1, :cond_5

    .line 2198
    :cond_4
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    .line 2201
    :cond_5
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    goto :goto_0
.end method

.method private final _skipWSComment(I)I
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2247
    nop

    :goto_0
    const/16 v0, 0x20

    if-le p1, v0, :cond_2

    .line 2248
    const/16 v0, 0x2f

    if-ne p1, v0, :cond_0

    .line 2249
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipComment()V

    goto :goto_1

    .line 2250
    :cond_0
    const/16 v0, 0x23

    if-ne p1, v0, :cond_1

    .line 2251
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipYAMLComment()Z

    move-result v0

    if-nez v0, :cond_4

    .line 2252
    return p1

    .line 2255
    :cond_1
    return p1

    .line 2260
    :cond_2
    const/16 v0, 0xd

    if-eq p1, v0, :cond_3

    const/16 v0, 0xa

    if-ne p1, v0, :cond_4

    .line 2261
    :cond_3
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    .line 2269
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    goto :goto_0
.end method

.method private final _skipWSOrEnd()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2213
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 2214
    .local v0, "i":I
    if-gez v0, :cond_0

    .line 2216
    :try_start_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 2219
    goto :goto_0

    .line 2217
    :catch_0
    move-exception v1

    .line 2218
    .local v1, "e":Ljava/io/EOFException;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_eofAsNextChar()I

    move-result v2

    return v2

    .line 2221
    .end local v1    # "e":Ljava/io/EOFException;
    :cond_0
    const/4 v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 2224
    :goto_0
    const/16 v1, 0x20

    if-le v0, v1, :cond_3

    .line 2225
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_2

    const/16 v1, 0x23

    if-ne v0, v1, :cond_1

    goto :goto_1

    .line 2228
    :cond_1
    return v0

    .line 2226
    :cond_2
    :goto_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipWSComment(I)I

    move-result v1

    return v1

    .line 2232
    :cond_3
    const/16 v1, 0xd

    if-eq v0, v1, :cond_4

    const/16 v1, 0xa

    if-ne v0, v1, :cond_5

    .line 2233
    :cond_4
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    .line 2237
    :cond_5
    :try_start_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_1

    move v0, v1

    .line 2240
    goto :goto_0

    .line 2238
    :catch_1
    move-exception v1

    .line 2239
    .restart local v1    # "e":Ljava/io/EOFException;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_eofAsNextChar()I

    move-result v2

    return v2
.end method

.method private final _skipYAMLComment()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2413
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_YAML_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2414
    const/4 v0, 0x0

    return v0

    .line 2416
    :cond_0
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipLine()V

    .line 2417
    const/4 v0, 0x1

    return v0
.end method

.method private final _verifyRootSpace()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1165
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 1166
    .local v0, "ch":I
    const/16 v1, 0x20

    if-gt v0, v1, :cond_2

    .line 1167
    const/4 v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 1168
    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    .line 1169
    :cond_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    .line 1171
    :cond_1
    return-void

    .line 1173
    :cond_2
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportMissingRootWS(I)V

    .line 1174
    return-void
.end method

.method private final addName([III)Ljava/lang/String;
    .locals 17
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 1721
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    shl-int/lit8 v4, v2, 0x2

    const/4 v5, 0x4

    sub-int/2addr v4, v5

    add-int/2addr v4, v3

    .line 1730
    .local v4, "byteLen":I
    if-ge v3, v5, :cond_0

    .line 1731
    add-int/lit8 v6, v2, -0x1

    aget v6, v1, v6

    .line 1733
    .local v6, "lastQuad":I
    add-int/lit8 v7, v2, -0x1

    rsub-int/lit8 v8, v3, 0x4

    shl-int/lit8 v8, v8, 0x3

    shl-int v8, v6, v8

    aput v8, v1, v7

    goto :goto_0

    .line 1735
    .end local v6    # "lastQuad":I
    :cond_0
    const/4 v6, 0x0

    .line 1739
    .restart local v6    # "lastQuad":I
    :goto_0
    iget-object v7, v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v7

    .line 1740
    .local v7, "cbuf":[C
    const/4 v8, 0x0

    .line 1742
    .local v8, "cix":I
    const/4 v9, 0x0

    .local v9, "ix":I
    :goto_1
    if-ge v9, v4, :cond_c

    .line 1743
    shr-int/lit8 v10, v9, 0x2

    aget v10, v1, v10

    .line 1744
    .local v10, "ch":I
    and-int/lit8 v11, v9, 0x3

    .line 1745
    .local v11, "byteIx":I
    rsub-int/lit8 v12, v11, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int v12, v10, v12

    and-int/lit16 v10, v12, 0xff

    .line 1746
    add-int/lit8 v9, v9, 0x1

    .line 1748
    const/16 v12, 0x7f

    if-le v10, v12, :cond_a

    .line 1750
    and-int/lit16 v12, v10, 0xe0

    const/16 v13, 0xc0

    const/4 v14, 0x1

    if-ne v12, v13, :cond_1

    .line 1751
    and-int/lit8 v10, v10, 0x1f

    .line 1752
    const/4 v12, 0x1

    .local v12, "needed":I
    goto :goto_2

    .line 1753
    .end local v12    # "needed":I
    :cond_1
    and-int/lit16 v12, v10, 0xf0

    const/16 v13, 0xe0

    if-ne v12, v13, :cond_2

    .line 1754
    and-int/lit8 v10, v10, 0xf

    .line 1755
    const/4 v12, 0x2

    .restart local v12    # "needed":I
    goto :goto_2

    .line 1756
    .end local v12    # "needed":I
    :cond_2
    and-int/lit16 v12, v10, 0xf8

    const/16 v13, 0xf0

    if-ne v12, v13, :cond_3

    .line 1757
    and-int/lit8 v10, v10, 0x7

    .line 1758
    const/4 v12, 0x3

    .restart local v12    # "needed":I
    goto :goto_2

    .line 1760
    .end local v12    # "needed":I
    :cond_3
    invoke-virtual {v0, v10}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidInitial(I)V

    .line 1761
    move v10, v14

    move v12, v14

    .line 1763
    .restart local v12    # "needed":I
    :goto_2
    add-int v13, v9, v12

    if-le v13, v4, :cond_4

    .line 1764
    const-string v13, " in field name"

    sget-object v15, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0, v13, v15}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidEOF(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 1768
    :cond_4
    shr-int/lit8 v13, v9, 0x2

    aget v13, v1, v13

    .line 1769
    .local v13, "ch2":I
    and-int/lit8 v11, v9, 0x3

    .line 1770
    rsub-int/lit8 v15, v11, 0x3

    shl-int/lit8 v15, v15, 0x3

    shr-int/2addr v13, v15

    .line 1771
    add-int/lit8 v9, v9, 0x1

    .line 1773
    and-int/lit16 v15, v13, 0xc0

    const/16 v5, 0x80

    if-eq v15, v5, :cond_5

    .line 1774
    invoke-direct {v0, v13}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 1776
    :cond_5
    shl-int/lit8 v15, v10, 0x6

    and-int/lit8 v16, v13, 0x3f

    or-int v10, v15, v16

    .line 1777
    const/4 v15, 0x2

    if-le v12, v14, :cond_8

    .line 1778
    shr-int/lit8 v14, v9, 0x2

    aget v13, v1, v14

    .line 1779
    and-int/lit8 v11, v9, 0x3

    .line 1780
    rsub-int/lit8 v14, v11, 0x3

    shl-int/lit8 v14, v14, 0x3

    shr-int/2addr v13, v14

    .line 1781
    add-int/lit8 v9, v9, 0x1

    .line 1783
    and-int/lit16 v14, v13, 0xc0

    if-eq v14, v5, :cond_6

    .line 1784
    invoke-direct {v0, v13}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 1786
    :cond_6
    shl-int/lit8 v14, v10, 0x6

    and-int/lit8 v16, v13, 0x3f

    or-int v10, v14, v16

    .line 1787
    if-le v12, v15, :cond_8

    .line 1788
    shr-int/lit8 v14, v9, 0x2

    aget v13, v1, v14

    .line 1789
    and-int/lit8 v11, v9, 0x3

    .line 1790
    rsub-int/lit8 v14, v11, 0x3

    shl-int/lit8 v14, v14, 0x3

    shr-int/2addr v13, v14

    .line 1791
    add-int/lit8 v9, v9, 0x1

    .line 1792
    and-int/lit16 v14, v13, 0xc0

    if-eq v14, v5, :cond_7

    .line 1793
    and-int/lit16 v5, v13, 0xff

    invoke-direct {v0, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 1795
    :cond_7
    shl-int/lit8 v5, v10, 0x6

    and-int/lit8 v14, v13, 0x3f

    or-int/2addr v5, v14

    move v10, v5

    .line 1798
    :cond_8
    if-le v12, v15, :cond_a

    .line 1799
    const/high16 v5, 0x10000

    sub-int/2addr v10, v5

    .line 1800
    array-length v5, v7

    if-lt v8, v5, :cond_9

    .line 1801
    iget-object v5, v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v5

    move-object v7, v5

    .line 1803
    :cond_9
    add-int/lit8 v5, v8, 0x1

    .end local v8    # "cix":I
    .local v5, "cix":I
    shr-int/lit8 v14, v10, 0xa

    const v15, 0xd800

    add-int/2addr v14, v15

    int-to-char v14, v14

    aput-char v14, v7, v8

    .line 1804
    and-int/lit16 v8, v10, 0x3ff

    const v14, 0xdc00

    or-int v10, v8, v14

    move v8, v5

    .line 1807
    .end local v5    # "cix":I
    .end local v12    # "needed":I
    .end local v13    # "ch2":I
    .restart local v8    # "cix":I
    :cond_a
    array-length v5, v7

    if-lt v8, v5, :cond_b

    .line 1808
    iget-object v5, v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v5

    move-object v7, v5

    .line 1810
    :cond_b
    add-int/lit8 v5, v8, 0x1

    .end local v8    # "cix":I
    .restart local v5    # "cix":I
    int-to-char v12, v10

    aput-char v12, v7, v8

    .line 1811
    .end local v10    # "ch":I
    .end local v11    # "byteIx":I
    move v8, v5

    const/4 v5, 0x4

    goto/16 :goto_1

    .line 1814
    .end local v5    # "cix":I
    .end local v9    # "ix":I
    .restart local v8    # "cix":I
    :cond_c
    new-instance v5, Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct {v5, v7, v9, v8}, Ljava/lang/String;-><init>([CII)V

    .line 1816
    .local v5, "baseName":Ljava/lang/String;
    const/4 v9, 0x4

    if-ge v3, v9, :cond_d

    .line 1817
    add-int/lit8 v9, v2, -0x1

    aput v6, v1, v9

    .line 1819
    :cond_d
    iget-object v9, v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v9, v5, v1, v2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    move-result-object v9

    return-object v9
.end method

.method private final findName(II)Ljava/lang/String;
    .locals 3
    .param p1, "q1"    # I
    .param p2, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 1656
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->pad(II)I

    move-result p1

    .line 1658
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(I)Ljava/lang/String;

    move-result-object v0

    .line 1659
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1660
    return-object v0

    .line 1663
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 1664
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, p2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private final findName(III)Ljava/lang/String;
    .locals 3
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 1669
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->pad(II)I

    move-result p2

    .line 1671
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(II)Ljava/lang/String;

    move-result-object v0

    .line 1672
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1673
    return-object v0

    .line 1676
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 1677
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    aput p2, v1, v2

    .line 1678
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v2, 0x2

    invoke-direct {p0, v1, v2, p3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private final findName(IIII)Ljava/lang/String;
    .locals 4
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I
    .param p4, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 1683
    invoke-static {p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->pad(II)I

    move-result p3

    .line 1684
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(III)Ljava/lang/String;

    move-result-object v0

    .line 1685
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1686
    return-object v0

    .line 1688
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1689
    .local v1, "quads":[I
    const/4 v2, 0x0

    aput p1, v1, v2

    .line 1690
    const/4 v2, 0x1

    aput p2, v1, v2

    .line 1691
    const/4 v2, 0x2

    invoke-static {p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->pad(II)I

    move-result v3

    aput v3, v1, v2

    .line 1692
    const/4 v2, 0x3

    invoke-direct {p0, v1, v2, p4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private final findName([IIII)Ljava/lang/String;
    .locals 2
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "lastQuad"    # I
    .param p4, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 1697
    array-length v0, p1

    if-lt p2, v0, :cond_0

    .line 1698
    array-length v0, p1

    invoke-static {p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v0

    move-object p1, v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1700
    :cond_0
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "qlen":I
    .local v0, "qlen":I
    invoke-static {p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->pad(II)I

    move-result v1

    aput v1, p1, p2

    .line 1701
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {p2, p1, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object p2

    .line 1702
    .local p2, "name":Ljava/lang/String;
    if-nez p2, :cond_1

    .line 1703
    invoke-direct {p0, p1, v0, p4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1705
    :cond_1
    return-object p2
.end method

.method private static final pad(II)I
    .locals 2
    .param p0, "q"    # I
    .param p1, "bytes"    # I

    .line 2850
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    move v0, p0

    goto :goto_0

    :cond_0
    shl-int/lit8 v0, p1, 0x3

    const/4 v1, -0x1

    shl-int v0, v1, v0

    or-int/2addr v0, p0

    :goto_0
    return v0
.end method

.method private final parseName(III)Ljava/lang/String;
    .locals 6
    .param p1, "q1"    # I
    .param p2, "ch"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1372
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    .end local p1    # "q1":I
    .end local p2    # "ch":I
    .end local p3    # "lastQuadBytes":I
    .local v3, "q1":I
    .local v4, "ch":I
    .local v5, "lastQuadBytes":I
    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private final parseName(IIII)Ljava/lang/String;
    .locals 8
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "ch"    # I
    .param p4, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1376
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 1377
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v4, 0x1

    move-object v2, p0

    move v5, p2

    move v6, p3

    move v7, p4

    .end local p2    # "q2":I
    .end local p3    # "ch":I
    .end local p4    # "lastQuadBytes":I
    .local v5, "q2":I
    .local v6, "ch":I
    .local v7, "lastQuadBytes":I
    invoke-virtual/range {v2 .. v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object p2

    return-object p2
.end method

.method private final parseName(IIIII)Ljava/lang/String;
    .locals 8
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I
    .param p4, "ch"    # I
    .param p5, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1381
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 1382
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 1383
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    const/4 v4, 0x2

    move-object v2, p0

    move v5, p3

    move v6, p4

    move v7, p5

    .end local p3    # "q3":I
    .end local p4    # "ch":I
    .end local p5    # "lastQuadBytes":I
    .local v5, "q3":I
    .local v6, "ch":I
    .local v7, "lastQuadBytes":I
    invoke-virtual/range {v2 .. v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object p3

    return-object p3
.end method


# virtual methods
.method protected _closeInput()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    return-void
.end method

.method protected final _decodeBase64(Lcom/fasterxml/jackson/core/Base64Variant;)[B
    .locals 9
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2720
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_getByteArrayBuilder()Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    move-result-object v0

    .line 2727
    .local v0, "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2728
    .local v1, "ch":I
    const/16 v2, 0x20

    if-le v1, v2, :cond_0

    .line 2729
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v2

    .line 2730
    .local v2, "bits":I
    const/16 v3, 0x22

    if-gez v2, :cond_2

    .line 2731
    if-ne v1, v3, :cond_1

    .line 2732
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 2734
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {p0, p1, v1, v4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v2

    .line 2735
    if-gez v2, :cond_2

    .line 2736
    goto :goto_0

    .line 2739
    :cond_2
    move v4, v2

    .line 2742
    .local v4, "decodedData":I
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v5}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2743
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v2

    .line 2744
    if-gez v2, :cond_3

    .line 2745
    const/4 v5, 0x1

    invoke-virtual {p0, p1, v1, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v2

    .line 2747
    :cond_3
    shl-int/lit8 v5, v4, 0x6

    or-int v4, v5, v2

    .line 2749
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v5}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2750
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v2

    .line 2753
    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, -0x2

    if-gez v2, :cond_7

    .line 2754
    if-eq v2, v7, :cond_5

    .line 2756
    if-ne v1, v3, :cond_4

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v8

    if-nez v8, :cond_4

    .line 2757
    shr-int/lit8 v3, v4, 0x4

    .line 2758
    .end local v4    # "decodedData":I
    .local v3, "decodedData":I
    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 2759
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    return-object v4

    .line 2761
    .end local v3    # "decodedData":I
    .restart local v4    # "decodedData":I
    :cond_4
    invoke-virtual {p0, p1, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v2

    .line 2763
    :cond_5
    if-ne v2, v7, :cond_7

    .line 2764
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2765
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPaddingChar(I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 2769
    shr-int/lit8 v3, v4, 0x4

    .line 2770
    .end local v4    # "decodedData":I
    .restart local v3    # "decodedData":I
    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 2771
    goto :goto_0

    .line 2766
    .end local v3    # "decodedData":I
    .restart local v4    # "decodedData":I
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "expected padding character \'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getPaddingChar()C

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "\'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p1, v1, v5, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->reportInvalidBase64Char(Lcom/fasterxml/jackson/core/Base64Variant;IILjava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v3

    throw v3

    .line 2775
    :cond_7
    shl-int/lit8 v8, v4, 0x6

    or-int v4, v8, v2

    .line 2777
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v8}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2778
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v2

    .line 2779
    if-gez v2, :cond_a

    .line 2780
    if-eq v2, v7, :cond_9

    .line 2782
    if-ne v1, v3, :cond_8

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v3

    if-nez v3, :cond_8

    .line 2783
    shr-int/lit8 v3, v4, 0x2

    .line 2784
    .end local v4    # "decodedData":I
    .restart local v3    # "decodedData":I
    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendTwoBytes(I)V

    .line 2785
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    return-object v4

    .line 2787
    .end local v3    # "decodedData":I
    .restart local v4    # "decodedData":I
    :cond_8
    invoke-virtual {p0, p1, v1, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v2

    .line 2789
    :cond_9
    if-ne v2, v7, :cond_a

    .line 2796
    shr-int/lit8 v3, v4, 0x2

    .line 2797
    .end local v4    # "decodedData":I
    .restart local v3    # "decodedData":I
    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendTwoBytes(I)V

    .line 2798
    goto/16 :goto_0

    .line 2802
    .end local v3    # "decodedData":I
    .restart local v4    # "decodedData":I
    :cond_a
    shl-int/lit8 v3, v4, 0x6

    or-int/2addr v3, v2

    .line 2803
    .end local v4    # "decodedData":I
    .restart local v3    # "decodedData":I
    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendThreeBytes(I)V

    .line 2804
    .end local v1    # "ch":I
    .end local v2    # "bits":I
    .end local v3    # "decodedData":I
    goto/16 :goto_0
.end method

.method protected _decodeCharForError(I)I
    .locals 6
    .param p1, "firstByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2504
    and-int/lit16 v0, p1, 0xff

    .line 2505
    .local v0, "c":I
    const/16 v1, 0x7f

    if-le v0, v1, :cond_6

    .line 2509
    and-int/lit16 v1, v0, 0xe0

    const/16 v2, 0xc0

    if-ne v1, v2, :cond_0

    .line 2510
    and-int/lit8 v0, v0, 0x1f

    .line 2511
    const/4 v1, 0x1

    .local v1, "needed":I
    goto :goto_0

    .line 2512
    .end local v1    # "needed":I
    :cond_0
    and-int/lit16 v1, v0, 0xf0

    const/16 v2, 0xe0

    if-ne v1, v2, :cond_1

    .line 2513
    and-int/lit8 v0, v0, 0xf

    .line 2514
    const/4 v1, 0x2

    .restart local v1    # "needed":I
    goto :goto_0

    .line 2515
    .end local v1    # "needed":I
    :cond_1
    and-int/lit16 v1, v0, 0xf8

    const/16 v2, 0xf0

    if-ne v1, v2, :cond_2

    .line 2517
    and-int/lit8 v0, v0, 0x7

    .line 2518
    const/4 v1, 0x3

    .restart local v1    # "needed":I
    goto :goto_0

    .line 2520
    .end local v1    # "needed":I
    :cond_2
    and-int/lit16 v1, v0, 0xff

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidInitial(I)V

    .line 2521
    const/4 v1, 0x1

    .line 2524
    .restart local v1    # "needed":I
    :goto_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v2

    .line 2525
    .local v2, "d":I
    and-int/lit16 v3, v2, 0xc0

    const/16 v4, 0x80

    if-eq v3, v4, :cond_3

    .line 2526
    and-int/lit16 v3, v2, 0xff

    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2528
    :cond_3
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v5, v2, 0x3f

    or-int v0, v3, v5

    .line 2530
    const/4 v3, 0x1

    if-le v1, v3, :cond_6

    .line 2531
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v2

    .line 2532
    and-int/lit16 v3, v2, 0xc0

    if-eq v3, v4, :cond_4

    .line 2533
    and-int/lit16 v3, v2, 0xff

    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2535
    :cond_4
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v5, v2, 0x3f

    or-int v0, v3, v5

    .line 2536
    const/4 v3, 0x2

    if-le v1, v3, :cond_6

    .line 2537
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v2

    .line 2538
    and-int/lit16 v3, v2, 0xc0

    if-eq v3, v4, :cond_5

    .line 2539
    and-int/lit16 v3, v2, 0xff

    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidOther(I)V

    .line 2541
    :cond_5
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v2, 0x3f

    or-int v0, v3, v4

    .line 2545
    .end local v1    # "needed":I
    .end local v2    # "d":I
    :cond_6
    return v0
.end method

.method protected _decodeEscaped()C
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2461
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2463
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_0

    .line 2486
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeCharForError(I)I

    move-result v1

    int-to-char v1, v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleUnrecognizedCharacterEscape(C)C

    move-result v1

    return v1

    .line 2483
    :sswitch_0
    nop

    .line 2490
    const/4 v1, 0x0

    .line 2491
    .local v1, "value":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v3, 0x4

    if-ge v2, v3, :cond_1

    .line 2492
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v3

    .line 2493
    .local v3, "ch":I
    invoke-static {v3}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v4

    .line 2494
    .local v4, "digit":I
    if-gez v4, :cond_0

    .line 2495
    const-string v5, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v3, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2497
    :cond_0
    shl-int/lit8 v5, v1, 0x4

    or-int v1, v5, v4

    .line 2491
    .end local v3    # "ch":I
    .end local v4    # "digit":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2499
    .end local v2    # "i":I
    :cond_1
    int-to-char v2, v1

    return v2

    .line 2468
    .end local v1    # "value":I
    :sswitch_1
    const/16 v1, 0x9

    return v1

    .line 2474
    :sswitch_2
    const/16 v1, 0xd

    return v1

    .line 2470
    :sswitch_3
    const/16 v1, 0xa

    return v1

    .line 2472
    :sswitch_4
    const/16 v1, 0xc

    return v1

    .line 2466
    :sswitch_5
    const/16 v1, 0x8

    return v1

    .line 2480
    :sswitch_6
    int-to-char v1, v0

    return v1

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

.method protected _finishString()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1831
    const/4 v0, 0x0

    .line 1832
    .local v0, "outPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1833
    .local v1, "outBuf":[C
    sget-object v2, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icUTF8:[I

    .line 1834
    .local v2, "codes":[I
    array-length v3, v1

    .line 1837
    .local v3, "outEnd":I
    :goto_0
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v4}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 1838
    .local v4, "c":I
    aget v5, v2, v4

    if-eqz v5, :cond_1

    .line 1839
    const/16 v5, 0x22

    if-ne v4, v5, :cond_0

    .line 1840
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1841
    return-void

    .line 1843
    :cond_0
    invoke-direct {p0, v1, v0, v4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString2([CII)V

    .line 1844
    return-void

    .line 1846
    :cond_1
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outPtr":I
    .local v5, "outPtr":I
    int-to-char v6, v4

    aput-char v6, v1, v0

    .line 1847
    .end local v4    # "c":I
    if-lt v5, v3, :cond_2

    .line 1848
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    invoke-direct {p0, v1, v5, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString2([CII)V

    .line 1849
    return-void

    .line 1847
    :cond_2
    move v0, v5

    goto :goto_0
.end method

.method protected final _getText2(Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/String;
    .locals 1
    .param p1, "t"    # Lcom/fasterxml/jackson/core/JsonToken;

    .line 287
    if-nez p1, :cond_0

    .line 288
    const/4 v0, 0x0

    return-object v0

    .line 290
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 300
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonToken;->asString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 298
    :pswitch_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 292
    :pswitch_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected _handleApos()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2051
    const/4 v0, 0x0

    .line 2053
    .local v0, "c":I
    const/4 v1, 0x0

    .line 2054
    .local v1, "outPtr":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    .line 2057
    .local v2, "outBuf":[C
    sget-object v3, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icUTF8:[I

    .line 2064
    .local v3, "codes":[I
    :goto_0
    array-length v4, v2

    .line 2065
    .local v4, "outEnd":I
    array-length v5, v2

    if-lt v1, v5, :cond_0

    .line 2066
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2067
    const/4 v1, 0x0

    .line 2068
    array-length v4, v2

    .line 2071
    :cond_0
    :goto_1
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v5}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 2072
    const/16 v5, 0x27

    if-ne v0, v5, :cond_1

    .line 2073
    nop

    .line 2117
    .end local v4    # "outEnd":I
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2119
    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v4

    .line 2075
    .restart local v4    # "outEnd":I
    :cond_1
    aget v5, v3, v0

    if-eqz v5, :cond_5

    .line 2076
    nop

    .line 2081
    .end local v4    # "outEnd":I
    aget v4, v3, v0

    packed-switch v4, :pswitch_data_0

    .line 2103
    const/16 v4, 0x20

    if-ge v0, v4, :cond_3

    .line 2104
    const-string/jumbo v4, "string value"

    invoke-virtual {p0, v0, v4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_3

    .line 2092
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeUtf8_4(I)I

    move-result v0

    .line 2094
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "outPtr":I
    .local v4, "outPtr":I
    shr-int/lit8 v5, v0, 0xa

    const v6, 0xd800

    or-int/2addr v5, v6

    int-to-char v5, v5

    aput-char v5, v2, v1

    .line 2095
    array-length v1, v2

    if-lt v4, v1, :cond_2

    .line 2096
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2097
    const/4 v1, 0x0

    .end local v4    # "outPtr":I
    .restart local v1    # "outPtr":I
    goto :goto_2

    .line 2095
    .end local v1    # "outPtr":I
    .restart local v4    # "outPtr":I
    :cond_2
    move v1, v4

    .line 2099
    .end local v4    # "outPtr":I
    .restart local v1    # "outPtr":I
    :goto_2
    and-int/lit16 v4, v0, 0x3ff

    const v5, 0xdc00

    or-int v0, v4, v5

    .line 2101
    goto :goto_4

    .line 2089
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeUtf8_3(I)I

    move-result v0

    .line 2090
    goto :goto_4

    .line 2086
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeUtf8_2(I)I

    move-result v0

    .line 2087
    goto :goto_4

    .line 2083
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeEscaped()C

    move-result v0

    .line 2084
    goto :goto_4

    .line 2107
    :cond_3
    :goto_3
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidChar(I)V

    .line 2110
    :goto_4
    array-length v4, v2

    if-lt v1, v4, :cond_4

    .line 2111
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 2112
    const/4 v1, 0x0

    .line 2115
    :cond_4
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "outPtr":I
    .restart local v4    # "outPtr":I
    int-to-char v5, v0

    aput-char v5, v2, v1

    move v1, v4

    goto :goto_0

    .line 2078
    .restart local v1    # "outPtr":I
    .local v4, "outEnd":I
    :cond_5
    add-int/lit8 v5, v1, 0x1

    .end local v1    # "outPtr":I
    .local v5, "outPtr":I
    int-to-char v6, v0

    aput-char v6, v2, v1

    .line 2079
    if-lt v5, v4, :cond_6

    .line 2080
    .end local v4    # "outEnd":I
    move v1, v5

    goto/16 :goto_0

    .line 2079
    .restart local v4    # "outEnd":I
    :cond_6
    move v1, v5

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected _handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .param p1, "ch"    # I
    .param p2, "neg"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2129
    nop

    :goto_0
    const/16 v0, 0x49

    if-ne p1, v0, :cond_5

    .line 2130
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    .line 2132
    const/16 v0, 0x4e

    if-ne p1, v0, :cond_1

    .line 2133
    if-eqz p2, :cond_0

    const-string v0, "-INF"

    goto :goto_1

    :cond_0
    const-string v0, "+INF"

    .local v0, "match":Ljava/lang/String;
    :goto_1
    goto :goto_2

    .line 2134
    .end local v0    # "match":Ljava/lang/String;
    :cond_1
    const/16 v0, 0x6e

    if-ne p1, v0, :cond_5

    .line 2135
    if-eqz p2, :cond_2

    const-string v0, "-Infinity"

    goto :goto_2

    :cond_2
    const-string v0, "+Infinity"

    .line 2139
    .restart local v0    # "match":Ljava/lang/String;
    :goto_2
    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2140
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 2141
    if-eqz p2, :cond_3

    const-wide/high16 v1, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    goto :goto_3

    :cond_3
    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    :goto_3
    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 2143
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-standard token \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportError(Ljava/lang/String;)V

    .line 2144
    .end local v0    # "match":Ljava/lang/String;
    goto :goto_0

    .line 2145
    :cond_5
    const-string v0, "expected digit (0-9) to follow minus sign, for valid numeric value"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 2146
    const/4 v0, 0x0

    return-object v0
.end method

.method protected _handleOddName(I)Ljava/lang/String;
    .locals 6
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1489
    const/16 v0, 0x27

    if-ne p1, v0, :cond_0

    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1490
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseAposName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1492
    :cond_0
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_UNQUOTED_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1493
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeCharForError(I)I

    move-result v0

    int-to-char v0, v0

    .line 1494
    .local v0, "c":C
    const-string/jumbo v1, "was expecting double-quote to start field name"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1500
    .end local v0    # "c":C
    :cond_1
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8JsNames()[I

    move-result-object v0

    .line 1502
    .local v0, "codes":[I
    aget v1, v0, p1

    if-eqz v1, :cond_2

    .line 1503
    const-string/jumbo v1, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name"

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1510
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1511
    .local v1, "quads":[I
    const/4 v2, 0x0

    .line 1512
    .local v2, "qlen":I
    const/4 v3, 0x0

    .line 1513
    .local v3, "currQuad":I
    const/4 v4, 0x0

    .line 1517
    .local v4, "currQuadBytes":I
    :cond_3
    const/4 v5, 0x4

    if-ge v4, v5, :cond_4

    .line 1518
    add-int/lit8 v4, v4, 0x1

    .line 1519
    shl-int/lit8 v5, v3, 0x8

    or-int v3, v5, p1

    goto :goto_0

    .line 1521
    :cond_4
    array-length v5, v1

    if-lt v2, v5, :cond_5

    .line 1522
    array-length v5, v1

    invoke-static {v1, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v5

    move-object v1, v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1524
    :cond_5
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "qlen":I
    .local v5, "qlen":I
    aput v3, v1, v2

    .line 1525
    move v2, p1

    .line 1526
    .end local v3    # "currQuad":I
    .local v2, "currQuad":I
    const/4 v3, 0x1

    move v4, v3

    move v3, v2

    move v2, v5

    .line 1528
    .end local v5    # "qlen":I
    .local v2, "qlen":I
    .restart local v3    # "currQuad":I
    :goto_0
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v5}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    .line 1529
    aget v5, v0, p1

    if-eqz v5, :cond_3

    .line 1530
    nop

    .line 1534
    iput p1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 1535
    if-lez v4, :cond_7

    .line 1536
    array-length v5, v1

    if-lt v2, v5, :cond_6

    .line 1537
    array-length v5, v1

    invoke-static {v1, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v5

    move-object v1, v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1539
    :cond_6
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "qlen":I
    .restart local v5    # "qlen":I
    aput v3, v1, v2

    move v2, v5

    .line 1541
    .end local v5    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_7
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v5, v1, v2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v5

    .line 1542
    .local v5, "name":Ljava/lang/String;
    if-nez v5, :cond_8

    .line 1543
    invoke-direct {p0, v1, v2, v4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v5

    .line 1545
    :cond_8
    return-object v5
.end method

.method protected _handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1998
    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_0

    goto :goto_1

    .line 2000
    :sswitch_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2001
    goto :goto_1

    .line 2024
    :sswitch_1
    const-string v1, "NaN"

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2025
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2026
    const-wide/high16 v2, 0x7ff8000000000000L    # Double.NaN

    invoke-virtual {p0, v1, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2028
    :cond_0
    const-string v0, "Non-standard token \'NaN\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportError(Ljava/lang/String;)V

    .line 2029
    goto :goto_1

    .line 2031
    :sswitch_2
    const-string v1, "Infinity"

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2032
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2033
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-virtual {p0, v1, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2035
    :cond_1
    const-string v0, "Non-standard token \'Infinity\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportError(Ljava/lang/String;)V

    .line 2036
    goto :goto_1

    .line 2008
    :cond_2
    :sswitch_3
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_MISSING_VALUES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2010
    iput p1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 2011
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 2017
    :cond_3
    :sswitch_4
    const-string v0, "expected a value"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    goto :goto_0

    .line 2038
    :sswitch_5
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2019
    :goto_0
    :sswitch_6
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2020
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleApos()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2041
    :cond_4
    :goto_1
    invoke-static {p1}, Ljava/lang/Character;->isJavaIdentifierStart(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2042
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    int-to-char v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "(\'true\', \'false\' or \'null\')"

    invoke-virtual {p0, p1, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidToken(ILjava/lang/String;Ljava/lang/String;)V

    .line 2045
    :cond_5
    const-string v0, "expected a valid value (number, String, array, object, \'true\', \'false\' or \'null\')"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2046
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

.method protected final _matchToken(Ljava/lang/String;I)V
    .locals 3
    .param p1, "matchStr"    # Ljava/lang/String;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2151
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 2153
    .local v0, "len":I
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2154
    .local v1, "ch":I
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_1

    .line 2155
    const/4 v2, 0x0

    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidToken(ILjava/lang/String;)V

    .line 2157
    .end local v1    # "ch":I
    :cond_1
    add-int/lit8 p2, p2, 0x1

    if-lt p2, v0, :cond_0

    .line 2159
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 2160
    .restart local v1    # "ch":I
    const/16 v2, 0x30

    if-lt v1, v2, :cond_2

    const/16 v2, 0x5d

    if-eq v1, v2, :cond_2

    const/16 v2, 0x7d

    if-eq v1, v2, :cond_2

    .line 2161
    invoke-direct {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_checkMatchEnd(Ljava/lang/String;II)V

    .line 2163
    :cond_2
    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 2164
    return-void
.end method

.method protected _parseAposName()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1556
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 1557
    .local v0, "ch":I
    const/16 v1, 0x27

    if-ne v0, v1, :cond_0

    .line 1558
    const-string v1, ""

    return-object v1

    .line 1560
    :cond_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1561
    .local v2, "quads":[I
    const/4 v3, 0x0

    .line 1562
    .local v3, "qlen":I
    const/4 v4, 0x0

    .line 1563
    .local v4, "currQuad":I
    const/4 v5, 0x0

    .line 1567
    .local v5, "currQuadBytes":I
    sget-object v6, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icLatin1:[I

    .line 1570
    .local v6, "codes":[I
    :goto_0
    if-ne v0, v1, :cond_4

    .line 1571
    nop

    .line 1635
    if-lez v5, :cond_2

    .line 1636
    array-length v1, v2

    if-lt v3, v1, :cond_1

    .line 1637
    array-length v1, v2

    invoke-static {v2, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v1

    move-object v2, v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1639
    :cond_1
    add-int/lit8 v1, v3, 0x1

    .end local v3    # "qlen":I
    .local v1, "qlen":I
    invoke-static {v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->pad(II)I

    move-result v7

    aput v7, v2, v3

    move v3, v1

    .line 1641
    .end local v1    # "qlen":I
    .restart local v3    # "qlen":I
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v1

    .line 1642
    .local v1, "name":Ljava/lang/String;
    if-nez v1, :cond_3

    .line 1643
    invoke-direct {p0, v2, v3, v5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v1

    .line 1645
    :cond_3
    return-object v1

    .line 1574
    .end local v1    # "name":Ljava/lang/String;
    :cond_4
    const/16 v7, 0x22

    const/4 v8, 0x4

    if-eq v0, v7, :cond_b

    aget v7, v6, v0

    if-eqz v7, :cond_b

    .line 1575
    const/16 v7, 0x5c

    if-eq v0, v7, :cond_5

    .line 1578
    const-string v7, "name"

    invoke-virtual {p0, v0, v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_1

    .line 1581
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeEscaped()C

    move-result v0

    .line 1587
    :goto_1
    const/16 v7, 0x7f

    if-le v0, v7, :cond_b

    .line 1589
    if-lt v5, v8, :cond_7

    .line 1590
    array-length v7, v2

    if-lt v3, v7, :cond_6

    .line 1591
    array-length v7, v2

    invoke-static {v2, v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v7

    move-object v2, v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1593
    :cond_6
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "qlen":I
    .local v7, "qlen":I
    aput v4, v2, v3

    .line 1594
    const/4 v4, 0x0

    .line 1595
    const/4 v5, 0x0

    move v3, v7

    .line 1597
    .end local v7    # "qlen":I
    .restart local v3    # "qlen":I
    :cond_7
    const/16 v7, 0x800

    if-ge v0, v7, :cond_8

    .line 1598
    shl-int/lit8 v7, v4, 0x8

    shr-int/lit8 v9, v0, 0x6

    or-int/lit16 v9, v9, 0xc0

    or-int v4, v7, v9

    .line 1599
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1602
    :cond_8
    shl-int/lit8 v7, v4, 0x8

    shr-int/lit8 v9, v0, 0xc

    or-int/lit16 v9, v9, 0xe0

    or-int v4, v7, v9

    .line 1603
    add-int/lit8 v5, v5, 0x1

    .line 1605
    if-lt v5, v8, :cond_a

    .line 1606
    array-length v7, v2

    if-lt v3, v7, :cond_9

    .line 1607
    array-length v7, v2

    invoke-static {v2, v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v7

    move-object v2, v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1609
    :cond_9
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "qlen":I
    .restart local v7    # "qlen":I
    aput v4, v2, v3

    .line 1610
    const/4 v4, 0x0

    .line 1611
    const/4 v5, 0x0

    move v3, v7

    .line 1613
    .end local v7    # "qlen":I
    .restart local v3    # "qlen":I
    :cond_a
    shl-int/lit8 v7, v4, 0x8

    shr-int/lit8 v9, v0, 0x6

    and-int/lit8 v9, v9, 0x3f

    or-int/lit16 v9, v9, 0x80

    or-int v4, v7, v9

    .line 1614
    add-int/lit8 v5, v5, 0x1

    .line 1617
    :goto_2
    and-int/lit8 v7, v0, 0x3f

    or-int/lit16 v0, v7, 0x80

    .line 1621
    :cond_b
    if-ge v5, v8, :cond_c

    .line 1622
    add-int/lit8 v5, v5, 0x1

    .line 1623
    shl-int/lit8 v7, v4, 0x8

    or-int v4, v7, v0

    goto :goto_3

    .line 1625
    :cond_c
    array-length v7, v2

    if-lt v3, v7, :cond_d

    .line 1626
    array-length v7, v2

    invoke-static {v2, v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v7

    move-object v2, v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1628
    :cond_d
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "qlen":I
    .restart local v7    # "qlen":I
    aput v4, v2, v3

    .line 1629
    move v3, v0

    .line 1630
    .end local v4    # "currQuad":I
    .local v3, "currQuad":I
    const/4 v4, 0x1

    move v5, v4

    move v4, v3

    move v3, v7

    .line 1632
    .end local v7    # "qlen":I
    .local v3, "qlen":I
    .restart local v4    # "currQuad":I
    :goto_3
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v7}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    goto/16 :goto_0
.end method

.method protected final _parseName(I)Ljava/lang/String;
    .locals 4
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1184
    const/16 v0, 0x22

    if-eq p1, v0, :cond_0

    .line 1185
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleOddName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1193
    :cond_0
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icLatin1:[I

    .line 1195
    .local v1, "codes":[I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v2

    .line 1197
    .local v2, "q":I
    aget v3, v1, v2

    if-nez v3, :cond_9

    .line 1198
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    .line 1199
    aget v3, v1, p1

    if-nez v3, :cond_7

    .line 1200
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1201
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    .line 1202
    aget v3, v1, p1

    if-nez v3, :cond_5

    .line 1203
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1204
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    .line 1205
    aget v3, v1, p1

    if-nez v3, :cond_3

    .line 1206
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1207
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    .line 1208
    aget v3, v1, p1

    if-nez v3, :cond_1

    .line 1209
    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quad1:I

    .line 1210
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseMediumName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1212
    :cond_1
    const/4 v3, 0x4

    if-ne p1, v0, :cond_2

    .line 1213
    invoke-direct {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1215
    :cond_2
    invoke-direct {p0, v2, p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1217
    :cond_3
    const/4 v3, 0x3

    if-ne p1, v0, :cond_4

    .line 1218
    invoke-direct {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1220
    :cond_4
    invoke-direct {p0, v2, p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1222
    :cond_5
    const/4 v3, 0x2

    if-ne p1, v0, :cond_6

    .line 1223
    invoke-direct {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1225
    :cond_6
    invoke-direct {p0, v2, p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1227
    :cond_7
    const/4 v3, 0x1

    if-ne p1, v0, :cond_8

    .line 1228
    invoke-direct {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1230
    :cond_8
    invoke-direct {p0, v2, p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1232
    :cond_9
    if-ne v2, v0, :cond_a

    .line 1233
    const-string v0, ""

    return-object v0

    .line 1235
    :cond_a
    const/4 v0, 0x0

    invoke-direct {p0, v0, v2, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected _parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1015
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    .line 1016
    .local v2, "outBuf":[C
    const/4 v0, 0x0

    .line 1019
    .local v0, "outPtr":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "outPtr":I
    .local v1, "outPtr":I
    const/16 v3, 0x2d

    aput-char v3, v2, v0

    .line 1020
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 1021
    .local v0, "c":I
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "outPtr":I
    .local v3, "outPtr":I
    int-to-char v4, v0

    aput-char v4, v2, v1

    .line 1023
    const/16 v1, 0x39

    const/4 v4, 0x1

    const/16 v5, 0x30

    if-gt v0, v5, :cond_1

    .line 1025
    if-ne v0, v5, :cond_0

    .line 1026
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleLeadingZeroes()I

    move-result v0

    goto :goto_0

    .line 1028
    :cond_0
    invoke-virtual {p0, v0, v4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1031
    :cond_1
    if-le v0, v1, :cond_2

    .line 1032
    invoke-virtual {p0, v0, v4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1034
    :cond_2
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v6}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 1037
    :goto_0
    const/4 v6, 0x1

    .line 1040
    .local v6, "intLen":I
    :goto_1
    if-gt v0, v1, :cond_3

    if-lt v0, v5, :cond_3

    .line 1041
    add-int/lit8 v6, v6, 0x1

    .line 1042
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v8, v0

    aput-char v8, v2, v3

    .line 1043
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    move v3, v7

    goto :goto_1

    .line 1045
    .end local v7    # "outPtr":I
    .restart local v3    # "outPtr":I
    :cond_3
    const/16 v1, 0x2e

    if-eq v0, v1, :cond_6

    const/16 v1, 0x65

    if-eq v0, v1, :cond_6

    const/16 v1, 0x45

    if-ne v0, v1, :cond_4

    goto :goto_2

    .line 1048
    :cond_4
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1050
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 1051
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1052
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_verifyRootSpace()V

    .line 1055
    :cond_5
    invoke-virtual {p0, v4, v6}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 1046
    :cond_6
    :goto_2
    const/4 v5, 0x1

    move-object v1, p0

    move v4, v0

    .end local v0    # "c":I
    .local v4, "c":I
    invoke-direct/range {v1 .. v6}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 8
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 973
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    .line 978
    .local v2, "outBuf":[C
    const/16 v0, 0x39

    const/4 v1, 0x0

    const/16 v3, 0x30

    if-ne p1, v3, :cond_1

    .line 979
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleLeadingZeroes()I

    move-result p1

    .line 980
    if-gt p1, v0, :cond_0

    if-lt p1, v3, :cond_0

    .line 981
    const/4 v4, 0x0

    .local v4, "outPtr":I
    goto :goto_0

    .line 983
    .end local v4    # "outPtr":I
    :cond_0
    aput-char v3, v2, v1

    .line 984
    const/4 v4, 0x1

    .restart local v4    # "outPtr":I
    goto :goto_0

    .line 987
    .end local v4    # "outPtr":I
    :cond_1
    int-to-char v4, p1

    aput-char v4, v2, v1

    .line 988
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v4}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    .line 989
    const/4 v4, 0x1

    .line 991
    .restart local v4    # "outPtr":I
    :goto_0
    move v5, v4

    move v6, v4

    move v4, p1

    move p1, v3

    move v3, v6

    move v6, v5

    .line 994
    .end local p1    # "c":I
    .local v3, "outPtr":I
    .local v4, "c":I
    .local v6, "intLen":I
    :goto_1
    if-gt v4, v0, :cond_2

    if-lt v4, p1, :cond_2

    .line 995
    add-int/lit8 v6, v6, 0x1

    .line 996
    add-int/lit8 v5, v3, 0x1

    .end local v3    # "outPtr":I
    .local v5, "outPtr":I
    int-to-char v7, v4

    aput-char v7, v2, v3

    .line 997
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    move v3, v5

    goto :goto_1

    .line 999
    .end local v5    # "outPtr":I
    .restart local v3    # "outPtr":I
    :cond_2
    const/16 p1, 0x2e

    if-eq v4, p1, :cond_5

    const/16 p1, 0x65

    if-eq v4, p1, :cond_5

    const/16 p1, 0x45

    if-ne v4, p1, :cond_3

    goto :goto_3

    .line 1002
    :cond_3
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1004
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1005
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_verifyRootSpace()V

    goto :goto_2

    .line 1007
    :cond_4
    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextByte:I

    .line 1010
    :goto_2
    invoke-virtual {p0, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1000
    :cond_5
    :goto_3
    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected _readBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;[B)I
    .locals 12
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 438
    const/4 v0, 0x0

    .line 439
    .local v0, "outputPtr":I
    array-length v1, p3

    const/4 v2, 0x3

    sub-int/2addr v1, v2

    .line 440
    .local v1, "outputEnd":I
    const/4 v3, 0x0

    .line 446
    .local v3, "outputCount":I
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v4}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 447
    .local v4, "ch":I
    const/16 v5, 0x20

    if-le v4, v5, :cond_0

    .line 448
    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v5

    .line 449
    .local v5, "bits":I
    const/16 v6, 0x22

    const/4 v7, 0x0

    if-gez v5, :cond_2

    .line 450
    if-ne v4, v6, :cond_1

    .line 451
    goto/16 :goto_1

    .line 453
    :cond_1
    invoke-virtual {p0, p1, v4, v7}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v5

    .line 454
    if-gez v5, :cond_2

    .line 455
    goto :goto_0

    .line 460
    :cond_2
    if-le v0, v1, :cond_3

    .line 461
    add-int/2addr v3, v0

    .line 462
    invoke-virtual {p2, p3, v7, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 463
    const/4 v0, 0x0

    .line 466
    :cond_3
    move v8, v5

    .line 469
    .local v8, "decodedData":I
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v9}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 470
    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v5

    .line 471
    if-gez v5, :cond_4

    .line 472
    const/4 v9, 0x1

    invoke-virtual {p0, p1, v4, v9}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v5

    .line 474
    :cond_4
    shl-int/lit8 v9, v8, 0x6

    or-int v8, v9, v5

    .line 477
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v9}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 478
    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v5

    .line 481
    const/4 v9, 0x2

    const/4 v10, -0x2

    if-gez v5, :cond_8

    .line 482
    if-eq v5, v10, :cond_6

    .line 484
    if-ne v4, v6, :cond_5

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v11

    if-nez v11, :cond_5

    .line 485
    shr-int/lit8 v2, v8, 0x4

    .line 486
    .end local v8    # "decodedData":I
    .local v2, "decodedData":I
    add-int/lit8 v6, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v6, "outputPtr":I
    int-to-byte v8, v2

    aput-byte v8, p3, v0

    .line 487
    move v0, v6

    goto :goto_1

    .line 489
    .end local v2    # "decodedData":I
    .end local v6    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    .restart local v8    # "decodedData":I
    :cond_5
    invoke-virtual {p0, p1, v4, v9}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v5

    .line 491
    :cond_6
    if-ne v5, v10, :cond_8

    .line 493
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v6}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 494
    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPaddingChar(I)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 498
    shr-int/lit8 v6, v8, 0x4

    .line 499
    .end local v8    # "decodedData":I
    .local v6, "decodedData":I
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v7, "outputPtr":I
    int-to-byte v8, v6

    aput-byte v8, p3, v0

    .line 500
    move v0, v7

    goto :goto_0

    .line 495
    .end local v6    # "decodedData":I
    .end local v7    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    .restart local v8    # "decodedData":I
    :cond_7
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "expected padding character \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getPaddingChar()C

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v4, v2, v6}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->reportInvalidBase64Char(Lcom/fasterxml/jackson/core/Base64Variant;IILjava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v2

    throw v2

    .line 504
    :cond_8
    shl-int/lit8 v11, v8, 0x6

    or-int v8, v11, v5

    .line 506
    iget-object v11, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v11}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 507
    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v5

    .line 508
    if-gez v5, :cond_c

    .line 509
    if-eq v5, v10, :cond_b

    .line 511
    if-ne v4, v6, :cond_a

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v6

    if-nez v6, :cond_a

    .line 512
    shr-int/lit8 v2, v8, 0x2

    .line 513
    .end local v8    # "decodedData":I
    .restart local v2    # "decodedData":I
    add-int/lit8 v6, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v6, "outputPtr":I
    shr-int/lit8 v8, v2, 0x8

    int-to-byte v8, v8

    aput-byte v8, p3, v0

    .line 514
    add-int/lit8 v0, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v8, v2

    aput-byte v8, p3, v6

    .line 515
    nop

    .line 538
    .end local v2    # "decodedData":I
    .end local v4    # "ch":I
    .end local v5    # "bits":I
    :goto_1
    iput-boolean v7, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 539
    if-lez v0, :cond_9

    .line 540
    add-int/2addr v3, v0

    .line 541
    invoke-virtual {p2, p3, v7, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 543
    :cond_9
    return v3

    .line 517
    .restart local v4    # "ch":I
    .restart local v5    # "bits":I
    .restart local v8    # "decodedData":I
    :cond_a
    invoke-virtual {p0, p1, v4, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v5

    .line 519
    :cond_b
    if-ne v5, v10, :cond_c

    .line 526
    shr-int/lit8 v6, v8, 0x2

    .line 527
    .end local v8    # "decodedData":I
    .local v6, "decodedData":I
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "outputPtr":I
    .restart local v7    # "outputPtr":I
    shr-int/lit8 v8, v6, 0x8

    int-to-byte v8, v8

    aput-byte v8, p3, v0

    .line 528
    add-int/lit8 v0, v7, 0x1

    .end local v7    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v8, v6

    aput-byte v8, p3, v7

    .line 529
    goto/16 :goto_0

    .line 533
    .end local v6    # "decodedData":I
    .restart local v8    # "decodedData":I
    :cond_c
    shl-int/lit8 v6, v8, 0x6

    or-int/2addr v6, v5

    .line 534
    .end local v8    # "decodedData":I
    .restart local v6    # "decodedData":I
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "outputPtr":I
    .restart local v7    # "outputPtr":I
    shr-int/lit8 v8, v6, 0x10

    int-to-byte v8, v8

    aput-byte v8, p3, v0

    .line 535
    add-int/lit8 v0, v7, 0x1

    .end local v7    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    shr-int/lit8 v8, v6, 0x8

    int-to-byte v8, v8

    aput-byte v8, p3, v7

    .line 536
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "outputPtr":I
    .restart local v7    # "outputPtr":I
    int-to-byte v8, v6

    aput-byte v8, p3, v0

    .line 537
    .end local v4    # "ch":I
    .end local v5    # "bits":I
    .end local v6    # "decodedData":I
    move v0, v7

    goto/16 :goto_0
.end method

.method protected _releaseBuffers()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    invoke-super {p0}, Lcom/fasterxml/jackson/core/base/ParserBase;->_releaseBuffers()V

    .line 165
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->release()V

    .line 166
    return-void
.end method

.method protected _reportInvalidChar(I)V
    .locals 1
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 2681
    const/16 v0, 0x20

    if-ge p1, v0, :cond_0

    .line 2682
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_throwInvalidSpace(I)V

    .line 2684
    :cond_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidInitial(I)V

    .line 2685
    return-void
.end method

.method protected _reportInvalidInitial(I)V
    .locals 2
    .param p1, "mask"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 2690
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid UTF-8 start byte 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportError(Ljava/lang/String;)V

    .line 2691
    return-void
.end method

.method protected _reportInvalidToken(ILjava/lang/String;)V
    .locals 1
    .param p1, "ch"    # I
    .param p2, "matchedPart"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2654
    const-string v0, "\'null\', \'true\', \'false\' or NaN"

    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidToken(ILjava/lang/String;Ljava/lang/String;)V

    .line 2655
    return-void
.end method

.method protected _reportInvalidToken(ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "ch"    # I
    .param p2, "matchedPart"    # Ljava/lang/String;
    .param p3, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2660
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2667
    .local v0, "sb":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeCharForError(I)I

    move-result v1

    int-to-char v1, v1

    .line 2668
    .local v1, "c":C
    invoke-static {v1}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2669
    nop

    .line 2674
    .end local v1    # "c":C
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized token \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\': was expecting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportError(Ljava/lang/String;)V

    .line 2675
    return-void

    .line 2671
    .restart local v1    # "c":C
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2672
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p1

    .line 2673
    .end local v1    # "c":C
    goto :goto_0
.end method

.method protected _skipString()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1945
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 1948
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icUTF8:[I

    .line 1956
    .local v0, "codes":[I
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 1957
    .local v1, "c":I
    aget v2, v0, v1

    if-eqz v2, :cond_0

    .line 1958
    nop

    .line 1962
    const/16 v2, 0x22

    if-ne v1, v2, :cond_1

    .line 1963
    nop

    .line 1988
    .end local v1    # "c":I
    return-void

    .line 1966
    .restart local v1    # "c":I
    :cond_1
    aget v2, v0, v1

    packed-switch v2, :pswitch_data_0

    .line 1980
    const/16 v2, 0x20

    if-ge v1, v2, :cond_2

    .line 1981
    const-string/jumbo v2, "string value"

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_1

    .line 1977
    :pswitch_0
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_4()V

    .line 1978
    goto :goto_1

    .line 1974
    :pswitch_1
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_3()V

    .line 1975
    goto :goto_1

    .line 1971
    :pswitch_2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipUtf8_2()V

    .line 1972
    goto :goto_1

    .line 1968
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeEscaped()C

    .line 1969
    goto :goto_1

    .line 1984
    :cond_2
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportInvalidChar(I)V

    .line 1987
    .end local v1    # "c":I
    :goto_1
    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public finishToken()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 736
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_0

    .line 737
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 738
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString()V

    .line 740
    :cond_0
    return-void
.end method

.method public getBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;)[B
    .locals 3
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 389
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_EMBEDDED_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_binaryValue:[B

    if-nez v0, :cond_1

    .line 391
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current token ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportError(Ljava/lang/String;)V

    .line 396
    :cond_1
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_2

    .line 398
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_binaryValue:[B
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 401
    nop

    .line 405
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    goto :goto_0

    .line 399
    :catch_0
    move-exception v0

    .line 400
    .local v0, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to decode VALUE_STRING as base64 ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v1

    throw v1

    .line 407
    .end local v0    # "iae":Ljava/lang/IllegalArgumentException;
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_binaryValue:[B

    if-nez v0, :cond_3

    .line 409
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_getByteArrayBuilder()Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    move-result-object v0

    .line 410
    .local v0, "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeBase64(Ljava/lang/String;Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;Lcom/fasterxml/jackson/core/Base64Variant;)V

    .line 411
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_binaryValue:[B

    .line 414
    .end local v0    # "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_binaryValue:[B

    return-object v0
.end method

.method public getCodec()Lcom/fasterxml/jackson/core/ObjectCodec;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    return-object v0
.end method

.method public getCurrentLocation()Lcom/fasterxml/jackson/core/JsonLocation;
    .locals 8

    .line 2820
    new-instance v0, Lcom/fasterxml/jackson/core/JsonLocation;

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_getSourceReference()Ljava/lang/Object;

    move-result-object v1

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    const/4 v7, -0x1

    const-wide/16 v2, -0x1

    const-wide/16 v4, -0x1

    invoke-direct/range {v0 .. v7}, Lcom/fasterxml/jackson/core/JsonLocation;-><init>(Ljava/lang/Object;JJII)V

    return-object v0
.end method

.method public getInputSource()Ljava/lang/Object;
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    return-object v0
.end method

.method public getText(Ljava/io/Writer;)I
    .locals 3
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 191
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 192
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_0

    .line 193
    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 194
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString()V

    .line 196
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsToWriter(Ljava/io/Writer;)I

    move-result v1

    return v1

    .line 198
    :cond_1
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2

    .line 199
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v1

    .line 200
    .local v1, "n":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 201
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    return v2

    .line 203
    .end local v1    # "n":Ljava/lang/String;
    :cond_2
    if-eqz v0, :cond_4

    .line 204
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->isNumeric()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 205
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsToWriter(Ljava/io/Writer;)I

    move-result v1

    return v1

    .line 207
    :cond_3
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v1

    .line 208
    .local v1, "ch":[C
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write([C)V

    .line 209
    array-length v2, v1

    return v2

    .line 211
    .end local v1    # "ch":[C
    :cond_4
    return v2
.end method

.method public getText()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 178
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_0

    .line 179
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 180
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishAndReturnString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 184
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_getText2(Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextCharacters()[C
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v0, :cond_4

    .line 308
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 335
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v0

    return-object v0

    .line 325
    :pswitch_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_0

    .line 326
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 327
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString()V

    .line 332
    :cond_0
    :pswitch_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextBuffer()[C

    move-result-object v0

    return-object v0

    .line 311
    :pswitch_2
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopied:Z

    if-nez v0, :cond_3

    .line 312
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 313
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    .line 314
    .local v2, "nameLen":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopyBuffer:[C

    if-nez v3, :cond_1

    .line 315
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v3, v2}, Lcom/fasterxml/jackson/core/io/IOContext;->allocNameCopyBuffer(I)[C

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopyBuffer:[C

    goto :goto_0

    .line 316
    :cond_1
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopyBuffer:[C

    array-length v3, v3

    if-ge v3, v2, :cond_2

    .line 317
    new-array v3, v2, [C

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopyBuffer:[C

    .line 319
    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopyBuffer:[C

    invoke-virtual {v0, v1, v2, v3, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 320
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopied:Z

    .line 322
    .end local v0    # "name":Ljava/lang/String;
    .end local v2    # "nameLen":I
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopyBuffer:[C

    return-object v0

    .line 338
    :cond_4
    const/4 v0, 0x0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public getTextLength()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 344
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 345
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_0

    .line 346
    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 347
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString()V

    .line 349
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v0

    return v0

    .line 351
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2

    .line 352
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0

    .line 354
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v0, :cond_4

    .line 355
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->isNumeric()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 356
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v0

    return v0

    .line 358
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v0

    array-length v0, v0

    return v0

    .line 360
    :cond_4
    return v2
.end method

.method public getTextOffset()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 367
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 368
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 372
    :pswitch_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_0

    .line 373
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 374
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishString()V

    .line 379
    :cond_0
    :pswitch_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextOffset()I

    move-result v0

    return v0

    .line 370
    :pswitch_2
    return v1

    .line 383
    :cond_1
    :goto_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public getTokenLocation()Lcom/fasterxml/jackson/core/JsonLocation;
    .locals 8

    .line 2815
    new-instance v0, Lcom/fasterxml/jackson/core/JsonLocation;

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_getSourceReference()Ljava/lang/Object;

    move-result-object v1

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    const/4 v7, -0x1

    const-wide/16 v2, -0x1

    const-wide/16 v4, -0x1

    invoke-direct/range {v0 .. v7}, Lcom/fasterxml/jackson/core/JsonLocation;-><init>(Ljava/lang/Object;JJII)V

    return-object v0
.end method

.method public getValueAsInt()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 250
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 251
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 263
    :cond_0
    const/4 v1, 0x0

    invoke-super {p0, v1}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsInt(I)I

    move-result v1

    return v1

    .line 253
    :cond_1
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numTypesValid:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_3

    .line 254
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numTypesValid:I

    if-nez v1, :cond_2

    .line 255
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseIntValue()I

    move-result v1

    return v1

    .line 257
    :cond_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numTypesValid:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_3

    .line 258
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->convertNumberToInt()V

    .line 261
    :cond_3
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numberInt:I

    return v1
.end method

.method public getValueAsInt(I)I
    .locals 2
    .param p1, "defValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 269
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 270
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 282
    :cond_0
    invoke-super {p0, p1}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsInt(I)I

    move-result v1

    return v1

    .line 272
    :cond_1
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numTypesValid:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_3

    .line 273
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numTypesValid:I

    if-nez v1, :cond_2

    .line 274
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseIntValue()I

    move-result v1

    return v1

    .line 276
    :cond_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numTypesValid:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_3

    .line 277
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->convertNumberToInt()V

    .line 280
    :cond_3
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numberInt:I

    return v1
.end method

.method public getValueAsString()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 219
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_0

    .line 220
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 221
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishAndReturnString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 223
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 225
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2

    .line 226
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 228
    :cond_2
    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValueAsString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "defValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 235
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_0

    .line 236
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 237
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishAndReturnString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 241
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2

    .line 242
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 244
    :cond_2
    invoke-super {p0, p1}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nextBooleanValue()Ljava/lang/Boolean;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 921
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_4

    .line 922
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopied:Z

    .line 923
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 924
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 925
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 926
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 927
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v1

    .line 929
    :cond_0
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 930
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v1

    .line 932
    :cond_1
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2

    .line 933
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_0

    .line 934
    :cond_2
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_3

    .line 935
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 937
    :cond_3
    :goto_0
    return-object v2

    .line 940
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 941
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_5

    .line 942
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v1

    .line 944
    :cond_5
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_6

    .line 945
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v1

    .line 947
    :cond_6
    return-object v2
.end method

.method public nextFieldName()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 756
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numTypesValid:I

    .line 757
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 758
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    .line 759
    return-object v2

    .line 761
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_1

    .line 762
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipString()V

    .line 764
    :cond_1
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipWS()I

    move-result v0

    .line 765
    .local v0, "i":I
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_binaryValue:[B

    .line 766
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    .line 768
    const/16 v1, 0x5d

    if-eq v0, v1, :cond_8

    const/16 v3, 0x7d

    if-ne v0, v3, :cond_2

    goto/16 :goto_1

    .line 774
    :cond_2
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 775
    const/16 v4, 0x2c

    if-eq v0, v4, :cond_3

    .line 776
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "was expecting comma to separate "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->typeDesc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " entries"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v0, v4}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 778
    :cond_3
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipWS()I

    move-result v0

    .line 781
    sget-object v4, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_TRAILING_COMMA:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_features:I

    invoke-virtual {v4, v5}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->enabledIn(I)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 782
    if-eq v0, v1, :cond_4

    if-ne v0, v3, :cond_5

    .line 783
    :cond_4
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_closeScope(I)V

    .line 784
    return-object v2

    .line 789
    :cond_5
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v1

    if-nez v1, :cond_6

    .line 790
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    .line 791
    return-object v2

    .line 794
    :cond_6
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseName(I)Ljava/lang/String;

    move-result-object v1

    .line 795
    .local v1, "nameStr":Ljava/lang/String;
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 796
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 798
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon()I

    move-result v0

    .line 799
    const/16 v2, 0x22

    const/4 v3, 0x1

    if-ne v0, v2, :cond_7

    .line 800
    iput-boolean v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 801
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 802
    return-object v1

    .line 805
    :cond_7
    const/4 v2, 0x0

    sparse-switch v0, :sswitch_data_0

    .line 841
    .local v2, "t":Lcom/fasterxml/jackson/core/JsonToken;
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    goto :goto_0

    .line 837
    :sswitch_0
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 838
    goto :goto_0

    .line 830
    :sswitch_1
    const-string/jumbo v4, "true"

    invoke-virtual {p0, v4, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 831
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 832
    goto :goto_0

    .line 826
    :sswitch_2
    const-string v4, "null"

    invoke-virtual {p0, v4, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 827
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 828
    goto :goto_0

    .line 822
    :sswitch_3
    const-string v4, "false"

    invoke-virtual {p0, v4, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 823
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 824
    goto :goto_0

    .line 834
    :sswitch_4
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 835
    goto :goto_0

    .line 819
    :sswitch_5
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 820
    goto :goto_0

    .line 807
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 808
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    nop

    .line 843
    :goto_0
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 844
    return-object v1

    .line 769
    .end local v1    # "nameStr":Ljava/lang/String;
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_8
    :goto_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_closeScope(I)V

    .line 770
    return-object v2

    :sswitch_data_0
    .sparse-switch
        0x2d -> :sswitch_6
        0x30 -> :sswitch_5
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

.method public nextIntValue(I)I
    .locals 4
    .param p1, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 877
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_3

    .line 878
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopied:Z

    .line 879
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 880
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 881
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 882
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 883
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getIntValue()I

    move-result v1

    return v1

    .line 885
    :cond_0
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 886
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_0

    .line 887
    :cond_1
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2

    .line 888
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 890
    :cond_2
    :goto_0
    return p1

    .line 892
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_4

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getIntValue()I

    move-result v0

    goto :goto_1

    :cond_4
    move v0, p1

    :goto_1
    return v0
.end method

.method public nextLongValue(J)J
    .locals 4
    .param p1, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 899
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_3

    .line 900
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopied:Z

    .line 901
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 902
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 903
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 904
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 905
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getLongValue()J

    move-result-wide v1

    return-wide v1

    .line 907
    :cond_0
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 908
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_0

    .line 909
    :cond_1
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2

    .line 910
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 912
    :cond_2
    :goto_0
    return-wide p1

    .line 914
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_4

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getLongValue()J

    move-result-wide v0

    goto :goto_1

    :cond_4
    move-wide v0, p1

    :goto_1
    return-wide v0
.end method

.method public nextTextValue()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 851
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_4

    .line 852
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nameCopied:Z

    .line 853
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 854
    .local v1, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 855
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 856
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v3, :cond_1

    .line 857
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_0

    .line 858
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 859
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_finishAndReturnString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 861
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 863
    :cond_1
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v0, :cond_2

    .line 864
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_0

    .line 865
    :cond_2
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v0, :cond_3

    .line 866
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 868
    :cond_3
    :goto_0
    return-object v2

    .line 870
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_5

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    :cond_5
    return-object v2
.end method

.method public nextToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 559
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_closed:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 560
    return-object v1

    .line 566
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_1

    .line 567
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 571
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_numTypesValid:I

    .line 572
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_2

    .line 573
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipString()V

    .line 575
    :cond_2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipWSOrEnd()I

    move-result v0

    .line 576
    .local v0, "i":I
    if-gez v0, :cond_3

    .line 578
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->close()V

    .line 579
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 582
    :cond_3
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_binaryValue:[B

    .line 583
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currInputRow:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenInputRow:I

    .line 586
    const/16 v1, 0x5d

    if-eq v0, v1, :cond_a

    const/16 v2, 0x7d

    if-ne v0, v2, :cond_4

    goto/16 :goto_1

    .line 592
    :cond_4
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 593
    const/16 v3, 0x2c

    if-eq v0, v3, :cond_5

    .line 594
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "was expecting comma to separate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->typeDesc()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " entries"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 596
    :cond_5
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipWS()I

    move-result v0

    .line 599
    sget-object v3, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_TRAILING_COMMA:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_features:I

    invoke-virtual {v3, v4}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->enabledIn(I)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 600
    if-eq v0, v1, :cond_6

    if-ne v0, v2, :cond_7

    .line 601
    :cond_6
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_closeScope(I)V

    .line 602
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    .line 611
    :cond_7
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v1

    if-nez v1, :cond_8

    .line 612
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    return-object v1

    .line 615
    :cond_8
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseName(I)Ljava/lang/String;

    move-result-object v1

    .line 616
    .local v1, "n":Ljava/lang/String;
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 617
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 619
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_skipColon()I

    move-result v0

    .line 622
    const/16 v2, 0x22

    const/4 v3, 0x1

    if-ne v0, v2, :cond_9

    .line 623
    iput-boolean v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    .line 624
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 625
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v2

    .line 629
    :cond_9
    const/4 v2, 0x0

    sparse-switch v0, :sswitch_data_0

    .line 670
    .local v2, "t":Lcom/fasterxml/jackson/core/JsonToken;
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    goto :goto_0

    .line 666
    :sswitch_0
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 667
    goto :goto_0

    .line 659
    :sswitch_1
    const-string/jumbo v4, "true"

    invoke-virtual {p0, v4, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 660
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 661
    goto :goto_0

    .line 655
    :sswitch_2
    const-string v4, "null"

    invoke-virtual {p0, v4, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 656
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 657
    goto :goto_0

    .line 651
    :sswitch_3
    const-string v4, "false"

    invoke-virtual {p0, v4, v3}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 652
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 653
    goto :goto_0

    .line 663
    :sswitch_4
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 664
    goto :goto_0

    .line 648
    :sswitch_5
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 649
    goto :goto_0

    .line 631
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 632
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    nop

    .line 672
    :goto_0
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 673
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v3

    .line 587
    .end local v1    # "n":Ljava/lang/String;
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_a
    :goto_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_closeScope(I)V

    .line 588
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x2d -> :sswitch_6
        0x30 -> :sswitch_5
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

.method protected final parseEscapedName([IIIII)Ljava/lang/String;
    .locals 4
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "currQuad"    # I
    .param p4, "ch"    # I
    .param p5, "currQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1400
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_icLatin1:[I

    .line 1403
    .local v0, "codes":[I
    :goto_0
    aget v1, v0, p4

    const/4 v2, 0x4

    if-eqz v1, :cond_a

    .line 1404
    const/16 v1, 0x22

    if-ne p4, v1, :cond_3

    .line 1405
    nop

    .line 1468
    if-lez p5, :cond_1

    .line 1469
    array-length v1, p1

    if-lt p2, v1, :cond_0

    .line 1470
    array-length v1, p1

    invoke-static {p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v1

    move-object p1, v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1472
    :cond_0
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "qlen":I
    .local v1, "qlen":I
    invoke-static {p3, p5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->pad(II)I

    move-result v2

    aput v2, p1, p2

    move p2, v1

    .line 1474
    .end local v1    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v1, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v1

    .line 1475
    .local v1, "name":Ljava/lang/String;
    if-nez v1, :cond_2

    .line 1476
    invoke-direct {p0, p1, p2, p5}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v1

    .line 1478
    :cond_2
    return-object v1

    .line 1408
    .end local v1    # "name":Ljava/lang/String;
    :cond_3
    const/16 v1, 0x5c

    if-eq p4, v1, :cond_4

    .line 1410
    const-string v1, "name"

    invoke-virtual {p0, p4, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_1

    .line 1413
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_decodeEscaped()C

    move-result p4

    .line 1420
    :goto_1
    const/16 v1, 0x7f

    if-le p4, v1, :cond_a

    .line 1422
    if-lt p5, v2, :cond_6

    .line 1423
    array-length v1, p1

    if-lt p2, v1, :cond_5

    .line 1424
    array-length v1, p1

    invoke-static {p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v1

    move-object p1, v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1426
    :cond_5
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "qlen":I
    .local v1, "qlen":I
    aput p3, p1, p2

    .line 1427
    const/4 p3, 0x0

    .line 1428
    const/4 p5, 0x0

    move p2, v1

    .line 1430
    .end local v1    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_6
    const/16 v1, 0x800

    if-ge p4, v1, :cond_7

    .line 1431
    shl-int/lit8 v1, p3, 0x8

    shr-int/lit8 v3, p4, 0x6

    or-int/lit16 v3, v3, 0xc0

    or-int p3, v1, v3

    .line 1432
    add-int/lit8 p5, p5, 0x1

    goto :goto_2

    .line 1435
    :cond_7
    shl-int/lit8 v1, p3, 0x8

    shr-int/lit8 v3, p4, 0xc

    or-int/lit16 v3, v3, 0xe0

    or-int p3, v1, v3

    .line 1436
    add-int/lit8 p5, p5, 0x1

    .line 1438
    if-lt p5, v2, :cond_9

    .line 1439
    array-length v1, p1

    if-lt p2, v1, :cond_8

    .line 1440
    array-length v1, p1

    invoke-static {p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v1

    move-object p1, v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1442
    :cond_8
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "qlen":I
    .restart local v1    # "qlen":I
    aput p3, p1, p2

    .line 1443
    const/4 p3, 0x0

    .line 1444
    const/4 p5, 0x0

    move p2, v1

    .line 1446
    .end local v1    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_9
    shl-int/lit8 v1, p3, 0x8

    shr-int/lit8 v3, p4, 0x6

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    or-int p3, v1, v3

    .line 1447
    add-int/lit8 p5, p5, 0x1

    .line 1450
    :goto_2
    and-int/lit8 v1, p4, 0x3f

    or-int/lit16 p4, v1, 0x80

    .line 1454
    :cond_a
    if-ge p5, v2, :cond_b

    .line 1455
    add-int/lit8 p5, p5, 0x1

    .line 1456
    shl-int/lit8 v1, p3, 0x8

    or-int p3, v1, p4

    goto :goto_3

    .line 1458
    :cond_b
    array-length v1, p1

    if-lt p2, v1, :cond_c

    .line 1459
    array-length v1, p1

    invoke-static {p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_growArrayBy([II)[I

    move-result-object v1

    move-object p1, v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_quadBuffer:[I

    .line 1461
    :cond_c
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "qlen":I
    .restart local v1    # "qlen":I
    aput p3, p1, p2

    .line 1462
    move p2, p4

    .line 1463
    .end local p3    # "currQuad":I
    .local p2, "currQuad":I
    const/4 p3, 0x1

    move p5, p3

    move p3, p2

    move p2, v1

    .line 1465
    .end local v1    # "qlen":I
    .local p2, "qlen":I
    .restart local p3    # "currQuad":I
    :goto_3
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_inputData:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result p4

    goto/16 :goto_0
.end method

.method public readBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;)I
    .locals 3
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 421
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 427
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->allocBase64Buffer()[B

    move-result-object v0

    .line 429
    .local v0, "buf":[B
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_readBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;[B)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 431
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    return v1

    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    throw v1

    .line 422
    .end local v0    # "buf":[B
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->getBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v0

    .line 423
    .local v0, "b":[B
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 424
    array-length v1, v0

    return v1
.end method

.method public releaseBuffered(Ljava/io/OutputStream;)I
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    const/4 v0, 0x0

    return v0
.end method

.method public setCodec(Lcom/fasterxml/jackson/core/ObjectCodec;)V
    .locals 0
    .param p1, "c"    # Lcom/fasterxml/jackson/core/ObjectCodec;

    .line 126
    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8DataInputJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    .line 127
    return-void
.end method
