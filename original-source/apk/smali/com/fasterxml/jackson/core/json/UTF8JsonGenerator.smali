.class public Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;
.super Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;
.source "UTF8JsonGenerator.java"


# static fields
.field private static final BYTE_0:B = 0x30t

.field private static final BYTE_BACKSLASH:B = 0x5ct

.field private static final BYTE_COLON:B = 0x3at

.field private static final BYTE_COMMA:B = 0x2ct

.field private static final BYTE_LBRACKET:B = 0x5bt

.field private static final BYTE_LCURLY:B = 0x7bt

.field private static final BYTE_RBRACKET:B = 0x5dt

.field private static final BYTE_RCURLY:B = 0x7dt

.field private static final BYTE_u:B = 0x75t

.field private static final FALSE_BYTES:[B

.field private static final HEX_CHARS:[B

.field private static final MAX_BYTES_TO_BUFFER:I = 0x200

.field private static final NULL_BYTES:[B

.field private static final TRUE_BYTES:[B


# instance fields
.field protected _bufferRecyclable:Z

.field protected _charBuffer:[C

.field protected final _charBufferLength:I

.field protected _entityBuffer:[B

.field protected _outputBuffer:[B

.field protected final _outputEnd:I

.field protected final _outputMaxContiguous:I

.field protected final _outputStream:Ljava/io/OutputStream;

.field protected _outputTail:I

.field protected _quoteChar:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 32
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexBytes()[B

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    .line 34
    const/4 v0, 0x4

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->NULL_BYTES:[B

    .line 35
    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->TRUE_BYTES:[B

    .line 36
    const/4 v0, 0x5

    new-array v0, v0, [B

    fill-array-data v0, :array_2

    sput-object v0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->FALSE_BYTES:[B

    return-void

    :array_0
    .array-data 1
        0x6et
        0x75t
        0x6ct
        0x6ct
    .end array-data

    :array_1
    .array-data 1
        0x74t
        0x72t
        0x75t
        0x65t
    .end array-data

    :array_2
    .array-data 1
        0x66t
        0x61t
        0x6ct
        0x73t
        0x65t
    .end array-data
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/ObjectCodec;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "features"    # I
    .param p3, "codec"    # Lcom/fasterxml/jackson/core/ObjectCodec;
    .param p4, "out"    # Ljava/io/OutputStream;

    .line 119
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/ObjectCodec;)V

    .line 55
    const/16 v0, 0x22

    iput-byte v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    .line 120
    iput-object p4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    .line 121
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_bufferRecyclable:Z

    .line 122
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocWriteEncodingBuffer()[B

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 123
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    array-length v0, v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    .line 129
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    shr-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    .line 130
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocConcatBuffer()[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    .line 131
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    array-length v0, v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBufferLength:I

    .line 134
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->ESCAPE_NON_ASCII:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    const/16 v0, 0x7f

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->setHighestNonEscapedChar(I)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 137
    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/ObjectCodec;Ljava/io/OutputStream;[BIZ)V
    .locals 1
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "features"    # I
    .param p3, "codec"    # Lcom/fasterxml/jackson/core/ObjectCodec;
    .param p4, "out"    # Ljava/io/OutputStream;
    .param p5, "outputBuffer"    # [B
    .param p6, "outputOffset"    # I
    .param p7, "bufferRecyclable"    # Z

    .line 144
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/ObjectCodec;)V

    .line 55
    const/16 v0, 0x22

    iput-byte v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    .line 145
    iput-object p4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    .line 146
    iput-boolean p7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_bufferRecyclable:Z

    .line 147
    iput p6, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 148
    iput-object p5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 149
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    array-length v0, v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    .line 151
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    shr-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    .line 152
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocConcatBuffer()[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    .line 153
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    array-length v0, v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBufferLength:I

    .line 154
    return-void
.end method

.method private final _handleLongCustomEscape([BII[BI)I
    .locals 3
    .param p1, "outputBuffer"    # [B
    .param p2, "outputPtr"    # I
    .param p3, "outputEnd"    # I
    .param p4, "raw"    # [B
    .param p5, "remainingChars"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1676
    array-length v0, p4

    .line 1677
    .local v0, "len":I
    add-int v1, p2, v0

    if-le v1, p3, :cond_1

    .line 1678
    iput p2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1679
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1680
    iget p2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1681
    array-length v1, p1

    const/4 v2, 0x0

    if-le v0, v1, :cond_0

    .line 1682
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, p4, v2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 1683
    return p2

    .line 1685
    :cond_0
    invoke-static {p4, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1686
    add-int/2addr p2, v0

    .line 1689
    :cond_1
    mul-int/lit8 v1, p5, 0x6

    add-int/2addr v1, p2

    if-le v1, p3, :cond_2

    .line 1690
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1691
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    return v1

    .line 1693
    :cond_2
    return p2
.end method

.method private final _outputMultiByteChar(II)I
    .locals 4
    .param p1, "ch"    # I
    .param p2, "outputPtr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2024
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 2025
    .local v0, "bbuf":[B
    const v1, 0xd800

    if-lt p1, v1, :cond_0

    const v1, 0xdfff

    if-gt p1, v1, :cond_0

    .line 2030
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outputPtr":I
    .local v1, "outputPtr":I
    const/16 v2, 0x5c

    aput-byte v2, v0, p2

    .line 2031
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    const/16 v2, 0x75

    aput-byte v2, v0, v1

    .line 2033
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outputPtr":I
    .restart local v1    # "outputPtr":I
    sget-object v2, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    shr-int/lit8 v3, p1, 0xc

    and-int/lit8 v3, v3, 0xf

    aget-byte v2, v2, v3

    aput-byte v2, v0, p2

    .line 2034
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    sget-object v2, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    shr-int/lit8 v3, p1, 0x8

    and-int/lit8 v3, v3, 0xf

    aget-byte v2, v2, v3

    aput-byte v2, v0, v1

    .line 2035
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outputPtr":I
    .restart local v1    # "outputPtr":I
    sget-object v2, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    shr-int/lit8 v3, p1, 0x4

    and-int/lit8 v3, v3, 0xf

    aget-byte v2, v2, v3

    aput-byte v2, v0, p2

    .line 2036
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    sget-object v2, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    and-int/lit8 v3, p1, 0xf

    aget-byte v2, v2, v3

    aput-byte v2, v0, v1

    goto :goto_0

    .line 2039
    :cond_0
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outputPtr":I
    .restart local v1    # "outputPtr":I
    shr-int/lit8 v2, p1, 0xc

    or-int/lit16 v2, v2, 0xe0

    int-to-byte v2, v2

    aput-byte v2, v0, p2

    .line 2040
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    shr-int/lit8 v2, p1, 0x6

    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 2041
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outputPtr":I
    .restart local v1    # "outputPtr":I
    and-int/lit8 v2, p1, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v0, p2

    move p2, v1

    .line 2043
    .end local v1    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    :goto_0
    return p2
.end method

.method private final _outputRawMultiByteChar(I[CII)I
    .locals 3
    .param p1, "ch"    # I
    .param p2, "cbuf"    # [C
    .param p3, "inputOffset"    # I
    .param p4, "inputEnd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1982
    const v0, 0xd800

    if-lt p1, v0, :cond_2

    .line 1983
    const v0, 0xdfff

    if-gt p1, v0, :cond_2

    .line 1985
    if-ge p3, p4, :cond_0

    if-nez p2, :cond_1

    .line 1986
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "Split surrogate on writeRaw() input (last character): first character 0x%4x"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 1989
    :cond_1
    aget-char v0, p2, p3

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputSurrogates(II)V

    .line 1990
    add-int/lit8 v0, p3, 0x1

    return v0

    .line 1993
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1994
    .local v0, "bbuf":[B
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v2, p1, 0xc

    or-int/lit16 v2, v2, 0xe0

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 1995
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v2, p1, 0x6

    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 1996
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    and-int/lit8 v2, p1, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 1997
    return p3
.end method

.method private final _readMore(Ljava/io/InputStream;[BIII)I
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "readBuffer"    # [B
    .param p3, "inputPtr"    # I
    .param p4, "inputEnd"    # I
    .param p5, "maxRead"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1945
    const/4 v0, 0x0

    .line 1946
    .local v0, "i":I
    :goto_0
    if-ge p3, p4, :cond_0

    .line 1947
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    add-int/lit8 v2, p3, 0x1

    .end local p3    # "inputPtr":I
    .local v2, "inputPtr":I
    aget-byte p3, p2, p3

    aput-byte p3, p2, v0

    move v0, v1

    move p3, v2

    goto :goto_0

    .line 1949
    .end local v1    # "i":I
    .end local v2    # "inputPtr":I
    .restart local v0    # "i":I
    .restart local p3    # "inputPtr":I
    :cond_0
    const/4 p3, 0x0

    .line 1950
    move p4, v0

    .line 1951
    array-length v1, p2

    invoke-static {p5, v1}, Ljava/lang/Math;->min(II)I

    move-result p5

    .line 1954
    :cond_1
    sub-int v1, p5, p4

    .line 1955
    .local v1, "length":I
    if-nez v1, :cond_2

    .line 1956
    goto :goto_1

    .line 1958
    :cond_2
    invoke-virtual {p1, p2, p4, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 1959
    .local v2, "count":I
    if-gez v2, :cond_3

    .line 1960
    return p4

    .line 1962
    :cond_3
    add-int/2addr p4, v2

    .line 1963
    .end local v1    # "length":I
    .end local v2    # "count":I
    const/4 v1, 0x3

    if-lt p4, v1, :cond_1

    .line 1964
    :goto_1
    return p4
.end method

.method private final _writeBytes([B)V
    .locals 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1171
    array-length v0, p1

    .line 1172
    .local v0, "len":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    const/4 v3, 0x0

    if-le v1, v2, :cond_0

    .line 1173
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1175
    const/16 v1, 0x200

    if-le v0, v1, :cond_0

    .line 1176
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 1177
    return-void

    .line 1180
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, v3, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1181
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1182
    return-void
.end method

.method private final _writeBytes([BII)V
    .locals 2
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1186
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v0, p3

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_0

    .line 1187
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1189
    const/16 v0, 0x200

    if-le p3, v0, :cond_0

    .line 1190
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 1191
    return-void

    .line 1194
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1195
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1196
    return-void
.end method

.method private final _writeCustomEscape([BILcom/fasterxml/jackson/core/SerializableString;I)I
    .locals 7
    .param p1, "outputBuffer"    # [B
    .param p2, "outputPtr"    # I
    .param p3, "esc"    # Lcom/fasterxml/jackson/core/SerializableString;
    .param p4, "remainingChars"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1662
    invoke-interface {p3}, Lcom/fasterxml/jackson/core/SerializableString;->asUnquotedUTF8()[B

    move-result-object v4

    .line 1663
    .local v4, "raw":[B
    array-length v6, v4

    .line 1664
    .local v6, "len":I
    const/4 v0, 0x6

    if-le v6, v0, :cond_0

    .line 1665
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v5, p4

    .end local p1    # "outputBuffer":[B
    .end local p2    # "outputPtr":I
    .end local p4    # "remainingChars":I
    .local v1, "outputBuffer":[B
    .local v2, "outputPtr":I
    .local v5, "remainingChars":I
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_handleLongCustomEscape([BII[BI)I

    move-result p1

    return p1

    .line 1668
    .end local v1    # "outputBuffer":[B
    .end local v2    # "outputPtr":I
    .end local v5    # "remainingChars":I
    .restart local p1    # "outputBuffer":[B
    .restart local p2    # "outputPtr":I
    .restart local p4    # "remainingChars":I
    :cond_0
    move-object v1, p1

    move v2, p2

    .end local p1    # "outputBuffer":[B
    .end local p2    # "outputPtr":I
    .restart local v1    # "outputBuffer":[B
    .restart local v2    # "outputPtr":I
    const/4 p1, 0x0

    invoke-static {v4, p1, v1, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1669
    add-int p2, v2, v6

    return p2
.end method

.method private final _writeCustomStringSegment2(Ljava/lang/String;II)V
    .locals 10
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1605
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    sub-int v1, p3, p2

    mul-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_0

    .line 1606
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1608
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1610
    .local v0, "outputPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1611
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1613
    .local v2, "escCodes":[I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_maximumNonEscapedChar:I

    if-gtz v3, :cond_1

    const v3, 0xffff

    goto :goto_0

    :cond_1
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_maximumNonEscapedChar:I

    .line 1614
    .local v3, "maxUnescaped":I
    :goto_0
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .line 1616
    .local v4, "customEscapes":Lcom/fasterxml/jackson/core/io/CharacterEscapes;
    :goto_1
    if-ge p2, p3, :cond_a

    .line 1617
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "offset":I
    .local v5, "offset":I
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    .line 1618
    .local p2, "ch":I
    const/16 v6, 0x7f

    if-gt p2, v6, :cond_6

    .line 1619
    aget v6, v2, p2

    if-nez v6, :cond_2

    .line 1620
    add-int/lit8 v6, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v6, "outputPtr":I
    int-to-byte v7, p2

    aput-byte v7, v1, v0

    .line 1621
    move p2, v5

    move v0, v6

    goto :goto_1

    .line 1623
    .end local v6    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    :cond_2
    aget v6, v2, p2

    .line 1624
    .local v6, "escape":I
    if-lez v6, :cond_3

    .line 1625
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v7, "outputPtr":I
    const/16 v8, 0x5c

    aput-byte v8, v1, v0

    .line 1626
    add-int/lit8 v0, v7, 0x1

    .end local v7    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v8, v6

    aput-byte v8, v1, v7

    move p2, v5

    goto :goto_1

    .line 1627
    :cond_3
    const/4 v7, -0x2

    if-ne v6, v7, :cond_5

    .line 1628
    invoke-virtual {v4, p2}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v7

    .line 1629
    .local v7, "esc":Lcom/fasterxml/jackson/core/SerializableString;
    if-nez v7, :cond_4

    .line 1630
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Invalid custom escape definitions; custom escape not found for character code 0x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", although was supposed to have one"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 1633
    :cond_4
    sub-int v8, p3, v5

    invoke-direct {p0, v1, v0, v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeCustomEscape([BILcom/fasterxml/jackson/core/SerializableString;I)I

    move-result v0

    .line 1634
    .end local v7    # "esc":Lcom/fasterxml/jackson/core/SerializableString;
    move p2, v5

    goto :goto_1

    .line 1636
    :cond_5
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1638
    move p2, v5

    goto :goto_1

    .line 1640
    .end local v6    # "escape":I
    :cond_6
    if-le p2, v3, :cond_7

    .line 1641
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1642
    move p2, v5

    goto :goto_1

    .line 1644
    :cond_7
    invoke-virtual {v4, p2}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v6

    .line 1645
    .local v6, "esc":Lcom/fasterxml/jackson/core/SerializableString;
    if-eqz v6, :cond_8

    .line 1646
    sub-int v7, p3, v5

    invoke-direct {p0, v1, v0, v6, v7}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeCustomEscape([BILcom/fasterxml/jackson/core/SerializableString;I)I

    move-result v0

    .line 1647
    move p2, v5

    goto :goto_1

    .line 1649
    :cond_8
    const/16 v7, 0x7ff

    if-gt p2, v7, :cond_9

    .line 1650
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v7, "outputPtr":I
    shr-int/lit8 v8, p2, 0x6

    or-int/lit16 v8, v8, 0xc0

    int-to-byte v8, v8

    aput-byte v8, v1, v0

    .line 1651
    add-int/lit8 v0, v7, 0x1

    .end local v7    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    and-int/lit8 v8, p2, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v1, v7

    goto :goto_2

    .line 1653
    :cond_9
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMultiByteChar(II)I

    move-result v0

    .line 1655
    .end local v6    # "esc":Lcom/fasterxml/jackson/core/SerializableString;
    .end local p2    # "ch":I
    :goto_2
    move p2, v5

    goto/16 :goto_1

    .line 1656
    .end local v5    # "offset":I
    .local p2, "offset":I
    :cond_a
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1657
    return-void
.end method

.method private final _writeCustomStringSegment2([CII)V
    .locals 10
    .param p1, "cbuf"    # [C
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1548
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    sub-int v1, p3, p2

    mul-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_0

    .line 1549
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1551
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1553
    .local v0, "outputPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1554
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1556
    .local v2, "escCodes":[I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_maximumNonEscapedChar:I

    if-gtz v3, :cond_1

    const v3, 0xffff

    goto :goto_0

    :cond_1
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_maximumNonEscapedChar:I

    .line 1557
    .local v3, "maxUnescaped":I
    :goto_0
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .line 1559
    .local v4, "customEscapes":Lcom/fasterxml/jackson/core/io/CharacterEscapes;
    :goto_1
    if-ge p2, p3, :cond_a

    .line 1560
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "offset":I
    .local v5, "offset":I
    aget-char p2, p1, p2

    .line 1561
    .local p2, "ch":I
    const/16 v6, 0x7f

    if-gt p2, v6, :cond_6

    .line 1562
    aget v6, v2, p2

    if-nez v6, :cond_2

    .line 1563
    add-int/lit8 v6, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v6, "outputPtr":I
    int-to-byte v7, p2

    aput-byte v7, v1, v0

    .line 1564
    move p2, v5

    move v0, v6

    goto :goto_1

    .line 1566
    .end local v6    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    :cond_2
    aget v6, v2, p2

    .line 1567
    .local v6, "escape":I
    if-lez v6, :cond_3

    .line 1568
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v7, "outputPtr":I
    const/16 v8, 0x5c

    aput-byte v8, v1, v0

    .line 1569
    add-int/lit8 v0, v7, 0x1

    .end local v7    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v8, v6

    aput-byte v8, v1, v7

    move p2, v5

    goto :goto_1

    .line 1570
    :cond_3
    const/4 v7, -0x2

    if-ne v6, v7, :cond_5

    .line 1571
    invoke-virtual {v4, p2}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v7

    .line 1572
    .local v7, "esc":Lcom/fasterxml/jackson/core/SerializableString;
    if-nez v7, :cond_4

    .line 1573
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Invalid custom escape definitions; custom escape not found for character code 0x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", although was supposed to have one"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 1576
    :cond_4
    sub-int v8, p3, v5

    invoke-direct {p0, v1, v0, v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeCustomEscape([BILcom/fasterxml/jackson/core/SerializableString;I)I

    move-result v0

    .line 1577
    .end local v7    # "esc":Lcom/fasterxml/jackson/core/SerializableString;
    move p2, v5

    goto :goto_1

    .line 1579
    :cond_5
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1581
    move p2, v5

    goto :goto_1

    .line 1583
    .end local v6    # "escape":I
    :cond_6
    if-le p2, v3, :cond_7

    .line 1584
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1585
    move p2, v5

    goto :goto_1

    .line 1587
    :cond_7
    invoke-virtual {v4, p2}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v6

    .line 1588
    .local v6, "esc":Lcom/fasterxml/jackson/core/SerializableString;
    if-eqz v6, :cond_8

    .line 1589
    sub-int v7, p3, v5

    invoke-direct {p0, v1, v0, v6, v7}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeCustomEscape([BILcom/fasterxml/jackson/core/SerializableString;I)I

    move-result v0

    .line 1590
    move p2, v5

    goto :goto_1

    .line 1592
    :cond_8
    const/16 v7, 0x7ff

    if-gt p2, v7, :cond_9

    .line 1593
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v7, "outputPtr":I
    shr-int/lit8 v8, p2, 0x6

    or-int/lit16 v8, v8, 0xc0

    int-to-byte v8, v8

    aput-byte v8, v1, v0

    .line 1594
    add-int/lit8 v0, v7, 0x1

    .end local v7    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    and-int/lit8 v8, p2, 0x3f

    or-int/lit16 v8, v8, 0x80

    int-to-byte v8, v8

    aput-byte v8, v1, v7

    goto :goto_2

    .line 1596
    :cond_9
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMultiByteChar(II)I

    move-result v0

    .line 1598
    .end local v6    # "esc":Lcom/fasterxml/jackson/core/SerializableString;
    .end local p2    # "ch":I
    :goto_2
    move p2, v5

    goto/16 :goto_1

    .line 1599
    .end local v5    # "offset":I
    .local p2, "offset":I
    :cond_a
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1600
    return-void
.end method

.method private _writeGenericEscape(II)I
    .locals 5
    .param p1, "charToEscape"    # I
    .param p2, "outputPtr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2062
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 2063
    .local v0, "bbuf":[B
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outputPtr":I
    .local v1, "outputPtr":I
    const/16 v2, 0x5c

    aput-byte v2, v0, p2

    .line 2064
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    const/16 v2, 0x75

    aput-byte v2, v0, v1

    .line 2065
    const/16 v1, 0xff

    if-le p1, v1, :cond_0

    .line 2066
    shr-int/lit8 v2, p1, 0x8

    and-int/2addr v1, v2

    .line 2067
    .local v1, "hi":I
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "outputPtr":I
    .local v2, "outputPtr":I
    sget-object v3, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    shr-int/lit8 v4, v1, 0x4

    aget-byte v3, v3, v4

    aput-byte v3, v0, p2

    .line 2068
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    sget-object v3, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    and-int/lit8 v4, v1, 0xf

    aget-byte v3, v3, v4

    aput-byte v3, v0, v2

    .line 2069
    and-int/lit16 p1, p1, 0xff

    .line 2070
    .end local v1    # "hi":I
    goto :goto_0

    .line 2071
    :cond_0
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outputPtr":I
    .local v1, "outputPtr":I
    const/16 v2, 0x30

    aput-byte v2, v0, p2

    .line 2072
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    aput-byte v2, v0, v1

    .line 2075
    :goto_0
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "outputPtr":I
    .restart local v1    # "outputPtr":I
    sget-object v2, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    shr-int/lit8 v3, p1, 0x4

    aget-byte v2, v2, v3

    aput-byte v2, v0, p2

    .line 2076
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "outputPtr":I
    .restart local p2    # "outputPtr":I
    sget-object v2, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->HEX_CHARS:[B

    and-int/lit8 v3, p1, 0xf

    aget-byte v2, v2, v3

    aput-byte v2, v0, v1

    .line 2077
    return p2
.end method

.method private final _writeNull()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2048
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/4 v1, 0x4

    add-int/2addr v0, v1

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v2, :cond_0

    .line 2049
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 2051
    :cond_0
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->NULL_BYTES:[B

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2052
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 2053
    return-void
.end method

.method private final _writeQuotedInt(I)V
    .locals 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 910
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0xd

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 911
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 913
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 914
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[BI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 915
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 916
    return-void
.end method

.method private final _writeQuotedLong(J)V
    .locals 3
    .param p1, "l"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 935
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x17

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 936
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 938
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 939
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputLong(J[BI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 940
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 941
    return-void
.end method

.method private final _writeQuotedRaw(Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1013
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 1014
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1016
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 1017
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 1018
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 1019
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1021
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 1022
    return-void
.end method

.method private final _writeQuotedShort(S)V
    .locals 3
    .param p1, "s"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 885
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x8

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 886
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 888
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 889
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[BI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 890
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 891
    return-void
.end method

.method private _writeRawSegment([CII)V
    .locals 4
    .param p1, "cbuf"    # [C
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 782
    nop

    :goto_0
    if-ge p2, p3, :cond_3

    .line 785
    :goto_1
    aget-char v0, p1, p2

    .line 786
    .local v0, "ch":I
    const/16 v1, 0x7f

    if-le v0, v1, :cond_1

    .line 787
    nop

    .line 794
    .end local v0    # "ch":I
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "offset":I
    .local v0, "offset":I
    aget-char p2, p1, p2

    .line 795
    .local p2, "ch":C
    const/16 v1, 0x800

    if-ge p2, v1, :cond_0

    .line 796
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v3, p2, 0x6

    or-int/lit16 v3, v3, 0xc0

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 797
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    and-int/lit8 v3, p2, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    move p2, v0

    goto :goto_2

    .line 799
    :cond_0
    invoke-direct {p0, p2, p1, v0, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputRawMultiByteChar(I[CII)I

    move-result v0

    move p2, v0

    .line 801
    .end local v0    # "offset":I
    .local p2, "offset":I
    :goto_2
    goto :goto_0

    .line 789
    .local v0, "ch":I
    :cond_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 790
    add-int/lit8 p2, p2, 0x1

    if-lt p2, p3, :cond_2

    .line 791
    goto :goto_3

    .line 793
    .end local v0    # "ch":I
    :cond_2
    goto :goto_1

    .line 802
    :cond_3
    :goto_3
    return-void
.end method

.method private final _writeSegmentedRaw([CII)V
    .locals 7
    .param p1, "cbuf"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 736
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    .line 737
    .local v0, "end":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 738
    .local v1, "bbuf":[B
    add-int v2, p2, p3

    .line 741
    .local v2, "inputEnd":I
    :goto_0
    if-ge p2, v2, :cond_5

    .line 744
    :goto_1
    aget-char v3, p1, p2

    .line 745
    .local v3, "ch":I
    const/16 v4, 0x80

    if-lt v3, v4, :cond_2

    .line 746
    nop

    .line 757
    .end local v3    # "ch":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v3, 0x3

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v3, v5, :cond_0

    .line 758
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 760
    :cond_0
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "offset":I
    .local v3, "offset":I
    aget-char p2, p1, p2

    .line 761
    .local p2, "ch":C
    const/16 v5, 0x800

    if-ge p2, v5, :cond_1

    .line 762
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v6, p2, 0x6

    or-int/lit16 v6, v6, 0xc0

    int-to-byte v6, v6

    aput-byte v6, v1, v5

    .line 763
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    and-int/lit8 v6, p2, 0x3f

    or-int/2addr v4, v6

    int-to-byte v4, v4

    aput-byte v4, v1, v5

    move p2, v3

    goto :goto_2

    .line 765
    :cond_1
    invoke-direct {p0, p2, p1, v3, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputRawMultiByteChar(I[CII)I

    move-result v3

    move p2, v3

    .line 767
    .end local v3    # "offset":I
    .local p2, "offset":I
    :goto_2
    goto :goto_0

    .line 749
    .local v3, "ch":I
    :cond_2
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    if-lt v4, v0, :cond_3

    .line 750
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 752
    :cond_3
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    int-to-byte v5, v3

    aput-byte v5, v1, v4

    .line 753
    add-int/lit8 p2, p2, 0x1

    if-lt p2, v2, :cond_4

    .line 754
    goto :goto_3

    .line 756
    .end local v3    # "ch":I
    :cond_4
    goto :goto_1

    .line 768
    :cond_5
    :goto_3
    return-void
.end method

.method private final _writeStringSegment(Ljava/lang/String;II)V
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1327
    add-int/2addr p3, p2

    .line 1329
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1330
    .local v0, "outputPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1331
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1333
    .local v2, "escCodes":[I
    :goto_0
    if-ge p2, p3, :cond_1

    .line 1334
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 1336
    .local v3, "ch":I
    const/16 v4, 0x7f

    if-gt v3, v4, :cond_1

    aget v4, v2, v3

    if-eqz v4, :cond_0

    .line 1337
    goto :goto_1

    .line 1339
    :cond_0
    add-int/lit8 v4, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v4, "outputPtr":I
    int-to-byte v5, v3

    aput-byte v5, v1, v0

    .line 1340
    nop

    .end local v3    # "ch":I
    add-int/lit8 p2, p2, 0x1

    .line 1341
    move v0, v4

    goto :goto_0

    .line 1342
    .end local v4    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    :cond_1
    :goto_1
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1343
    if-ge p2, p3, :cond_4

    .line 1344
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    if-eqz v3, :cond_2

    .line 1345
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeCustomStringSegment2(Ljava/lang/String;II)V

    goto :goto_2

    .line 1346
    :cond_2
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_maximumNonEscapedChar:I

    if-nez v3, :cond_3

    .line 1347
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment2(Ljava/lang/String;II)V

    goto :goto_2

    .line 1349
    :cond_3
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegmentASCII2(Ljava/lang/String;II)V

    .line 1352
    :cond_4
    :goto_2
    return-void
.end method

.method private final _writeStringSegment([CII)V
    .locals 6
    .param p1, "cbuf"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1293
    add-int/2addr p3, p2

    .line 1295
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1296
    .local v0, "outputPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1297
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1299
    .local v2, "escCodes":[I
    :goto_0
    if-ge p2, p3, :cond_1

    .line 1300
    aget-char v3, p1, p2

    .line 1302
    .local v3, "ch":I
    const/16 v4, 0x7f

    if-gt v3, v4, :cond_1

    aget v4, v2, v3

    if-eqz v4, :cond_0

    .line 1303
    goto :goto_1

    .line 1305
    :cond_0
    add-int/lit8 v4, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v4, "outputPtr":I
    int-to-byte v5, v3

    aput-byte v5, v1, v0

    .line 1306
    nop

    .end local v3    # "ch":I
    add-int/lit8 p2, p2, 0x1

    .line 1307
    move v0, v4

    goto :goto_0

    .line 1308
    .end local v4    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    :cond_1
    :goto_1
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1309
    if-ge p2, p3, :cond_4

    .line 1311
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    if-eqz v3, :cond_2

    .line 1312
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeCustomStringSegment2([CII)V

    goto :goto_2

    .line 1314
    :cond_2
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_maximumNonEscapedChar:I

    if-nez v3, :cond_3

    .line 1315
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment2([CII)V

    goto :goto_2

    .line 1317
    :cond_3
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegmentASCII2([CII)V

    .line 1321
    :cond_4
    :goto_2
    return-void
.end method

.method private final _writeStringSegment2(Ljava/lang/String;II)V
    .locals 7
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1399
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    sub-int v1, p3, p2

    mul-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_0

    .line 1400
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1403
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1405
    .local v0, "outputPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1406
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1408
    .local v2, "escCodes":[I
    :goto_0
    if-ge p2, p3, :cond_5

    .line 1409
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "offset":I
    .local v3, "offset":I
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    .line 1410
    .local p2, "ch":I
    const/16 v4, 0x7f

    if-gt p2, v4, :cond_3

    .line 1411
    aget v4, v2, p2

    if-nez v4, :cond_1

    .line 1412
    add-int/lit8 v4, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v4, "outputPtr":I
    int-to-byte v5, p2

    aput-byte v5, v1, v0

    .line 1413
    move p2, v3

    move v0, v4

    goto :goto_0

    .line 1415
    .end local v4    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    :cond_1
    aget v4, v2, p2

    .line 1416
    .local v4, "escape":I
    if-lez v4, :cond_2

    .line 1417
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v5, "outputPtr":I
    const/16 v6, 0x5c

    aput-byte v6, v1, v0

    .line 1418
    add-int/lit8 v0, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v6, v4

    aput-byte v6, v1, v5

    move p2, v3

    goto :goto_0

    .line 1421
    :cond_2
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1423
    move p2, v3

    goto :goto_0

    .line 1425
    .end local v4    # "escape":I
    :cond_3
    const/16 v4, 0x7ff

    if-gt p2, v4, :cond_4

    .line 1426
    add-int/lit8 v4, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v4, "outputPtr":I
    shr-int/lit8 v5, p2, 0x6

    or-int/lit16 v5, v5, 0xc0

    int-to-byte v5, v5

    aput-byte v5, v1, v0

    .line 1427
    add-int/lit8 v0, v4, 0x1

    .end local v4    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    and-int/lit8 v5, p2, 0x3f

    or-int/lit16 v5, v5, 0x80

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    goto :goto_1

    .line 1429
    :cond_4
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMultiByteChar(II)I

    move-result v0

    .line 1431
    .end local p2    # "ch":I
    :goto_1
    move p2, v3

    goto :goto_0

    .line 1432
    .end local v3    # "offset":I
    .local p2, "offset":I
    :cond_5
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1433
    return-void
.end method

.method private final _writeStringSegment2([CII)V
    .locals 7
    .param p1, "cbuf"    # [C
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1361
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    sub-int v1, p3, p2

    mul-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_0

    .line 1362
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1365
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1367
    .local v0, "outputPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1368
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1370
    .local v2, "escCodes":[I
    :goto_0
    if-ge p2, p3, :cond_5

    .line 1371
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "offset":I
    .local v3, "offset":I
    aget-char p2, p1, p2

    .line 1372
    .local p2, "ch":I
    const/16 v4, 0x7f

    if-gt p2, v4, :cond_3

    .line 1373
    aget v4, v2, p2

    if-nez v4, :cond_1

    .line 1374
    add-int/lit8 v4, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v4, "outputPtr":I
    int-to-byte v5, p2

    aput-byte v5, v1, v0

    .line 1375
    move p2, v3

    move v0, v4

    goto :goto_0

    .line 1377
    .end local v4    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    :cond_1
    aget v4, v2, p2

    .line 1378
    .local v4, "escape":I
    if-lez v4, :cond_2

    .line 1379
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v5, "outputPtr":I
    const/16 v6, 0x5c

    aput-byte v6, v1, v0

    .line 1380
    add-int/lit8 v0, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v6, v4

    aput-byte v6, v1, v5

    move p2, v3

    goto :goto_0

    .line 1383
    :cond_2
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1385
    move p2, v3

    goto :goto_0

    .line 1387
    .end local v4    # "escape":I
    :cond_3
    const/16 v4, 0x7ff

    if-gt p2, v4, :cond_4

    .line 1388
    add-int/lit8 v4, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v4, "outputPtr":I
    shr-int/lit8 v5, p2, 0x6

    or-int/lit16 v5, v5, 0xc0

    int-to-byte v5, v5

    aput-byte v5, v1, v0

    .line 1389
    add-int/lit8 v0, v4, 0x1

    .end local v4    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    and-int/lit8 v5, p2, 0x3f

    or-int/lit16 v5, v5, 0x80

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    goto :goto_1

    .line 1391
    :cond_4
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMultiByteChar(II)I

    move-result v0

    .line 1393
    .end local p2    # "ch":I
    :goto_1
    move p2, v3

    goto :goto_0

    .line 1394
    .end local v3    # "offset":I
    .local p2, "offset":I
    :cond_5
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1395
    return-void
.end method

.method private final _writeStringSegmentASCII2(Ljava/lang/String;II)V
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1493
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    sub-int v1, p3, p2

    mul-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_0

    .line 1494
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1497
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1499
    .local v0, "outputPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1500
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1501
    .local v2, "escCodes":[I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_maximumNonEscapedChar:I

    .line 1503
    .local v3, "maxUnescaped":I
    :goto_0
    if-ge p2, p3, :cond_6

    .line 1504
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "offset":I
    .local v4, "offset":I
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    .line 1505
    .local p2, "ch":I
    const/16 v5, 0x7f

    if-gt p2, v5, :cond_3

    .line 1506
    aget v5, v2, p2

    if-nez v5, :cond_1

    .line 1507
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v5, "outputPtr":I
    int-to-byte v6, p2

    aput-byte v6, v1, v0

    .line 1508
    move p2, v4

    move v0, v5

    goto :goto_0

    .line 1510
    .end local v5    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    :cond_1
    aget v5, v2, p2

    .line 1511
    .local v5, "escape":I
    if-lez v5, :cond_2

    .line 1512
    add-int/lit8 v6, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v6, "outputPtr":I
    const/16 v7, 0x5c

    aput-byte v7, v1, v0

    .line 1513
    add-int/lit8 v0, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v7, v5

    aput-byte v7, v1, v6

    move p2, v4

    goto :goto_0

    .line 1516
    :cond_2
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1518
    move p2, v4

    goto :goto_0

    .line 1520
    .end local v5    # "escape":I
    :cond_3
    if-le p2, v3, :cond_4

    .line 1521
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1522
    move p2, v4

    goto :goto_0

    .line 1524
    :cond_4
    const/16 v5, 0x7ff

    if-gt p2, v5, :cond_5

    .line 1525
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v5, "outputPtr":I
    shr-int/lit8 v6, p2, 0x6

    or-int/lit16 v6, v6, 0xc0

    int-to-byte v6, v6

    aput-byte v6, v1, v0

    .line 1526
    add-int/lit8 v0, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    and-int/lit8 v6, p2, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    aput-byte v6, v1, v5

    goto :goto_1

    .line 1528
    :cond_5
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMultiByteChar(II)I

    move-result v0

    .line 1530
    .end local p2    # "ch":I
    :goto_1
    move p2, v4

    goto :goto_0

    .line 1531
    .end local v4    # "offset":I
    .local p2, "offset":I
    :cond_6
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1532
    return-void
.end method

.method private final _writeStringSegmentASCII2([CII)V
    .locals 8
    .param p1, "cbuf"    # [C
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1449
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    sub-int v1, p3, p2

    mul-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_0

    .line 1450
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1453
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1455
    .local v0, "outputPtr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1456
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1457
    .local v2, "escCodes":[I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_maximumNonEscapedChar:I

    .line 1459
    .local v3, "maxUnescaped":I
    :goto_0
    if-ge p2, p3, :cond_6

    .line 1460
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "offset":I
    .local v4, "offset":I
    aget-char p2, p1, p2

    .line 1461
    .local p2, "ch":I
    const/16 v5, 0x7f

    if-gt p2, v5, :cond_3

    .line 1462
    aget v5, v2, p2

    if-nez v5, :cond_1

    .line 1463
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v5, "outputPtr":I
    int-to-byte v6, p2

    aput-byte v6, v1, v0

    .line 1464
    move p2, v4

    move v0, v5

    goto :goto_0

    .line 1466
    .end local v5    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    :cond_1
    aget v5, v2, p2

    .line 1467
    .local v5, "escape":I
    if-lez v5, :cond_2

    .line 1468
    add-int/lit8 v6, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v6, "outputPtr":I
    const/16 v7, 0x5c

    aput-byte v7, v1, v0

    .line 1469
    add-int/lit8 v0, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v7, v5

    aput-byte v7, v1, v6

    move p2, v4

    goto :goto_0

    .line 1472
    :cond_2
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1474
    move p2, v4

    goto :goto_0

    .line 1476
    .end local v5    # "escape":I
    :cond_3
    if-le p2, v3, :cond_4

    .line 1477
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1478
    move p2, v4

    goto :goto_0

    .line 1480
    :cond_4
    const/16 v5, 0x7ff

    if-gt p2, v5, :cond_5

    .line 1481
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v5, "outputPtr":I
    shr-int/lit8 v6, p2, 0x6

    or-int/lit16 v6, v6, 0xc0

    int-to-byte v6, v6

    aput-byte v6, v1, v0

    .line 1482
    add-int/lit8 v0, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    and-int/lit8 v6, p2, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    aput-byte v6, v1, v5

    goto :goto_1

    .line 1484
    :cond_5
    invoke-direct {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMultiByteChar(II)I

    move-result v0

    .line 1486
    .end local p2    # "ch":I
    :goto_1
    move p2, v4

    goto :goto_0

    .line 1487
    .end local v4    # "offset":I
    .local p2, "offset":I
    :cond_6
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1488
    return-void
.end method

.method private final _writeStringSegments(Ljava/lang/String;II)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "totalLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1263
    nop

    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1264
    .local v0, "len":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_1

    .line 1265
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1267
    :cond_1
    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment(Ljava/lang/String;II)V

    .line 1268
    add-int/2addr p2, v0

    .line 1269
    sub-int/2addr p3, v0

    .line 1270
    .end local v0    # "len":I
    if-gtz p3, :cond_0

    .line 1271
    return-void
.end method

.method private final _writeStringSegments(Ljava/lang/String;Z)V
    .locals 5
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "addQuotes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1213
    if-eqz p2, :cond_1

    .line 1214
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 1215
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1217
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 1220
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1221
    .local v0, "left":I
    const/4 v1, 0x0

    .line 1223
    .local v1, "offset":I
    :goto_0
    if-lez v0, :cond_3

    .line 1224
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1225
    .local v2, "len":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v3, v2

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v3, v4, :cond_2

    .line 1226
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1228
    :cond_2
    invoke-direct {p0, p1, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment(Ljava/lang/String;II)V

    .line 1229
    add-int/2addr v1, v2

    .line 1230
    sub-int/2addr v0, v2

    .line 1231
    .end local v2    # "len":I
    goto :goto_0

    .line 1233
    :cond_3
    if-eqz p2, :cond_5

    .line 1234
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_4

    .line 1235
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1237
    :cond_4
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v2, v3

    .line 1239
    :cond_5
    return-void
.end method

.method private final _writeStringSegments([CII)V
    .locals 3
    .param p1, "cbuf"    # [C
    .param p2, "offset"    # I
    .param p3, "totalLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1250
    nop

    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1251
    .local v0, "len":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_1

    .line 1252
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1254
    :cond_1
    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment([CII)V

    .line 1255
    add-int/2addr p2, v0

    .line 1256
    sub-int/2addr p3, v0

    .line 1257
    .end local v0    # "len":I
    if-gtz p3, :cond_0

    .line 1258
    return-void
.end method

.method private final _writeUTF8Segment([BII)V
    .locals 5
    .param p1, "utf8"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1722
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1724
    .local v0, "escCodes":[I
    move v1, p2

    .local v1, "ptr":I
    add-int v2, p2, p3

    .local v2, "end":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 1726
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ptr":I
    .local v3, "ptr":I
    aget-byte v1, p1, v1

    .line 1727
    .local v1, "ch":I
    if-ltz v1, :cond_0

    aget v4, v0, v1

    if-eqz v4, :cond_0

    .line 1728
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeUTF8Segment2([BII)V

    .line 1729
    return-void

    .line 1731
    .end local v1    # "ch":I
    :cond_0
    move v1, v3

    goto :goto_0

    .line 1734
    .end local v2    # "end":I
    .end local v3    # "ptr":I
    :cond_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, p3

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_2

    .line 1735
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1737
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1738
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, p3

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1739
    return-void
.end method

.method private final _writeUTF8Segment2([BII)V
    .locals 8
    .param p1, "utf8"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1744
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1747
    .local v0, "outputPtr":I
    mul-int/lit8 v1, p3, 0x6

    add-int/2addr v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_0

    .line 1748
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1749
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1752
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1753
    .local v1, "outputBuffer":[B
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEscapes:[I

    .line 1754
    .local v2, "escCodes":[I
    add-int/2addr p3, p2

    .line 1756
    :goto_0
    if-ge p2, p3, :cond_4

    .line 1757
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "offset":I
    .local v3, "offset":I
    aget-byte p2, p1, p2

    .line 1758
    .local p2, "b":B
    move v4, p2

    .line 1759
    .local v4, "ch":I
    if-ltz v4, :cond_3

    aget v5, v2, v4

    if-nez v5, :cond_1

    goto :goto_2

    .line 1763
    :cond_1
    aget v5, v2, v4

    .line 1764
    .local v5, "escape":I
    if-lez v5, :cond_2

    .line 1765
    add-int/lit8 v6, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v6, "outputPtr":I
    const/16 v7, 0x5c

    aput-byte v7, v1, v0

    .line 1766
    add-int/lit8 v0, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    int-to-byte v7, v5

    aput-byte v7, v1, v6

    goto :goto_1

    .line 1769
    :cond_2
    invoke-direct {p0, v4, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeGenericEscape(II)I

    move-result v0

    .line 1771
    .end local v4    # "ch":I
    .end local v5    # "escape":I
    .end local p2    # "b":B
    :goto_1
    move p2, v3

    goto :goto_0

    .line 1760
    .restart local v4    # "ch":I
    .restart local p2    # "b":B
    :cond_3
    :goto_2
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "outputPtr":I
    .local v5, "outputPtr":I
    aput-byte p2, v1, v0

    .line 1761
    move p2, v3

    move v0, v5

    goto :goto_0

    .line 1772
    .end local v3    # "offset":I
    .end local v4    # "ch":I
    .end local v5    # "outputPtr":I
    .restart local v0    # "outputPtr":I
    .local p2, "offset":I
    :cond_4
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1773
    return-void
.end method

.method private final _writeUTF8Segments([BII)V
    .locals 1
    .param p1, "utf8"    # [B
    .param p2, "offset"    # I
    .param p3, "totalLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1711
    nop

    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1712
    .local v0, "len":I
    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeUTF8Segment([BII)V

    .line 1713
    add-int/2addr p2, v0

    .line 1714
    sub-int/2addr p3, v0

    .line 1715
    .end local v0    # "len":I
    if-gtz p3, :cond_0

    .line 1716
    return-void
.end method

.method private final _writeUnq(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 2
    .param p1, "name"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-interface {p1, v0, v1}, Lcom/fasterxml/jackson/core/SerializableString;->appendQuotedUTF8([BI)I

    move-result v0

    .line 268
    .local v0, "len":I
    if-gez v0, :cond_0

    .line 269
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedUTF8()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBytes([B)V

    goto :goto_0

    .line 271
    :cond_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 273
    :goto_0
    return-void
.end method


# virtual methods
.method protected final _flushBuffer()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2082
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 2083
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 2084
    const/4 v1, 0x0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 2085
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    invoke-virtual {v2, v3, v1, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 2087
    :cond_0
    return-void
.end method

.method protected final _outputSurrogates(II)V
    .locals 4
    .param p1, "surr1"    # I
    .param p2, "surr2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2002
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_decodeSurrogate(II)I

    move-result v0

    .line 2003
    .local v0, "c":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v1, v1, 0x4

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_0

    .line 2004
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 2006
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 2007
    .local v1, "bbuf":[B
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v3, v0, 0x12

    or-int/lit16 v3, v3, 0xf0

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 2008
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v3, v0, 0xc

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 2009
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v3, v0, 0x6

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 2010
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    and-int/lit8 v3, v0, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 2011
    return-void
.end method

.method protected _releaseBuffers()V
    .locals 3

    .line 1151
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1152
    .local v0, "buf":[B
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_bufferRecyclable:Z

    if-eqz v2, :cond_0

    .line 1153
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 1154
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseWriteEncodingBuffer([B)V

    .line 1156
    :cond_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    .line 1157
    .local v2, "cbuf":[C
    if-eqz v2, :cond_1

    .line 1158
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    .line 1159
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseConcatBuffer([C)V

    .line 1161
    :cond_1
    return-void
.end method

.method protected final _verifyValueWrite(Ljava/lang/String;)V
    .locals 5
    .param p1, "typeMsg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1053
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeValue()I

    move-result v0

    .line 1054
    .local v0, "status":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v1, :cond_0

    .line 1056
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyPrettyValueWrite(Ljava/lang/String;I)V

    .line 1057
    return-void

    .line 1060
    :cond_0
    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 1063
    :pswitch_0
    return-void

    .line 1079
    .local v1, "b":B
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportCantWriteValueExpectName(Ljava/lang/String;)V

    .line 1080
    return-void

    .line 1071
    :pswitch_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_rootValueSeparator:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v2, :cond_1

    .line 1072
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_rootValueSeparator:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v2}, Lcom/fasterxml/jackson/core/SerializableString;->asUnquotedUTF8()[B

    move-result-object v2

    .line 1073
    .local v2, "raw":[B
    array-length v3, v2

    if-lez v3, :cond_1

    .line 1074
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBytes([B)V

    .line 1077
    .end local v2    # "raw":[B
    :cond_1
    return-void

    .line 1068
    :pswitch_3
    const/16 v1, 0x3a

    .line 1069
    goto :goto_0

    .line 1065
    .end local v1    # "b":B
    :pswitch_4
    const/16 v1, 0x2c

    .line 1066
    .restart local v1    # "b":B
    nop

    .line 1082
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_2

    .line 1083
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1085
    :cond_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    aput-byte v1, v2, v3

    .line 1086
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected final _writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[B)I
    .locals 12
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "data"    # Ljava/io/InputStream;
    .param p3, "readBuffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1888
    const/4 v0, 0x0

    .line 1889
    .local v0, "inputPtr":I
    const/4 v1, 0x0

    .line 1890
    .local v1, "inputEnd":I
    const/4 v2, -0x3

    .line 1891
    .local v2, "lastFullOffset":I
    const/4 v3, 0x0

    .line 1894
    .local v3, "bytesDone":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    add-int/lit8 v4, v4, -0x6

    .line 1895
    .local v4, "safeOutputEnd":I
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v5

    shr-int/lit8 v5, v5, 0x2

    move v9, v0

    move v10, v1

    .line 1899
    .end local v0    # "inputPtr":I
    .end local v1    # "inputEnd":I
    .local v5, "chunksBeforeLF":I
    .local v9, "inputPtr":I
    .local v10, "inputEnd":I
    :goto_0
    if-le v9, v2, :cond_4

    .line 1900
    array-length v11, p3

    move-object v6, p0

    move-object v7, p2

    move-object v8, p3

    .end local p2    # "data":Ljava/io/InputStream;
    .end local p3    # "readBuffer":[B
    .local v7, "data":Ljava/io/InputStream;
    .local v8, "readBuffer":[B
    invoke-direct/range {v6 .. v11}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result p2

    .line 1901
    .end local v10    # "inputEnd":I
    .local p2, "inputEnd":I
    const/4 v9, 0x0

    .line 1902
    const/4 p3, 0x3

    if-ge p2, p3, :cond_3

    .line 1903
    nop

    .line 1924
    if-ge v9, p2, :cond_2

    .line 1925
    iget p3, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    if-le p3, v4, :cond_0

    .line 1926
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1928
    :cond_0
    add-int/lit8 p3, v9, 0x1

    .end local v9    # "inputPtr":I
    .local p3, "inputPtr":I
    aget-byte v0, v8, v9

    shl-int/lit8 v0, v0, 0x10

    .line 1929
    .local v0, "b24":I
    const/4 v1, 0x1

    .line 1930
    .local v1, "amount":I
    if-ge p3, p2, :cond_1

    .line 1931
    aget-byte v9, v8, p3

    and-int/lit16 v9, v9, 0xff

    shl-int/lit8 v9, v9, 0x8

    or-int/2addr v0, v9

    .line 1932
    const/4 v1, 0x2

    .line 1934
    :cond_1
    add-int/2addr v3, v1

    .line 1935
    iget-object v9, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v10, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-virtual {p1, v0, v1, v9, v10}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[BI)I

    move-result v9

    iput v9, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    move v9, p3

    .line 1937
    .end local v0    # "b24":I
    .end local v1    # "amount":I
    .end local p3    # "inputPtr":I
    .restart local v9    # "inputPtr":I
    :cond_2
    return v3

    .line 1905
    :cond_3
    add-int/lit8 p3, p2, -0x3

    move v10, p2

    move v2, p3

    .end local v2    # "lastFullOffset":I
    .local p3, "lastFullOffset":I
    goto :goto_1

    .line 1899
    .end local v7    # "data":Ljava/io/InputStream;
    .end local v8    # "readBuffer":[B
    .restart local v2    # "lastFullOffset":I
    .restart local v10    # "inputEnd":I
    .local p2, "data":Ljava/io/InputStream;
    .local p3, "readBuffer":[B
    :cond_4
    move-object v6, p0

    move-object v7, p2

    move-object v8, p3

    .line 1907
    .end local p2    # "data":Ljava/io/InputStream;
    .end local p3    # "readBuffer":[B
    .restart local v7    # "data":Ljava/io/InputStream;
    .restart local v8    # "readBuffer":[B
    :goto_1
    iget p2, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    if-le p2, v4, :cond_5

    .line 1908
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1911
    :cond_5
    add-int/lit8 p2, v9, 0x1

    .end local v9    # "inputPtr":I
    .local p2, "inputPtr":I
    aget-byte p3, v8, v9

    shl-int/lit8 p3, p3, 0x8

    .line 1912
    .local p3, "b24":I
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "inputPtr":I
    .local v0, "inputPtr":I
    aget-byte p2, v8, p2

    and-int/lit16 p2, p2, 0xff

    or-int/2addr p2, p3

    .line 1913
    .end local p3    # "b24":I
    .local p2, "b24":I
    shl-int/lit8 p3, p2, 0x8

    add-int/lit8 v9, v0, 0x1

    .end local v0    # "inputPtr":I
    .restart local v9    # "inputPtr":I
    aget-byte v0, v8, v0

    and-int/lit16 v0, v0, 0xff

    or-int p2, p3, v0

    .line 1914
    add-int/lit8 v3, v3, 0x3

    .line 1915
    iget-object p3, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v0, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-virtual {p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[BI)I

    move-result p3

    iput p3, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1916
    add-int/lit8 v5, v5, -0x1

    if-gtz v5, :cond_6

    .line 1917
    iget-object p3, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v0, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v1, 0x5c

    aput-byte v1, p3, v0

    .line 1918
    iget-object p3, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v0, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v6, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v1, 0x6e

    aput-byte v1, p3, v0

    .line 1919
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result p3

    shr-int/lit8 p3, p3, 0x2

    move v5, p3

    .line 1921
    .end local p2    # "b24":I
    :cond_6
    move-object p2, v7

    move-object p3, v8

    goto/16 :goto_0
.end method

.method protected final _writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[BI)I
    .locals 12
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "data"    # Ljava/io/InputStream;
    .param p3, "readBuffer"    # [B
    .param p4, "bytesLeft"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1828
    const/4 v0, 0x0

    .line 1829
    .local v0, "inputPtr":I
    const/4 v1, 0x0

    .line 1830
    .local v1, "inputEnd":I
    const/4 v2, -0x3

    .line 1833
    .local v2, "lastFullOffset":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    add-int/lit8 v3, v3, -0x6

    .line 1834
    .local v3, "safeOutputEnd":I
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v4

    const/4 v5, 0x2

    shr-int/2addr v4, v5

    move/from16 v11, p4

    move v9, v0

    move v10, v1

    .line 1836
    .end local v0    # "inputPtr":I
    .end local v1    # "inputEnd":I
    .end local p4    # "bytesLeft":I
    .local v4, "chunksBeforeLF":I
    .local v9, "inputPtr":I
    .local v10, "inputEnd":I
    .local v11, "bytesLeft":I
    :goto_0
    if-le v11, v5, :cond_4

    .line 1837
    if-le v9, v2, :cond_1

    .line 1838
    move-object v6, p0

    move-object v7, p2

    move-object v8, p3

    invoke-direct/range {v6 .. v11}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result v10

    .line 1839
    const/4 v9, 0x0

    .line 1840
    const/4 v0, 0x3

    if-ge v10, v0, :cond_0

    .line 1841
    goto :goto_1

    .line 1843
    :cond_0
    add-int/lit8 v0, v10, -0x3

    move v2, v0

    .line 1845
    :cond_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    if-le v0, v3, :cond_2

    .line 1846
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1848
    :cond_2
    add-int/lit8 v0, v9, 0x1

    .end local v9    # "inputPtr":I
    .restart local v0    # "inputPtr":I
    aget-byte v1, p3, v9

    shl-int/lit8 v1, v1, 0x8

    .line 1849
    .local v1, "b24":I
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "inputPtr":I
    .local v7, "inputPtr":I
    aget-byte v0, p3, v0

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, v1

    .line 1850
    .end local v1    # "b24":I
    .local v0, "b24":I
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v9, v7, 0x1

    .end local v7    # "inputPtr":I
    .restart local v9    # "inputPtr":I
    aget-byte v7, p3, v7

    and-int/lit16 v7, v7, 0xff

    or-int v0, v1, v7

    .line 1851
    add-int/lit8 v11, v11, -0x3

    .line 1852
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-virtual {p1, v0, v1, v7}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[BI)I

    move-result v1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1853
    add-int/lit8 v4, v4, -0x1

    if-gtz v4, :cond_3

    .line 1854
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v8, 0x5c

    aput-byte v8, v1, v7

    .line 1855
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v8, 0x6e

    aput-byte v8, v1, v7

    .line 1856
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v1

    shr-int/2addr v1, v5

    move v4, v1

    .line 1858
    .end local v0    # "b24":I
    :cond_3
    goto :goto_0

    .line 1861
    :cond_4
    :goto_1
    if-lez v11, :cond_7

    .line 1862
    move-object v6, p0

    move-object v7, p2

    move-object v8, p3

    invoke-direct/range {v6 .. v11}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result v10

    .line 1863
    const/4 v9, 0x0

    .line 1864
    if-lez v10, :cond_7

    .line 1865
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    if-le v0, v3, :cond_5

    .line 1866
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1868
    :cond_5
    add-int/lit8 v0, v9, 0x1

    .end local v9    # "inputPtr":I
    .local v0, "inputPtr":I
    aget-byte v1, p3, v9

    shl-int/lit8 v1, v1, 0x10

    .line 1870
    .restart local v1    # "b24":I
    if-ge v0, v10, :cond_6

    .line 1871
    aget-byte v5, p3, v0

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v1, v5

    .line 1872
    const/4 v5, 0x2

    .local v5, "amount":I
    goto :goto_2

    .line 1874
    .end local v5    # "amount":I
    :cond_6
    const/4 v5, 0x1

    .line 1876
    .restart local v5    # "amount":I
    :goto_2
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-virtual {p1, v1, v5, v7, v8}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[BI)I

    move-result v7

    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1877
    sub-int/2addr v11, v5

    move v9, v0

    .line 1880
    .end local v0    # "inputPtr":I
    .end local v1    # "b24":I
    .end local v5    # "amount":I
    .restart local v9    # "inputPtr":I
    :cond_7
    return v11
.end method

.method protected final _writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;[BII)V
    .locals 8
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "input"    # [B
    .param p3, "inputPtr"    # I
    .param p4, "inputEnd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1786
    add-int/lit8 v0, p4, -0x3

    .line 1788
    .local v0, "safeInputEnd":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    add-int/lit8 v1, v1, -0x6

    .line 1789
    .local v1, "safeOutputEnd":I
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v2

    const/4 v3, 0x2

    shr-int/2addr v2, v3

    .line 1792
    .local v2, "chunksBeforeLF":I
    :goto_0
    if-gt p3, v0, :cond_2

    .line 1793
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    if-le v4, v1, :cond_0

    .line 1794
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1797
    :cond_0
    add-int/lit8 v4, p3, 0x1

    .end local p3    # "inputPtr":I
    .local v4, "inputPtr":I
    aget-byte p3, p2, p3

    shl-int/lit8 p3, p3, 0x8

    .line 1798
    .local p3, "b24":I
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "inputPtr":I
    .local v5, "inputPtr":I
    aget-byte v4, p2, v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr p3, v4

    .line 1799
    shl-int/lit8 v4, p3, 0x8

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "inputPtr":I
    .local v6, "inputPtr":I
    aget-byte v5, p2, v5

    and-int/lit16 v5, v5, 0xff

    or-int p3, v4, v5

    .line 1800
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-virtual {p1, p3, v4, v5}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[BI)I

    move-result v4

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1801
    add-int/lit8 v2, v2, -0x1

    if-gtz v2, :cond_1

    .line 1803
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v7, 0x5c

    aput-byte v7, v4, v5

    .line 1804
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v7, 0x6e

    aput-byte v7, v4, v5

    .line 1805
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v4

    shr-int/lit8 v2, v4, 0x2

    .line 1807
    .end local p3    # "b24":I
    :cond_1
    move p3, v6

    goto :goto_0

    .line 1810
    .end local v6    # "inputPtr":I
    .local p3, "inputPtr":I
    :cond_2
    sub-int v4, p4, p3

    .line 1811
    .local v4, "inputLeft":I
    if-lez v4, :cond_5

    .line 1812
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    if-le v5, v1, :cond_3

    .line 1813
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1815
    :cond_3
    add-int/lit8 v5, p3, 0x1

    .end local p3    # "inputPtr":I
    .restart local v5    # "inputPtr":I
    aget-byte p3, p2, p3

    shl-int/lit8 p3, p3, 0x10

    .line 1816
    .local p3, "b24":I
    if-ne v4, v3, :cond_4

    .line 1817
    add-int/lit8 v3, v5, 0x1

    .end local v5    # "inputPtr":I
    .local v3, "inputPtr":I
    aget-byte v5, p2, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr p3, v5

    goto :goto_1

    .line 1816
    .end local v3    # "inputPtr":I
    .restart local v5    # "inputPtr":I
    :cond_4
    move v3, v5

    .line 1819
    .end local v5    # "inputPtr":I
    .restart local v3    # "inputPtr":I
    :goto_1
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-virtual {p1, p3, v4, v5, v6}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[BI)I

    move-result v5

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    move p3, v3

    .line 1821
    .end local v3    # "inputPtr":I
    .local p3, "inputPtr":I
    :cond_5
    return-void
.end method

.method protected final _writePPFieldName(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 5
    .param p1, "name"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 410
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeFieldName(Ljava/lang/String;)I

    move-result v0

    .line 411
    .local v0, "status":I
    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 412
    const-string v1, "Can not write a field name, expecting a value"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 414
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 415
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v2, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeObjectEntrySeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 417
    :cond_1
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v2, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->beforeObjectEntries(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 420
    :goto_0
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgUnqNames:Z

    xor-int/2addr v1, v2

    .line 421
    .local v1, "addQuotes":Z
    if-eqz v1, :cond_3

    .line 422
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_2

    .line 423
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 425
    :cond_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v2, v3

    .line 427
    :cond_3
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedUTF8()[B

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBytes([B)V

    .line 428
    if-eqz v1, :cond_5

    .line 429
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_4

    .line 430
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 432
    :cond_4
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v2, v3

    .line 434
    :cond_5
    return-void
.end method

.method protected final _writePPFieldName(Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 370
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeFieldName(Ljava/lang/String;)I

    move-result v0

    .line 371
    .local v0, "status":I
    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 372
    const-string v1, "Can not write a field name, expecting a value"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 374
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 375
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v2, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeObjectEntrySeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 377
    :cond_1
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v2, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->beforeObjectEntries(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 379
    :goto_0
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgUnqNames:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 380
    invoke-direct {p0, p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments(Ljava/lang/String;Z)V

    .line 381
    return-void

    .line 383
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 384
    .local v2, "len":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBufferLength:I

    if-le v2, v4, :cond_3

    .line 385
    invoke-direct {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments(Ljava/lang/String;Z)V

    .line 386
    return-void

    .line 388
    :cond_3
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v4, :cond_4

    .line 389
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 391
    :cond_4
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v5, v1, v4

    .line 392
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    invoke-virtual {p1, v3, v2, v1, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 394
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    if-gt v2, v1, :cond_6

    .line 395
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v2

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v1, v4, :cond_5

    .line 396
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 398
    :cond_5
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    invoke-direct {p0, v1, v3, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment([CII)V

    goto :goto_1

    .line 400
    :cond_6
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    invoke-direct {p0, v1, v3, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments([CII)V

    .line 402
    :goto_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v3, :cond_7

    .line 403
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 405
    :cond_7
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v1, v3

    .line 406
    return-void
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1108
    invoke-super {p0}, Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;->close()V

    .line 1114
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    if-eqz v0, :cond_1

    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_JSON_CONTENT:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1117
    :goto_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->getOutputContext()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object v0

    .line 1118
    .local v0, "ctxt":Lcom/fasterxml/jackson/core/JsonStreamContext;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inArray()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1119
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeEndArray()V

    goto :goto_1

    .line 1120
    :cond_0
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inObject()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1121
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeEndObject()V

    .line 1125
    .end local v0    # "ctxt":Lcom/fasterxml/jackson/core/JsonStreamContext;
    :goto_1
    goto :goto_0

    .line 1127
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1128
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1136
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_4

    .line 1137
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->isResourceManaged()Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_TARGET:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 1139
    :cond_2
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->FLUSH_PASSED_TO_STREAM:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1141
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    goto :goto_3

    .line 1138
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1145
    :cond_4
    :goto_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_releaseBuffers()V

    .line 1146
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1097
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1098
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 1099
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->FLUSH_PASSED_TO_STREAM:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1100
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 1103
    :cond_0
    return-void
.end method

.method public getOutputBuffered()I
    .locals 1

    .line 170
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    return v0
.end method

.method public getOutputTarget()Ljava/lang/Object;
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method public writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;I)I
    .locals 5
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "data"    # Ljava/io/InputStream;
    .param p3, "dataLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 834
    const-string/jumbo v0, "write a binary value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 836
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 837
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 839
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 840
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->allocBase64Buffer()[B

    move-result-object v0

    .line 843
    .local v0, "encodingBuffer":[B
    const/4 v1, 0x0

    if-gez p3, :cond_1

    .line 844
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[B)I

    move-result v1

    .local v1, "bytes":I
    goto :goto_0

    .line 846
    .end local v1    # "bytes":I
    :cond_1
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[BI)I

    move-result v2

    .line 847
    .local v2, "missing":I
    if-lez v2, :cond_2

    .line 848
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Too few bytes available: missing "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " bytes (out of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 850
    :cond_2
    move v1, p3

    .line 853
    .end local v2    # "missing":I
    .restart local v1    # "bytes":I
    :goto_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    .line 854
    nop

    .line 856
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_3

    .line 857
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 859
    :cond_3
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v2, v3

    .line 860
    return v1

    .line 853
    .end local v1    # "bytes":I
    :catchall_0
    move-exception v2

    .restart local v1    # "bytes":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v3, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    throw v2
.end method

.method public writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;[BII)V
    .locals 3
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "data"    # [B
    .param p3, "offset"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 815
    const-string/jumbo v0, "write a binary value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 817
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 818
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 820
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 821
    add-int v0, p3, p4

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;[BII)V

    .line 823
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 824
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 826
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 827
    return-void
.end method

.method public writeBoolean(Z)V
    .locals 5
    .param p1, "state"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1027
    const-string/jumbo v0, "write a boolean value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 1028
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x5

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 1029
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 1031
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->TRUE_BYTES:[B

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->FALSE_BYTES:[B

    .line 1032
    .local v0, "keyword":[B
    :goto_0
    array-length v1, v0

    .line 1033
    .local v1, "len":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1034
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 1035
    return-void
.end method

.method public final writeEndArray()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 299
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->inArray()Z

    move-result v0

    if-nez v0, :cond_0

    .line 300
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current context not Array but "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->typeDesc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 302
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_1

    .line 303
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getEntryCount()I

    move-result v1

    invoke-interface {v0, p0, v1}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeEndArray(Lcom/fasterxml/jackson/core/JsonGenerator;I)V

    goto :goto_0

    .line 305
    :cond_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_2

    .line 306
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 308
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v2, 0x5d

    aput-byte v2, v0, v1

    .line 310
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 311
    return-void
.end method

.method public final writeEndObject()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 350
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->inObject()Z

    move-result v0

    if-nez v0, :cond_0

    .line 351
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current context not Object but "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->typeDesc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_1

    .line 354
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getEntryCount()I

    move-result v1

    invoke-interface {v0, p0, v1}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeEndObject(Lcom/fasterxml/jackson/core/JsonGenerator;I)V

    goto :goto_0

    .line 356
    :cond_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_2

    .line 357
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 359
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v2, 0x7d

    aput-byte v2, v0, v1

    .line 361
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 362
    return-void
.end method

.method public writeFieldName(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 5
    .param p1, "name"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 232
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_0

    .line 233
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writePPFieldName(Lcom/fasterxml/jackson/core/SerializableString;)V

    .line 234
    return-void

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeFieldName(Ljava/lang/String;)I

    move-result v0

    .line 237
    .local v0, "status":I
    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 238
    const-string v1, "Can not write a field name, expecting a value"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 240
    :cond_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 241
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_2

    .line 242
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 244
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v3, 0x2c

    aput-byte v3, v1, v2

    .line 246
    :cond_3
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgUnqNames:Z

    if-eqz v1, :cond_4

    .line 247
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeUnq(Lcom/fasterxml/jackson/core/SerializableString;)V

    .line 248
    return-void

    .line 250
    :cond_4
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_5

    .line 251
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 253
    :cond_5
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v3, v1, v2

    .line 254
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-interface {p1, v1, v2}, Lcom/fasterxml/jackson/core/SerializableString;->appendQuotedUTF8([BI)I

    move-result v1

    .line 255
    .local v1, "len":I
    if-gez v1, :cond_6

    .line 256
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedUTF8()[B

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBytes([B)V

    goto :goto_0

    .line 258
    :cond_6
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 260
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_7

    .line 261
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 263
    :cond_7
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v2, v3

    .line 264
    return-void
.end method

.method public writeFieldName(Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writePPFieldName(Ljava/lang/String;)V

    .line 184
    return-void

    .line 186
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeFieldName(Ljava/lang/String;)I

    move-result v0

    .line 187
    .local v0, "status":I
    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 188
    const-string v1, "Can not write a field name, expecting a value"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 190
    :cond_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 191
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_2

    .line 192
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 194
    :cond_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v4, 0x2c

    aput-byte v4, v2, v3

    .line 199
    :cond_3
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgUnqNames:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_4

    .line 200
    invoke-direct {p0, p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments(Ljava/lang/String;Z)V

    .line 201
    return-void

    .line 203
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 205
    .local v2, "len":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBufferLength:I

    if-le v2, v4, :cond_5

    .line 206
    invoke-direct {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments(Ljava/lang/String;Z)V

    .line 207
    return-void

    .line 209
    :cond_5
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v4, :cond_6

    .line 210
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 212
    :cond_6
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v5, v1, v4

    .line 214
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    if-gt v2, v1, :cond_8

    .line 215
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v2

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v1, v4, :cond_7

    .line 216
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 218
    :cond_7
    invoke-direct {p0, p1, v3, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment(Ljava/lang/String;II)V

    goto :goto_0

    .line 220
    :cond_8
    invoke-direct {p0, p1, v3, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments(Ljava/lang/String;II)V

    .line 223
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v3, :cond_9

    .line 224
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 226
    :cond_9
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v1, v3

    .line 227
    return-void
.end method

.method public writeNull()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1040
    const-string/jumbo v0, "write a null"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 1041
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeNull()V

    .line 1042
    return-void
.end method

.method public writeNumber(D)V
    .locals 2
    .param p1, "d"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 960
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgNumbersAsStrings:Z

    if-nez v0, :cond_2

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_features:I

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->enabledIn(I)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 967
    :cond_1
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 968
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 969
    return-void

    .line 963
    :cond_2
    :goto_0
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 964
    return-void
.end method

.method public writeNumber(F)V
    .locals 2
    .param p1, "f"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 974
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgNumbersAsStrings:Z

    if-nez v0, :cond_2

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_features:I

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->enabledIn(I)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 982
    :cond_1
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 983
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 984
    return-void

    .line 978
    :cond_2
    :goto_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 979
    return-void
.end method

.method public writeNumber(I)V
    .locals 2
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 896
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 898
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0xb

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 899
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 901
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_1

    .line 902
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeQuotedInt(I)V

    .line 903
    return-void

    .line 905
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[BI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 906
    return-void
.end method

.method public writeNumber(J)V
    .locals 2
    .param p1, "l"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 921
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 922
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_0

    .line 923
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeQuotedLong(J)V

    .line 924
    return-void

    .line 926
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x15

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 928
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 930
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputLong(J[BI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 931
    return-void
.end method

.method public writeNumber(Ljava/lang/String;)V
    .locals 1
    .param p1, "encodedValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1003
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 1004
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_0

    .line 1005
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeQuotedRaw(Ljava/lang/String;)V

    goto :goto_0

    .line 1007
    :cond_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 1009
    :goto_0
    return-void
.end method

.method public writeNumber(Ljava/math/BigDecimal;)V
    .locals 1
    .param p1, "value"    # Ljava/math/BigDecimal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 990
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 991
    if-nez p1, :cond_0

    .line 992
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeNull()V

    goto :goto_0

    .line 993
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_1

    .line 994
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_asString(Ljava/math/BigDecimal;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeQuotedRaw(Ljava/lang/String;)V

    goto :goto_0

    .line 996
    :cond_1
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_asString(Ljava/math/BigDecimal;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 998
    :goto_0
    return-void
.end method

.method public writeNumber(Ljava/math/BigInteger;)V
    .locals 1
    .param p1, "value"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 946
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 947
    if-nez p1, :cond_0

    .line 948
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeNull()V

    goto :goto_0

    .line 949
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_1

    .line 950
    invoke-virtual {p1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeQuotedRaw(Ljava/lang/String;)V

    goto :goto_0

    .line 952
    :cond_1
    invoke-virtual {p1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 954
    :goto_0
    return-void
.end method

.method public writeNumber(S)V
    .locals 2
    .param p1, "s"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 872
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 874
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x6

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 875
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 877
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_1

    .line 878
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeQuotedShort(S)V

    .line 879
    return-void

    .line 881
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[BI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 882
    return-void
.end method

.method public writeRaw(C)V
    .locals 3
    .param p1, "ch"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 716
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x3

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 717
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 719
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    .line 720
    .local v0, "bbuf":[B
    const/16 v1, 0x7f

    if-gt p1, v1, :cond_1

    .line 721
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    goto :goto_0

    .line 722
    :cond_1
    const/16 v1, 0x800

    if-ge p1, v1, :cond_2

    .line 723
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v2, p1, 0x6

    or-int/lit16 v2, v2, 0xc0

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 724
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    and-int/lit8 v2, p1, 0x3f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto :goto_0

    .line 726
    :cond_2
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v2, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputRawMultiByteChar(I[CII)I

    .line 728
    :goto_0
    return-void
.end method

.method public writeRaw(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 2
    .param p1, "text"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 654
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asUnquotedUTF8()[B

    move-result-object v0

    .line 655
    .local v0, "raw":[B
    array-length v1, v0

    if-lez v1, :cond_0

    .line 656
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBytes([B)V

    .line 658
    :cond_0
    return-void
.end method

.method public writeRaw(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 597
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 598
    .local v0, "len":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    .line 599
    .local v1, "buf":[C
    array-length v2, v1

    const/4 v3, 0x0

    if-gt v0, v2, :cond_0

    .line 600
    invoke-virtual {p1, v3, v0, v1, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 601
    invoke-virtual {p0, v1, v3, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw([CII)V

    goto :goto_0

    .line 603
    :cond_0
    invoke-virtual {p0, p1, v3, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw(Ljava/lang/String;II)V

    .line 605
    :goto_0
    return-void
.end method

.method public writeRaw(Ljava/lang/String;II)V
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 610
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    .line 611
    .local v0, "buf":[C
    array-length v1, v0

    .line 614
    .local v1, "cbufLen":I
    const/4 v2, 0x0

    if-gt p3, v1, :cond_0

    .line 615
    add-int v3, p2, p3

    invoke-virtual {p1, p2, v3, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 616
    invoke-virtual {p0, v0, v2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->writeRaw([CII)V

    .line 617
    return-void

    .line 623
    :cond_0
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    shr-int/lit8 v3, v3, 0x2

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    shr-int/lit8 v4, v4, 0x4

    add-int/2addr v3, v4

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 625
    .local v3, "maxChunk":I
    mul-int/lit8 v4, v3, 0x3

    .line 627
    .local v4, "maxBytes":I
    :goto_0
    if-lez p3, :cond_3

    .line 628
    invoke-static {v3, p3}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 629
    .local v5, "len2":I
    add-int v6, p2, v5

    invoke-virtual {p1, p2, v6, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 630
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v6, v4

    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v6, v7, :cond_1

    .line 631
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 639
    :cond_1
    const/4 v6, 0x1

    if-le v5, v6, :cond_2

    .line 640
    add-int/lit8 v6, v5, -0x1

    aget-char v6, v0, v6

    .line 641
    .local v6, "ch":C
    const v7, 0xd800

    if-lt v6, v7, :cond_2

    const v7, 0xdbff

    if-gt v6, v7, :cond_2

    .line 642
    add-int/lit8 v5, v5, -0x1

    .line 645
    .end local v6    # "ch":C
    :cond_2
    invoke-direct {p0, v0, v2, v5}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeRawSegment([CII)V

    .line 646
    add-int/2addr p2, v5

    .line 647
    sub-int/2addr p3, v5

    .line 648
    .end local v5    # "len2":I
    goto :goto_0

    .line 649
    :cond_3
    return-void
.end method

.method public final writeRaw([CII)V
    .locals 4
    .param p1, "cbuf"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 676
    add-int v0, p3, p3

    add-int/2addr v0, p3

    .line 677
    .local v0, "len3":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_1

    .line 679
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-ge v1, v0, :cond_0

    .line 680
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeSegmentedRaw([CII)V

    .line 681
    return-void

    .line 684
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 687
    .end local v0    # "len3":I
    :cond_1
    add-int/2addr p3, p2

    .line 691
    :goto_0
    if-ge p2, p3, :cond_5

    .line 694
    :goto_1
    aget-char v0, p1, p2

    .line 695
    .local v0, "ch":I
    const/16 v1, 0x7f

    if-le v0, v1, :cond_3

    .line 696
    nop

    .line 703
    .end local v0    # "ch":I
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "offset":I
    .local v0, "offset":I
    aget-char p2, p1, p2

    .line 704
    .local p2, "ch":C
    const/16 v1, 0x800

    if-ge p2, v1, :cond_2

    .line 705
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    shr-int/lit8 v3, p2, 0x6

    or-int/lit16 v3, v3, 0xc0

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 706
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    and-int/lit8 v3, p2, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    move p2, v0

    goto :goto_2

    .line 708
    :cond_2
    invoke-direct {p0, p2, p1, v0, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputRawMultiByteChar(I[CII)I

    move-result v0

    move p2, v0

    .line 710
    .end local v0    # "offset":I
    .local p2, "offset":I
    :goto_2
    goto :goto_0

    .line 698
    .local v0, "ch":I
    :cond_3
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 699
    add-int/lit8 p2, p2, 0x1

    if-lt p2, p3, :cond_4

    .line 700
    goto :goto_3

    .line 702
    .end local v0    # "ch":I
    :cond_4
    goto :goto_1

    .line 711
    :cond_5
    :goto_3
    return-void
.end method

.method public writeRawUTF8String([BII)V
    .locals 3
    .param p1, "text"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 557
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 558
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 559
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 561
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 562
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBytes([BII)V

    .line 563
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 564
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 566
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 567
    return-void
.end method

.method public writeRawValue(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 2
    .param p1, "text"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 663
    const-string/jumbo v0, "write a raw (unencoded) value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 664
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asUnquotedUTF8()[B

    move-result-object v0

    .line 665
    .local v0, "raw":[B
    array-length v1, v0

    if-lez v1, :cond_0

    .line 666
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBytes([B)V

    .line 668
    :cond_0
    return-void
.end method

.method public final writeStartArray()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 284
    const-string/jumbo v0, "start an array"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 285
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->createChildArrayContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 286
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_0

    .line 287
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeStartArray(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 289
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 290
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 292
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v2, 0x5b

    aput-byte v2, v0, v1

    .line 294
    :goto_0
    return-void
.end method

.method public final writeStartObject()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 316
    const-string/jumbo v0, "start an object"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 317
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->createChildObjectContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 318
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_0

    .line 319
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeStartObject(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 321
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 322
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 324
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v2, 0x7b

    aput-byte v2, v0, v1

    .line 326
    :goto_0
    return-void
.end method

.method public writeStartObject(Ljava/lang/Object;)V
    .locals 4
    .param p1, "forValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 331
    const-string/jumbo v0, "start an object"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 332
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->createChildObjectContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    .line 333
    .local v0, "ctxt":Lcom/fasterxml/jackson/core/json/JsonWriteContext;
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 334
    if-eqz p1, :cond_0

    .line 335
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->setCurrentValue(Ljava/lang/Object;)V

    .line 337
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v1, :cond_1

    .line 338
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v1, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeStartObject(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 340
    :cond_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_2

    .line 341
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 343
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    const/16 v3, 0x7b

    aput-byte v3, v1, v2

    .line 345
    :goto_0
    return-void
.end method

.method public final writeString(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 4
    .param p1, "text"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 537
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 538
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 539
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 541
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 542
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    invoke-interface {p1, v0, v1}, Lcom/fasterxml/jackson/core/SerializableString;->appendQuotedUTF8([BI)I

    move-result v0

    .line 543
    .local v0, "len":I
    if-gez v0, :cond_1

    .line 544
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedUTF8()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeBytes([B)V

    goto :goto_0

    .line 546
    :cond_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    .line 548
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_2

    .line 549
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 551
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v3, v1, v2

    .line 552
    return-void
.end method

.method public writeString(Ljava/io/Reader;I)V
    .locals 7
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 469
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 470
    if-nez p1, :cond_0

    .line 471
    const-string v0, "null reader"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 474
    :cond_0
    if-ltz p2, :cond_1

    move v0, p2

    goto :goto_0

    :cond_1
    const v0, 0x7fffffff

    .line 476
    .local v0, "toRead":I
    :goto_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_charBuffer:[C

    .line 479
    .local v1, "buf":[C
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v2, p2

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_2

    .line 480
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 482
    :cond_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v2, v3

    .line 485
    :goto_1
    if-lez v0, :cond_5

    .line 486
    array-length v2, v1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 487
    .local v2, "toReadNow":I
    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3, v2}, Ljava/io/Reader;->read([CII)I

    move-result v4

    .line 488
    .local v4, "numRead":I
    if-gtz v4, :cond_3

    .line 489
    goto :goto_2

    .line 491
    :cond_3
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v5, p2

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v5, v6, :cond_4

    .line 492
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 494
    :cond_4
    invoke-direct {p0, v1, v3, v4}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments([CII)V

    .line 496
    sub-int/2addr v0, v4

    .line 497
    .end local v2    # "toReadNow":I
    .end local v4    # "numRead":I
    goto :goto_1

    .line 500
    :cond_5
    :goto_2
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v2, p2

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_6

    .line 501
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 503
    :cond_6
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v4, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v4, v2, v3

    .line 505
    if-lez v0, :cond_7

    if-ltz p2, :cond_7

    .line 506
    const-string v2, "Didn\'t read enough from reader"

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 508
    :cond_7
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 445
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 446
    if-nez p1, :cond_0

    .line 447
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeNull()V

    .line 448
    return-void

    .line 451
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 452
    .local v0, "len":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    if-le v0, v1, :cond_1

    .line 453
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments(Ljava/lang/String;Z)V

    .line 454
    return-void

    .line 456
    :cond_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_2

    .line 457
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 459
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v3, v1, v2

    .line 460
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment(Ljava/lang/String;II)V

    .line 461
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_3

    .line 462
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 464
    :cond_3
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v3, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v3, v1, v2

    .line 465
    return-void
.end method

.method public writeString([CII)V
    .locals 3
    .param p1, "text"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 513
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 514
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 515
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 517
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 519
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    if-gt p3, v0, :cond_2

    .line 520
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/2addr v0, p3

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_1

    .line 521
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 523
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegment([CII)V

    goto :goto_0

    .line 525
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeStringSegments([CII)V

    .line 528
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_3

    .line 529
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 531
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 532
    return-void
.end method

.method public writeUTF8String([BII)V
    .locals 3
    .param p1, "text"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 572
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 573
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 574
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 576
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 578
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputMaxContiguous:I

    if-gt p3, v0, :cond_1

    .line 579
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeUTF8Segment([BII)V

    goto :goto_0

    .line 581
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_writeUTF8Segments([BII)V

    .line 583
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_2

    .line 584
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_flushBuffer()V

    .line 586
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_outputTail:I

    iget-byte v2, p0, Lcom/fasterxml/jackson/core/json/UTF8JsonGenerator;->_quoteChar:B

    aput-byte v2, v0, v1

    .line 587
    return-void
.end method
