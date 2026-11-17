.class public Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;
.super Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;
.source "WriterBasedJsonGenerator.java"


# static fields
.field protected static final HEX_CHARS:[C

.field protected static final SHORT_WRITE:I = 0x20


# instance fields
.field protected _charBuffer:[C

.field protected _currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

.field protected _entityBuffer:[C

.field protected _outputBuffer:[C

.field protected _outputEnd:I

.field protected _outputHead:I

.field protected _outputTail:I

.field protected _quoteChar:C

.field protected final _writer:Ljava/io/Writer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexChars()[C

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/ObjectCodec;Ljava/io/Writer;)V
    .locals 1
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "features"    # I
    .param p3, "codec"    # Lcom/fasterxml/jackson/core/ObjectCodec;
    .param p4, "w"    # Ljava/io/Writer;

    .line 98
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/ObjectCodec;)V

    .line 38
    const/16 v0, 0x22

    iput-char v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    .line 99
    iput-object p4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    .line 100
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocConcatBuffer()[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 101
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    array-length v0, v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    .line 102
    return-void
.end method

.method private _allocateCopyBuffer()[C
    .locals 2

    .line 1934
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_charBuffer:[C

    if-nez v0, :cond_0

    .line 1935
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    const/16 v1, 0x7d0

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocNameCopyBuffer(I)[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_charBuffer:[C

    .line 1937
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_charBuffer:[C

    return-object v0
.end method

.method private _allocateEntityBuffer()[C
    .locals 5

    .line 1915
    const/16 v0, 0xe

    new-array v0, v0, [C

    .line 1917
    .local v0, "buf":[C
    const/4 v1, 0x0

    const/16 v2, 0x5c

    aput-char v2, v0, v1

    .line 1919
    const/4 v1, 0x2

    aput-char v2, v0, v1

    .line 1920
    const/4 v1, 0x3

    const/16 v3, 0x75

    aput-char v3, v0, v1

    .line 1921
    const/4 v1, 0x4

    const/16 v4, 0x30

    aput-char v4, v0, v1

    .line 1922
    const/4 v1, 0x5

    aput-char v4, v0, v1

    .line 1924
    const/16 v1, 0x8

    aput-char v2, v0, v1

    .line 1925
    const/16 v1, 0x9

    aput-char v3, v0, v1

    .line 1926
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1927
    return-object v0
.end method

.method private _appendCharacterEscape(CI)V
    .locals 6
    .param p1, "ch"    # C
    .param p2, "escCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1863
    const/16 v0, 0x5c

    if-ltz p2, :cond_1

    .line 1864
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_0

    .line 1865
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1867
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v0, v1, v2

    .line 1868
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    int-to-char v2, p2

    aput-char v2, v0, v1

    .line 1869
    return-void

    .line 1871
    :cond_1
    const/4 v1, -0x2

    if-eq p2, v1, :cond_4

    .line 1872
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v1, v1, 0x5

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_2

    .line 1873
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1875
    :cond_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1876
    .local v1, "ptr":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 1877
    .local v2, "buf":[C
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ptr":I
    .local v3, "ptr":I
    aput-char v0, v2, v1

    .line 1878
    add-int/lit8 v0, v3, 0x1

    .end local v3    # "ptr":I
    .local v0, "ptr":I
    const/16 v1, 0x75

    aput-char v1, v2, v3

    .line 1880
    const/16 v1, 0xff

    if-le p1, v1, :cond_3

    .line 1881
    shr-int/lit8 v3, p1, 0x8

    and-int/2addr v1, v3

    .line 1882
    .local v1, "hi":I
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "ptr":I
    .restart local v3    # "ptr":I
    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v1, 0x4

    aget-char v4, v4, v5

    aput-char v4, v2, v0

    .line 1883
    add-int/lit8 v0, v3, 0x1

    .end local v3    # "ptr":I
    .restart local v0    # "ptr":I
    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v5, v1, 0xf

    aget-char v4, v4, v5

    aput-char v4, v2, v3

    .line 1884
    and-int/lit16 v3, p1, 0xff

    int-to-char p1, v3

    .line 1885
    .end local v1    # "hi":I
    goto :goto_0

    .line 1886
    :cond_3
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "ptr":I
    .local v1, "ptr":I
    const/16 v3, 0x30

    aput-char v3, v2, v0

    .line 1887
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "ptr":I
    .restart local v0    # "ptr":I
    aput-char v3, v2, v1

    .line 1889
    :goto_0
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "ptr":I
    .restart local v1    # "ptr":I
    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v4, p1, 0x4

    aget-char v3, v3, v4

    aput-char v3, v2, v0

    .line 1890
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "ptr":I
    .restart local v0    # "ptr":I
    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v4, p1, 0xf

    aget-char v3, v3, v4

    aput-char v3, v2, v1

    .line 1891
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1892
    return-void

    .line 1895
    .end local v0    # "ptr":I
    .end local v2    # "buf":[C
    :cond_4
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-nez v0, :cond_5

    .line 1896
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v0

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .local v0, "escape":Ljava/lang/String;
    goto :goto_1

    .line 1898
    .end local v0    # "escape":Ljava/lang/String;
    :cond_5
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1899
    .restart local v0    # "escape":Ljava/lang/String;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    .line 1901
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1902
    .local v1, "len":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v2, v3, :cond_6

    .line 1903
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1904
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_6

    .line 1905
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1906
    return-void

    .line 1909
    :cond_6
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 1910
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1911
    return-void
.end method

.method private _prependOrWriteCharacterEscape([CIICI)I
    .locals 6
    .param p1, "buffer"    # [C
    .param p2, "ptr"    # I
    .param p3, "end"    # I
    .param p4, "ch"    # C
    .param p5, "escCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1783
    const/16 v0, 0x5c

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ltz p5, :cond_2

    .line 1784
    const/4 v3, 0x1

    if-le p2, v3, :cond_0

    if-ge p2, p3, :cond_0

    .line 1785
    add-int/lit8 p2, p2, -0x2

    .line 1786
    aput-char v0, p1, p2

    .line 1787
    add-int/lit8 v0, p2, 0x1

    int-to-char v1, p5

    aput-char v1, p1, v0

    goto :goto_0

    .line 1789
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1790
    .local v0, "ent":[C
    if-nez v0, :cond_1

    .line 1791
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateEntityBuffer()[C

    move-result-object v0

    .line 1793
    :cond_1
    int-to-char v4, p5

    aput-char v4, v0, v3

    .line 1794
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v3, v0, v2, v1}, Ljava/io/Writer;->write([CII)V

    .line 1796
    .end local v0    # "ent":[C
    :goto_0
    return p2

    .line 1798
    :cond_2
    const/4 v3, -0x2

    if-eq p5, v3, :cond_7

    .line 1799
    const/4 v2, 0x5

    const/16 v3, 0xff

    if-le p2, v2, :cond_4

    if-ge p2, p3, :cond_4

    .line 1800
    add-int/lit8 p2, p2, -0x6

    .line 1801
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "ptr":I
    .local v1, "ptr":I
    aput-char v0, p1, p2

    .line 1802
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "ptr":I
    .restart local p2    # "ptr":I
    const/16 v0, 0x75

    aput-char v0, p1, v1

    .line 1804
    if-le p4, v3, :cond_3

    .line 1805
    shr-int/lit8 v0, p4, 0x8

    and-int/2addr v0, v3

    .line 1806
    .local v0, "hi":I
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "ptr":I
    .restart local v1    # "ptr":I
    sget-object v2, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v3, v0, 0x4

    aget-char v2, v2, v3

    aput-char v2, p1, p2

    .line 1807
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "ptr":I
    .restart local p2    # "ptr":I
    sget-object v2, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v3, v0, 0xf

    aget-char v2, v2, v3

    aput-char v2, p1, v1

    .line 1808
    and-int/lit16 v1, p4, 0xff

    int-to-char p4, v1

    .line 1809
    .end local v0    # "hi":I
    goto :goto_1

    .line 1810
    :cond_3
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "ptr":I
    .local v0, "ptr":I
    const/16 v1, 0x30

    aput-char v1, p1, p2

    .line 1811
    add-int/lit8 p2, v0, 0x1

    .end local v0    # "ptr":I
    .restart local p2    # "ptr":I
    aput-char v1, p1, v0

    .line 1813
    :goto_1
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "ptr":I
    .restart local v0    # "ptr":I
    sget-object v1, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v2, p4, 0x4

    aget-char v1, v1, v2

    aput-char v1, p1, p2

    .line 1814
    sget-object p2, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v1, p4, 0xf

    aget-char p2, p2, v1

    aput-char p2, p1, v0

    .line 1815
    add-int/lit8 p2, v0, -0x5

    .end local v0    # "ptr":I
    .restart local p2    # "ptr":I
    goto :goto_2

    .line 1818
    :cond_4
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1819
    .local v0, "ent":[C
    if-nez v0, :cond_5

    .line 1820
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateEntityBuffer()[C

    move-result-object v0

    .line 1822
    :cond_5
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1823
    const/4 v2, 0x6

    if-le p4, v3, :cond_6

    .line 1824
    shr-int/lit8 v1, p4, 0x8

    and-int/2addr v1, v3

    .line 1825
    .local v1, "hi":I
    and-int/lit16 v3, p4, 0xff

    .line 1826
    .local v3, "lo":I
    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v1, 0x4

    aget-char v4, v4, v5

    const/16 v5, 0xa

    aput-char v4, v0, v5

    .line 1827
    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v5, v1, 0xf

    aget-char v4, v4, v5

    const/16 v5, 0xb

    aput-char v4, v0, v5

    .line 1828
    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v3, 0x4

    aget-char v4, v4, v5

    const/16 v5, 0xc

    aput-char v4, v0, v5

    .line 1829
    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v5, v3, 0xf

    aget-char v4, v4, v5

    const/16 v5, 0xd

    aput-char v4, v0, v5

    .line 1830
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    const/16 v5, 0x8

    invoke-virtual {v4, v0, v5, v2}, Ljava/io/Writer;->write([CII)V

    .line 1831
    .end local v1    # "hi":I
    .end local v3    # "lo":I
    goto :goto_2

    .line 1832
    :cond_6
    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v4, p4, 0x4

    aget-char v3, v3, v4

    aput-char v3, v0, v2

    .line 1833
    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v4, p4, 0xf

    aget-char v3, v3, v4

    const/4 v4, 0x7

    aput-char v3, v0, v4

    .line 1834
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v3, v0, v1, v2}, Ljava/io/Writer;->write([CII)V

    .line 1837
    .end local v0    # "ent":[C
    :goto_2
    return p2

    .line 1840
    :cond_7
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-nez v0, :cond_8

    .line 1841
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    invoke-virtual {v0, p4}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v0

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .local v0, "escape":Ljava/lang/String;
    goto :goto_3

    .line 1843
    .end local v0    # "escape":Ljava/lang/String;
    :cond_8
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1844
    .restart local v0    # "escape":Ljava/lang/String;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    .line 1846
    :goto_3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1847
    .local v1, "len":I
    if-lt p2, v1, :cond_9

    if-ge p2, p3, :cond_9

    .line 1848
    sub-int/2addr p2, v1

    .line 1849
    invoke-virtual {v0, v2, v1, p1, p2}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_4

    .line 1851
    :cond_9
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1853
    :goto_4
    return p2
.end method

.method private _prependOrWriteCharacterEscape(CI)V
    .locals 6
    .param p1, "ch"    # C
    .param p2, "escCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1692
    const/4 v0, 0x0

    const/16 v1, 0x5c

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ltz p2, :cond_2

    .line 1693
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v4, v2, :cond_0

    .line 1694
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v2

    .line 1695
    .local v0, "ptr":I
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1696
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    add-int/lit8 v3, v0, 0x1

    .end local v0    # "ptr":I
    .local v3, "ptr":I
    aput-char v1, v2, v0

    .line 1697
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    int-to-char v1, p2

    aput-char v1, v0, v3

    .line 1698
    return-void

    .line 1701
    .end local v3    # "ptr":I
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1702
    .local v1, "buf":[C
    if-nez v1, :cond_1

    .line 1703
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateEntityBuffer()[C

    move-result-object v1

    .line 1705
    :cond_1
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1706
    int-to-char v4, p2

    aput-char v4, v1, v3

    .line 1707
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v3, v1, v0, v2}, Ljava/io/Writer;->write([CII)V

    .line 1708
    return-void

    .line 1710
    .end local v1    # "buf":[C
    :cond_2
    const/4 v4, -0x2

    if-eq p2, v4, :cond_7

    .line 1711
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/4 v4, 0x6

    const/16 v5, 0xff

    if-lt v0, v4, :cond_4

    .line 1712
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 1713
    .local v0, "buf":[C
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v2, v4

    .line 1714
    .local v2, "ptr":I
    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1715
    aput-char v1, v0, v2

    .line 1716
    add-int/2addr v2, v3

    const/16 v1, 0x75

    aput-char v1, v0, v2

    .line 1718
    if-le p1, v5, :cond_3

    .line 1719
    shr-int/lit8 v1, p1, 0x8

    and-int/2addr v1, v5

    .line 1720
    .local v1, "hi":I
    add-int/2addr v2, v3

    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v1, 0x4

    aget-char v4, v4, v5

    aput-char v4, v0, v2

    .line 1721
    add-int/2addr v2, v3

    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v5, v1, 0xf

    aget-char v4, v4, v5

    aput-char v4, v0, v2

    .line 1722
    and-int/lit16 v4, p1, 0xff

    int-to-char p1, v4

    .line 1723
    .end local v1    # "hi":I
    goto :goto_0

    .line 1724
    :cond_3
    add-int/2addr v2, v3

    const/16 v1, 0x30

    aput-char v1, v0, v2

    .line 1725
    add-int/2addr v2, v3

    aput-char v1, v0, v2

    .line 1727
    :goto_0
    add-int/2addr v2, v3

    sget-object v1, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v4, p1, 0x4

    aget-char v1, v1, v4

    aput-char v1, v0, v2

    .line 1728
    add-int/2addr v2, v3

    sget-object v1, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v1, v1, v3

    aput-char v1, v0, v2

    .line 1729
    return-void

    .line 1732
    .end local v0    # "buf":[C
    .end local v2    # "ptr":I
    :cond_4
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1733
    .restart local v0    # "buf":[C
    if-nez v0, :cond_5

    .line 1734
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateEntityBuffer()[C

    move-result-object v0

    .line 1736
    :cond_5
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1737
    if-le p1, v5, :cond_6

    .line 1738
    shr-int/lit8 v1, p1, 0x8

    and-int/2addr v1, v5

    .line 1739
    .restart local v1    # "hi":I
    and-int/lit16 v2, p1, 0xff

    .line 1740
    .local v2, "lo":I
    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v1, 0x4

    aget-char v3, v3, v5

    const/16 v5, 0xa

    aput-char v3, v0, v5

    .line 1741
    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v5, v1, 0xf

    aget-char v3, v3, v5

    const/16 v5, 0xb

    aput-char v3, v0, v5

    .line 1742
    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v2, 0x4

    aget-char v3, v3, v5

    const/16 v5, 0xc

    aput-char v3, v0, v5

    .line 1743
    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v5, v2, 0xf

    aget-char v3, v3, v5

    const/16 v5, 0xd

    aput-char v3, v0, v5

    .line 1744
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    const/16 v5, 0x8

    invoke-virtual {v3, v0, v5, v4}, Ljava/io/Writer;->write([CII)V

    .line 1745
    .end local v1    # "hi":I
    .end local v2    # "lo":I
    goto :goto_1

    .line 1746
    :cond_6
    sget-object v1, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v3, p1, 0x4

    aget-char v1, v1, v3

    aput-char v1, v0, v4

    .line 1747
    sget-object v1, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v1, v1, v3

    const/4 v3, 0x7

    aput-char v1, v0, v3

    .line 1748
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v1, v0, v2, v4}, Ljava/io/Writer;->write([CII)V

    .line 1750
    :goto_1
    return-void

    .line 1754
    .end local v0    # "buf":[C
    :cond_7
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-nez v1, :cond_8

    .line 1755
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v1

    invoke-interface {v1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v1

    .local v1, "escape":Ljava/lang/String;
    goto :goto_2

    .line 1757
    .end local v1    # "escape":Ljava/lang/String;
    :cond_8
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 1758
    .restart local v1    # "escape":Ljava/lang/String;
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    .line 1760
    :goto_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 1761
    .local v2, "len":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v3, v2, :cond_9

    .line 1762
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v3, v2

    .line 1763
    .restart local v3    # "ptr":I
    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1764
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v1, v0, v2, v4, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 1765
    return-void

    .line 1768
    .end local v3    # "ptr":I
    :cond_9
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1769
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1770
    return-void
.end method

.method private _readMore(Ljava/io/InputStream;[BIII)I
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

    .line 1636
    const/4 v0, 0x0

    .line 1637
    .local v0, "i":I
    :goto_0
    if-ge p3, p4, :cond_0

    .line 1638
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

    .line 1640
    .end local v1    # "i":I
    .end local v2    # "inputPtr":I
    .restart local v0    # "i":I
    .restart local p3    # "inputPtr":I
    :cond_0
    const/4 p3, 0x0

    .line 1641
    move p4, v0

    .line 1642
    array-length v1, p2

    invoke-static {p5, v1}, Ljava/lang/Math;->min(II)I

    move-result p5

    .line 1645
    :cond_1
    sub-int v1, p5, p4

    .line 1646
    .local v1, "length":I
    if-nez v1, :cond_2

    .line 1647
    goto :goto_1

    .line 1649
    :cond_2
    invoke-virtual {p1, p2, p4, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 1650
    .local v2, "count":I
    if-gez v2, :cond_3

    .line 1651
    return p4

    .line 1653
    :cond_3
    add-int/2addr p4, v2

    .line 1654
    .end local v1    # "length":I
    .end local v2    # "count":I
    const/4 v1, 0x3

    if-lt p4, v1, :cond_1

    .line 1655
    :goto_1
    return p4
.end method

.method private _writeLongString(Ljava/lang/String;)V
    .locals 7
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1030
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1033
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1034
    .local v0, "textLen":I
    const/4 v1, 0x0

    .line 1036
    .local v1, "offset":I
    :cond_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    .line 1037
    .local v2, "max":I
    add-int v3, v1, v2

    if-le v3, v0, :cond_1

    sub-int v3, v0, v1

    goto :goto_0

    :cond_1
    move v3, v2

    .line 1039
    .local v3, "segmentLen":I
    :goto_0
    add-int v4, v1, v3

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    const/4 v6, 0x0

    invoke-virtual {p1, v1, v4, v5, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 1040
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    if-eqz v4, :cond_2

    .line 1041
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeSegmentCustom(I)V

    goto :goto_1

    .line 1042
    :cond_2
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    if-eqz v4, :cond_3

    .line 1043
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    invoke-direct {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeSegmentASCII(II)V

    goto :goto_1

    .line 1045
    :cond_3
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeSegment(I)V

    .line 1047
    :goto_1
    add-int/2addr v1, v3

    .line 1048
    .end local v2    # "max":I
    .end local v3    # "segmentLen":I
    if-lt v1, v0, :cond_0

    .line 1049
    return-void
.end method

.method private final _writeNull()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1666
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 1667
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1669
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1670
    .local v0, "ptr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 1671
    .local v1, "buf":[C
    const/16 v2, 0x6e

    aput-char v2, v1, v0

    .line 1672
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x75

    aput-char v2, v1, v0

    .line 1673
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x6c

    aput-char v2, v1, v0

    .line 1674
    add-int/lit8 v0, v0, 0x1

    aput-char v2, v1, v0

    .line 1675
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1676
    return-void
.end method

.method private _writeQuotedInt(I)V
    .locals 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 690
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0xd

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 691
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 693
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 694
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 695
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 696
    return-void
.end method

.method private _writeQuotedLong(J)V
    .locals 3
    .param p1, "l"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 714
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x17

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 715
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 717
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 718
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputLong(J[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 719
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 720
    return-void
.end method

.method private _writeQuotedRaw(Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 793
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 794
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 796
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 797
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 798
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 799
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 801
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 802
    return-void
.end method

.method private _writeQuotedShort(S)V
    .locals 3
    .param p1, "s"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 666
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x8

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 667
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 669
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 670
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 671
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 672
    return-void
.end method

.method private _writeSegment(I)V
    .locals 11
    .param p1, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1062
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1063
    .local v0, "escCodes":[I
    array-length v1, v0

    .line 1065
    .local v1, "escLen":I
    const/4 v2, 0x0

    .line 1066
    .local v2, "ptr":I
    move v3, v2

    .line 1069
    .local v3, "start":I
    :goto_0
    if-ge v2, p1, :cond_3

    .line 1073
    :goto_1
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    aget-char v9, v4, v2

    .line 1074
    .local v9, "c":C
    if-ge v9, v1, :cond_0

    aget v4, v0, v9

    if-eqz v4, :cond_0

    .line 1075
    goto :goto_2

    .line 1077
    :cond_0
    add-int/lit8 v2, v2, 0x1

    if-lt v2, p1, :cond_2

    .line 1078
    nop

    .line 1086
    :goto_2
    sub-int v4, v2, v3

    .line 1087
    .local v4, "flushLen":I
    if-lez v4, :cond_1

    .line 1088
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v5, v6, v3, v4}, Ljava/io/Writer;->write([CII)V

    .line 1089
    if-lt v2, p1, :cond_1

    .line 1090
    move v8, p1

    goto :goto_3

    .line 1093
    :cond_1
    add-int/lit8 v7, v2, 0x1

    .line 1095
    .end local v2    # "ptr":I
    .local v7, "ptr":I
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    aget v10, v0, v9

    move-object v5, p0

    move v8, p1

    .end local p1    # "end":I
    .local v8, "end":I
    invoke-direct/range {v5 .. v10}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape([CIICI)I

    move-result v3

    .line 1096
    .end local v4    # "flushLen":I
    .end local v9    # "c":C
    move v2, v7

    goto :goto_0

    .line 1077
    .end local v7    # "ptr":I
    .end local v8    # "end":I
    .restart local v2    # "ptr":I
    .restart local v9    # "c":C
    .restart local p1    # "end":I
    :cond_2
    move v8, p1

    .end local p1    # "end":I
    .restart local v8    # "end":I
    goto :goto_1

    .line 1069
    .end local v8    # "end":I
    .end local v9    # "c":C
    .restart local p1    # "end":I
    :cond_3
    move v8, p1

    .line 1097
    .end local p1    # "end":I
    .restart local v8    # "end":I
    :goto_3
    return-void
.end method

.method private _writeSegmentASCII(II)V
    .locals 12
    .param p1, "end"    # I
    .param p2, "maxNonEscaped"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1210
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1211
    .local v0, "escCodes":[I
    array-length v1, v0

    add-int/lit8 v2, p2, 0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1213
    .local v1, "escLimit":I
    const/4 v2, 0x0

    .line 1214
    .local v2, "ptr":I
    const/4 v3, 0x0

    .line 1215
    .local v3, "escCode":I
    move v4, v2

    .line 1218
    .local v4, "start":I
    :goto_0
    if-ge v2, p1, :cond_4

    .line 1222
    :goto_1
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    aget-char v10, v5, v2

    .line 1223
    .local v10, "c":C
    if-ge v10, v1, :cond_0

    .line 1224
    aget v3, v0, v10

    .line 1225
    if-eqz v3, :cond_1

    .line 1226
    move v11, v3

    goto :goto_2

    .line 1228
    :cond_0
    if-le v10, p2, :cond_1

    .line 1229
    const/4 v3, -0x1

    .line 1230
    move v11, v3

    goto :goto_2

    .line 1232
    :cond_1
    add-int/lit8 v2, v2, 0x1

    if-lt v2, p1, :cond_3

    .line 1233
    move v11, v3

    .line 1236
    .end local v3    # "escCode":I
    .local v11, "escCode":I
    :goto_2
    sub-int v3, v2, v4

    .line 1237
    .local v3, "flushLen":I
    if-lez v3, :cond_2

    .line 1238
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v5, v6, v4, v3}, Ljava/io/Writer;->write([CII)V

    .line 1239
    if-lt v2, p1, :cond_2

    .line 1240
    move v9, p1

    move v3, v11

    goto :goto_3

    .line 1243
    :cond_2
    add-int/lit8 v8, v2, 0x1

    .line 1244
    .end local v2    # "ptr":I
    .local v8, "ptr":I
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    move-object v6, p0

    move v9, p1

    .end local p1    # "end":I
    .local v9, "end":I
    invoke-direct/range {v6 .. v11}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape([CIICI)I

    move-result v4

    .line 1245
    .end local v3    # "flushLen":I
    .end local v10    # "c":C
    move v2, v8

    move v3, v11

    goto :goto_0

    .line 1232
    .end local v8    # "ptr":I
    .end local v9    # "end":I
    .end local v11    # "escCode":I
    .restart local v2    # "ptr":I
    .local v3, "escCode":I
    .restart local v10    # "c":C
    .restart local p1    # "end":I
    :cond_3
    move v9, p1

    .end local p1    # "end":I
    .restart local v9    # "end":I
    goto :goto_1

    .line 1218
    .end local v9    # "end":I
    .end local v10    # "c":C
    .restart local p1    # "end":I
    :cond_4
    move v9, p1

    .line 1246
    .end local p1    # "end":I
    .restart local v9    # "end":I
    :goto_3
    return-void
.end method

.method private _writeSegmentCustom(I)V
    .locals 14
    .param p1, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1361
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1362
    .local v0, "escCodes":[I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    const v1, 0xffff

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    .line 1363
    .local v1, "maxNonEscaped":I
    :goto_0
    array-length v2, v0

    add-int/lit8 v3, v1, 0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1364
    .local v2, "escLimit":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .line 1366
    .local v3, "customEscapes":Lcom/fasterxml/jackson/core/io/CharacterEscapes;
    const/4 v4, 0x0

    .line 1367
    .local v4, "ptr":I
    const/4 v5, 0x0

    .line 1368
    .local v5, "escCode":I
    move v6, v4

    .line 1371
    .local v6, "start":I
    :goto_1
    if-ge v4, p1, :cond_6

    .line 1375
    :goto_2
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    aget-char v12, v7, v4

    .line 1376
    .local v12, "c":C
    if-ge v12, v2, :cond_1

    .line 1377
    aget v5, v0, v12

    .line 1378
    if-eqz v5, :cond_3

    .line 1379
    move v13, v5

    goto :goto_3

    .line 1381
    :cond_1
    if-le v12, v1, :cond_2

    .line 1382
    const/4 v5, -0x1

    .line 1383
    move v13, v5

    goto :goto_3

    .line 1385
    :cond_2
    invoke-virtual {v3, v12}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v7, :cond_3

    .line 1386
    const/4 v5, -0x2

    .line 1387
    move v13, v5

    goto :goto_3

    .line 1390
    :cond_3
    add-int/lit8 v4, v4, 0x1

    if-lt v4, p1, :cond_5

    .line 1391
    move v13, v5

    .line 1394
    .end local v5    # "escCode":I
    .local v13, "escCode":I
    :goto_3
    sub-int v5, v4, v6

    .line 1395
    .local v5, "flushLen":I
    if-lez v5, :cond_4

    .line 1396
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v7, v8, v6, v5}, Ljava/io/Writer;->write([CII)V

    .line 1397
    if-lt v4, p1, :cond_4

    .line 1398
    move v11, p1

    move v5, v13

    goto :goto_4

    .line 1401
    :cond_4
    add-int/lit8 v10, v4, 0x1

    .line 1402
    .end local v4    # "ptr":I
    .local v10, "ptr":I
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    move-object v8, p0

    move v11, p1

    .end local p1    # "end":I
    .local v11, "end":I
    invoke-direct/range {v8 .. v13}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape([CIICI)I

    move-result v6

    .line 1403
    .end local v5    # "flushLen":I
    .end local v12    # "c":C
    move v4, v10

    move v5, v13

    goto :goto_1

    .line 1390
    .end local v10    # "ptr":I
    .end local v11    # "end":I
    .end local v13    # "escCode":I
    .restart local v4    # "ptr":I
    .local v5, "escCode":I
    .restart local v12    # "c":C
    .restart local p1    # "end":I
    :cond_5
    move v11, p1

    .end local p1    # "end":I
    .restart local v11    # "end":I
    goto :goto_2

    .line 1371
    .end local v11    # "end":I
    .end local v12    # "c":C
    .restart local p1    # "end":I
    :cond_6
    move v11, p1

    .line 1404
    .end local p1    # "end":I
    .restart local v11    # "end":I
    :goto_4
    return-void
.end method

.method private _writeString(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 964
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 965
    .local v0, "len":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_0

    .line 966
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeLongString(Ljava/lang/String;)V

    .line 967
    return-void

    .line 972
    :cond_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_1

    .line 973
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 975
    :cond_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0, v1, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 977
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    if-eqz v1, :cond_2

    .line 978
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeStringCustom(I)V

    goto :goto_0

    .line 979
    :cond_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    if-eqz v1, :cond_3

    .line 980
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeStringASCII(II)V

    goto :goto_0

    .line 982
    :cond_3
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString2(I)V

    .line 984
    :goto_0
    return-void
.end method

.method private _writeString([CII)V
    .locals 6
    .param p1, "text"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1105
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    if-eqz v0, :cond_0

    .line 1106
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeStringCustom([CII)V

    .line 1107
    return-void

    .line 1109
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    if-eqz v0, :cond_1

    .line 1110
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeStringASCII([CIII)V

    .line 1111
    return-void

    .line 1118
    :cond_1
    add-int/2addr p3, p2

    .line 1119
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1120
    .local v0, "escCodes":[I
    array-length v1, v0

    .line 1121
    .local v1, "escLen":I
    :goto_0
    if-ge p2, p3, :cond_8

    .line 1122
    move v2, p2

    .line 1125
    .local v2, "start":I
    :goto_1
    aget-char v3, p1, p2

    .line 1126
    .local v3, "c":C
    if-ge v3, v1, :cond_2

    aget v4, v0, v3

    if-eqz v4, :cond_2

    .line 1127
    goto :goto_2

    .line 1129
    :cond_2
    add-int/lit8 p2, p2, 0x1

    if-lt p2, p3, :cond_7

    .line 1130
    nop

    .line 1135
    .end local v3    # "c":C
    :goto_2
    sub-int v3, p2, v2

    .line 1136
    .local v3, "newAmount":I
    const/16 v4, 0x20

    if-ge v3, v4, :cond_4

    .line 1138
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v4, v3

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v4, v5, :cond_3

    .line 1139
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1141
    :cond_3
    if-lez v3, :cond_5

    .line 1142
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v2, v4, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1143
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v4, v3

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_3

    .line 1146
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1147
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v4, p1, v2, v3}, Ljava/io/Writer;->write([CII)V

    .line 1150
    :cond_5
    :goto_3
    if-lt p2, p3, :cond_6

    .line 1151
    goto :goto_4

    .line 1154
    :cond_6
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "offset":I
    .local v4, "offset":I
    aget-char p2, p1, p2

    .line 1155
    .local p2, "c":C
    aget v5, v0, p2

    invoke-direct {p0, p2, v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_appendCharacterEscape(CI)V

    .line 1156
    .end local v2    # "start":I
    .end local v3    # "newAmount":I
    .end local p2    # "c":C
    move p2, v4

    goto :goto_0

    .line 1132
    .end local v4    # "offset":I
    .restart local v2    # "start":I
    .local p2, "offset":I
    :cond_7
    goto :goto_1

    .line 1157
    .end local v2    # "start":I
    :cond_8
    :goto_4
    return-void
.end method

.method private _writeString2(I)V
    .locals 7
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 989
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, p1

    .line 990
    .local v0, "end":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 991
    .local v1, "escCodes":[I
    array-length v2, v1

    .line 994
    .local v2, "escLen":I
    :goto_0
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-ge v3, v0, :cond_3

    .line 998
    :goto_1
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aget-char v3, v3, v4

    .line 999
    .local v3, "c":C
    if-ge v3, v2, :cond_1

    aget v4, v1, v3

    if-eqz v4, :cond_1

    .line 1000
    nop

    .line 1011
    .end local v3    # "c":C
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v3, v4

    .line 1012
    .local v3, "flushLen":I
    if-lez v3, :cond_0

    .line 1013
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    invoke-virtual {v4, v5, v6, v3}, Ljava/io/Writer;->write([CII)V

    .line 1018
    :cond_0
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aget-char v4, v4, v5

    .line 1019
    .local v4, "c":C
    aget v5, v1, v4

    invoke-direct {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape(CI)V

    .line 1020
    .end local v3    # "flushLen":I
    .end local v4    # "c":C
    goto :goto_0

    .line 1002
    .local v3, "c":C
    :cond_1
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v4, v0, :cond_2

    .line 1003
    goto :goto_2

    .line 1005
    .end local v3    # "c":C
    :cond_2
    goto :goto_1

    .line 1021
    :cond_3
    :goto_2
    return-void
.end method

.method private _writeStringASCII(II)V
    .locals 9
    .param p1, "len"    # I
    .param p2, "maxNonEscaped"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1173
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, p1

    .line 1174
    .local v0, "end":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1175
    .local v1, "escCodes":[I
    array-length v2, v1

    add-int/lit8 v3, p2, 0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1176
    .local v2, "escLimit":I
    const/4 v3, 0x0

    .line 1179
    .local v3, "escCode":I
    :goto_0
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-ge v4, v0, :cond_4

    .line 1184
    :cond_0
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aget-char v4, v4, v5

    .line 1185
    .local v4, "c":C
    if-ge v4, v2, :cond_1

    .line 1186
    aget v3, v1, v4

    .line 1187
    if-eqz v3, :cond_3

    .line 1188
    goto :goto_1

    .line 1190
    :cond_1
    if-le v4, p2, :cond_3

    .line 1191
    const/4 v3, -0x1

    .line 1192
    nop

    .line 1198
    :goto_1
    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v5, v6

    .line 1199
    .local v5, "flushLen":I
    if-lez v5, :cond_2

    .line 1200
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    invoke-virtual {v6, v7, v8, v5}, Ljava/io/Writer;->write([CII)V

    .line 1202
    :cond_2
    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1203
    invoke-direct {p0, v4, v3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape(CI)V

    .line 1204
    .end local v4    # "c":C
    .end local v5    # "flushLen":I
    goto :goto_0

    .line 1194
    .restart local v4    # "c":C
    :cond_3
    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v5, v0, :cond_0

    .line 1195
    nop

    .line 1205
    .end local v4    # "c":C
    :cond_4
    return-void
.end method

.method private _writeStringASCII([CIII)V
    .locals 8
    .param p1, "text"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .param p4, "maxNonEscaped"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1252
    add-int/2addr p3, p2

    .line 1253
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1254
    .local v0, "escCodes":[I
    array-length v1, v0

    add-int/lit8 v2, p4, 0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1256
    .local v1, "escLimit":I
    const/4 v2, 0x0

    .line 1258
    .local v2, "escCode":I
    :goto_0
    if-ge p2, p3, :cond_7

    .line 1259
    move v3, p2

    .line 1263
    .local v3, "start":I
    :cond_0
    aget-char v4, p1, p2

    .line 1264
    .local v4, "c":C
    if-ge v4, v1, :cond_1

    .line 1265
    aget v2, v0, v4

    .line 1266
    if-eqz v2, :cond_2

    .line 1267
    goto :goto_1

    .line 1269
    :cond_1
    if-le v4, p4, :cond_2

    .line 1270
    const/4 v2, -0x1

    .line 1271
    goto :goto_1

    .line 1273
    :cond_2
    add-int/lit8 p2, p2, 0x1

    if-lt p2, p3, :cond_0

    .line 1274
    nop

    .line 1279
    :goto_1
    sub-int v5, p2, v3

    .line 1280
    .local v5, "newAmount":I
    const/16 v6, 0x20

    if-ge v5, v6, :cond_4

    .line 1282
    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v6, v5

    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v6, v7, :cond_3

    .line 1283
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1285
    :cond_3
    if-lez v5, :cond_5

    .line 1286
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v3, v6, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1287
    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v6, v5

    iput v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_2

    .line 1290
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1291
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v6, p1, v3, v5}, Ljava/io/Writer;->write([CII)V

    .line 1294
    :cond_5
    :goto_2
    if-lt p2, p3, :cond_6

    .line 1295
    goto :goto_3

    .line 1298
    :cond_6
    add-int/lit8 p2, p2, 0x1

    .line 1299
    invoke-direct {p0, v4, v2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_appendCharacterEscape(CI)V

    .line 1300
    .end local v3    # "start":I
    .end local v4    # "c":C
    .end local v5    # "newAmount":I
    goto :goto_0

    .line 1301
    :cond_7
    :goto_3
    return-void
.end method

.method private _writeStringCustom(I)V
    .locals 12
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1317
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, p1

    .line 1318
    .local v0, "end":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1319
    .local v1, "escCodes":[I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    const/4 v3, 0x1

    if-ge v2, v3, :cond_0

    const v2, 0xffff

    goto :goto_0

    :cond_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    .line 1320
    .local v2, "maxNonEscaped":I
    :goto_0
    array-length v4, v1

    add-int/lit8 v5, v2, 0x1

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 1321
    .local v4, "escLimit":I
    const/4 v5, 0x0

    .line 1322
    .local v5, "escCode":I
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .line 1325
    .local v6, "customEscapes":Lcom/fasterxml/jackson/core/io/CharacterEscapes;
    :goto_1
    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-ge v7, v0, :cond_6

    .line 1330
    :cond_1
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aget-char v7, v7, v8

    .line 1331
    .local v7, "c":C
    if-ge v7, v4, :cond_2

    .line 1332
    aget v5, v1, v7

    .line 1333
    if-eqz v5, :cond_5

    .line 1334
    goto :goto_2

    .line 1336
    :cond_2
    if-le v7, v2, :cond_3

    .line 1337
    const/4 v5, -0x1

    .line 1338
    goto :goto_2

    .line 1340
    :cond_3
    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v8

    iput-object v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v8, :cond_5

    .line 1341
    const/4 v5, -0x2

    .line 1342
    nop

    .line 1349
    :goto_2
    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v8, v9

    .line 1350
    .local v8, "flushLen":I
    if-lez v8, :cond_4

    .line 1351
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v10, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v11, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    invoke-virtual {v9, v10, v11, v8}, Ljava/io/Writer;->write([CII)V

    .line 1353
    :cond_4
    iget v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v9, v3

    iput v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1354
    invoke-direct {p0, v7, v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape(CI)V

    .line 1355
    .end local v7    # "c":C
    .end local v8    # "flushLen":I
    goto :goto_1

    .line 1345
    .restart local v7    # "c":C
    :cond_5
    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v8, v3

    iput v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v8, v0, :cond_1

    .line 1346
    nop

    .line 1356
    .end local v7    # "c":C
    :cond_6
    return-void
.end method

.method private _writeStringCustom([CII)V
    .locals 10
    .param p1, "text"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 1409
    add-int/2addr p3, p2

    .line 1410
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1411
    .local v0, "escCodes":[I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    const v1, 0xffff

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    .line 1412
    .local v1, "maxNonEscaped":I
    :goto_0
    array-length v2, v0

    add-int/lit8 v3, v1, 0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1413
    .local v2, "escLimit":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .line 1415
    .local v3, "customEscapes":Lcom/fasterxml/jackson/core/io/CharacterEscapes;
    const/4 v4, 0x0

    .line 1417
    .local v4, "escCode":I
    :goto_1
    if-ge p2, p3, :cond_9

    .line 1418
    move v5, p2

    .line 1422
    .local v5, "start":I
    :cond_1
    aget-char v6, p1, p2

    .line 1423
    .local v6, "c":C
    if-ge v6, v2, :cond_2

    .line 1424
    aget v4, v0, v6

    .line 1425
    if-eqz v4, :cond_4

    .line 1426
    goto :goto_2

    .line 1428
    :cond_2
    if-le v6, v1, :cond_3

    .line 1429
    const/4 v4, -0x1

    .line 1430
    goto :goto_2

    .line 1432
    :cond_3
    invoke-virtual {v3, v6}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v7, :cond_4

    .line 1433
    const/4 v4, -0x2

    .line 1434
    goto :goto_2

    .line 1437
    :cond_4
    add-int/lit8 p2, p2, 0x1

    if-lt p2, p3, :cond_1

    .line 1438
    nop

    .line 1443
    :goto_2
    sub-int v7, p2, v5

    .line 1444
    .local v7, "newAmount":I
    const/16 v8, 0x20

    if-ge v7, v8, :cond_6

    .line 1446
    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v8, v7

    iget v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v8, v9, :cond_5

    .line 1447
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1449
    :cond_5
    if-lez v7, :cond_7

    .line 1450
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v5, v8, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1451
    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v8, v7

    iput v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_3

    .line 1454
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1455
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v8, p1, v5, v7}, Ljava/io/Writer;->write([CII)V

    .line 1458
    :cond_7
    :goto_3
    if-lt p2, p3, :cond_8

    .line 1459
    goto :goto_4

    .line 1462
    :cond_8
    add-int/lit8 p2, p2, 0x1

    .line 1463
    invoke-direct {p0, v6, v4}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_appendCharacterEscape(CI)V

    .line 1464
    .end local v5    # "start":I
    .end local v6    # "c":C
    .end local v7    # "newAmount":I
    goto :goto_1

    .line 1465
    :cond_9
    :goto_4
    return-void
.end method

.method private writeRawLong(Ljava/lang/String;)V
    .locals 7
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 563
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v1

    .line 565
    .local v0, "room":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0, v1, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 566
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 567
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 568
    move v1, v0

    .line 569
    .local v1, "offset":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v0

    .line 571
    .local v2, "len":I
    :goto_0
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v2, v4, :cond_0

    .line 572
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    .line 573
    .local v4, "amount":I
    add-int v5, v1, v4

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {p1, v1, v5, v6, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 574
    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 575
    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 576
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 577
    add-int/2addr v1, v4

    .line 578
    sub-int/2addr v2, v4

    .line 579
    .end local v4    # "amount":I
    goto :goto_0

    .line 581
    :cond_0
    add-int v4, v1, v2

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {p1, v1, v4, v5, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 582
    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 583
    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 584
    return-void
.end method


# virtual methods
.method protected _flushBuffer()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1942
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v0, v1

    .line 1943
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 1944
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1945
    .local v1, "offset":I
    const/4 v2, 0x0

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1946
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v2, v3, v1, v0}, Ljava/io/Writer;->write([CII)V

    .line 1948
    .end local v1    # "offset":I
    :cond_0
    return-void
.end method

.method protected _releaseBuffers()V
    .locals 3

    .line 939
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 940
    .local v0, "buf":[C
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 941
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 942
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseConcatBuffer([C)V

    .line 944
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_charBuffer:[C

    .line 945
    if-eqz v0, :cond_1

    .line 946
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_charBuffer:[C

    .line 947
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseNameCopyBuffer([C)V

    .line 949
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

    .line 843
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeValue()I

    move-result v0

    .line 844
    .local v0, "status":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v1, :cond_0

    .line 846
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyPrettyValueWrite(Ljava/lang/String;I)V

    .line 847
    return-void

    .line 850
    :cond_0
    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 853
    :pswitch_0
    return-void

    .line 866
    .local v1, "c":C
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportCantWriteValueExpectName(Ljava/lang/String;)V

    .line 867
    return-void

    .line 861
    :pswitch_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_rootValueSeparator:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v2, :cond_1

    .line 862
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_rootValueSeparator:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v2}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 864
    :cond_1
    return-void

    .line 858
    :pswitch_3
    const/16 v1, 0x3a

    .line 859
    goto :goto_0

    .line 855
    .end local v1    # "c":C
    :pswitch_4
    const/16 v1, 0x2c

    .line 856
    .restart local v1    # "c":C
    nop

    .line 869
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_2

    .line 870
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 872
    :cond_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v1, v2, v3

    .line 873
    return-void

    nop

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

    .line 1579
    const/4 v0, 0x0

    .line 1580
    .local v0, "inputPtr":I
    const/4 v1, 0x0

    .line 1581
    .local v1, "inputEnd":I
    const/4 v2, -0x3

    .line 1582
    .local v2, "lastFullOffset":I
    const/4 v3, 0x0

    .line 1585
    .local v3, "bytesDone":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    add-int/lit8 v4, v4, -0x6

    .line 1586
    .local v4, "safeOutputEnd":I
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v5

    shr-int/lit8 v5, v5, 0x2

    move v9, v0

    move v10, v1

    .line 1590
    .end local v0    # "inputPtr":I
    .end local v1    # "inputEnd":I
    .local v5, "chunksBeforeLF":I
    .local v9, "inputPtr":I
    .local v10, "inputEnd":I
    :goto_0
    if-le v9, v2, :cond_4

    .line 1591
    array-length v11, p3

    move-object v6, p0

    move-object v7, p2

    move-object v8, p3

    .end local p2    # "data":Ljava/io/InputStream;
    .end local p3    # "readBuffer":[B
    .local v7, "data":Ljava/io/InputStream;
    .local v8, "readBuffer":[B
    invoke-direct/range {v6 .. v11}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result p2

    .line 1592
    .end local v10    # "inputEnd":I
    .local p2, "inputEnd":I
    const/4 v9, 0x0

    .line 1593
    const/4 p3, 0x3

    if-ge p2, p3, :cond_3

    .line 1594
    nop

    .line 1615
    if-ge v9, p2, :cond_2

    .line 1616
    iget p3, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le p3, v4, :cond_0

    .line 1617
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1619
    :cond_0
    add-int/lit8 p3, v9, 0x1

    .end local v9    # "inputPtr":I
    .local p3, "inputPtr":I
    aget-byte v0, v8, v9

    shl-int/lit8 v0, v0, 0x10

    .line 1620
    .local v0, "b24":I
    const/4 v1, 0x1

    .line 1621
    .local v1, "amount":I
    if-ge p3, p2, :cond_1

    .line 1622
    aget-byte v9, v8, p3

    and-int/lit16 v9, v9, 0xff

    shl-int/lit8 v9, v9, 0x8

    or-int/2addr v0, v9

    .line 1623
    const/4 v1, 0x2

    .line 1625
    :cond_1
    add-int/2addr v3, v1

    .line 1626
    iget-object v9, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v10, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v0, v1, v9, v10}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[CI)I

    move-result v9

    iput v9, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    move v9, p3

    .line 1628
    .end local v0    # "b24":I
    .end local v1    # "amount":I
    .end local p3    # "inputPtr":I
    .restart local v9    # "inputPtr":I
    :cond_2
    return v3

    .line 1596
    :cond_3
    add-int/lit8 p3, p2, -0x3

    move v10, p2

    move v2, p3

    .end local v2    # "lastFullOffset":I
    .local p3, "lastFullOffset":I
    goto :goto_1

    .line 1590
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

    .line 1598
    .end local p2    # "data":Ljava/io/InputStream;
    .end local p3    # "readBuffer":[B
    .restart local v7    # "data":Ljava/io/InputStream;
    .restart local v8    # "readBuffer":[B
    :goto_1
    iget p2, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le p2, v4, :cond_5

    .line 1599
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1602
    :cond_5
    add-int/lit8 p2, v9, 0x1

    .end local v9    # "inputPtr":I
    .local p2, "inputPtr":I
    aget-byte p3, v8, v9

    shl-int/lit8 p3, p3, 0x8

    .line 1603
    .local p3, "b24":I
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "inputPtr":I
    .local v0, "inputPtr":I
    aget-byte p2, v8, p2

    and-int/lit16 p2, p2, 0xff

    or-int/2addr p2, p3

    .line 1604
    .end local p3    # "b24":I
    .local p2, "b24":I
    shl-int/lit8 p3, p2, 0x8

    add-int/lit8 v9, v0, 0x1

    .end local v0    # "inputPtr":I
    .restart local v9    # "inputPtr":I
    aget-byte v0, v8, v0

    and-int/lit16 v0, v0, 0xff

    or-int p2, p3, v0

    .line 1605
    add-int/lit8 v3, v3, 0x3

    .line 1606
    iget-object p3, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v0, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[CI)I

    move-result p3

    iput p3, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1607
    add-int/lit8 v5, v5, -0x1

    if-gtz v5, :cond_6

    .line 1608
    iget-object p3, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v0, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v1, 0x5c

    aput-char v1, p3, v0

    .line 1609
    iget-object p3, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v0, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v6, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v1, 0x6e

    aput-char v1, p3, v0

    .line 1610
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result p3

    shr-int/lit8 p3, p3, 0x2

    move v5, p3

    .line 1612
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

    .line 1519
    const/4 v0, 0x0

    .line 1520
    .local v0, "inputPtr":I
    const/4 v1, 0x0

    .line 1521
    .local v1, "inputEnd":I
    const/4 v2, -0x3

    .line 1524
    .local v2, "lastFullOffset":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    add-int/lit8 v3, v3, -0x6

    .line 1525
    .local v3, "safeOutputEnd":I
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v4

    const/4 v5, 0x2

    shr-int/2addr v4, v5

    move/from16 v11, p4

    move v9, v0

    move v10, v1

    .line 1527
    .end local v0    # "inputPtr":I
    .end local v1    # "inputEnd":I
    .end local p4    # "bytesLeft":I
    .local v4, "chunksBeforeLF":I
    .local v9, "inputPtr":I
    .local v10, "inputEnd":I
    .local v11, "bytesLeft":I
    :goto_0
    if-le v11, v5, :cond_4

    .line 1528
    if-le v9, v2, :cond_1

    .line 1529
    move-object v6, p0

    move-object v7, p2

    move-object v8, p3

    invoke-direct/range {v6 .. v11}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result v10

    .line 1530
    const/4 v9, 0x0

    .line 1531
    const/4 v0, 0x3

    if-ge v10, v0, :cond_0

    .line 1532
    goto :goto_1

    .line 1534
    :cond_0
    add-int/lit8 v0, v10, -0x3

    move v2, v0

    .line 1536
    :cond_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v0, v3, :cond_2

    .line 1537
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1539
    :cond_2
    add-int/lit8 v0, v9, 0x1

    .end local v9    # "inputPtr":I
    .restart local v0    # "inputPtr":I
    aget-byte v1, p3, v9

    shl-int/lit8 v1, v1, 0x8

    .line 1540
    .local v1, "b24":I
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "inputPtr":I
    .local v7, "inputPtr":I
    aget-byte v0, p3, v0

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, v1

    .line 1541
    .end local v1    # "b24":I
    .local v0, "b24":I
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v9, v7, 0x1

    .end local v7    # "inputPtr":I
    .restart local v9    # "inputPtr":I
    aget-byte v7, p3, v7

    and-int/lit16 v7, v7, 0xff

    or-int v0, v1, v7

    .line 1542
    add-int/lit8 v11, v11, -0x3

    .line 1543
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v0, v1, v7}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[CI)I

    move-result v1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1544
    add-int/lit8 v4, v4, -0x1

    if-gtz v4, :cond_3

    .line 1545
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v8, 0x5c

    aput-char v8, v1, v7

    .line 1546
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v8, 0x6e

    aput-char v8, v1, v7

    .line 1547
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v1

    shr-int/2addr v1, v5

    move v4, v1

    .line 1549
    .end local v0    # "b24":I
    :cond_3
    goto :goto_0

    .line 1552
    :cond_4
    :goto_1
    if-lez v11, :cond_7

    .line 1553
    move-object v6, p0

    move-object v7, p2

    move-object v8, p3

    invoke-direct/range {v6 .. v11}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result v10

    .line 1554
    const/4 v9, 0x0

    .line 1555
    if-lez v10, :cond_7

    .line 1556
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v0, v3, :cond_5

    .line 1557
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1559
    :cond_5
    add-int/lit8 v0, v9, 0x1

    .end local v9    # "inputPtr":I
    .local v0, "inputPtr":I
    aget-byte v1, p3, v9

    shl-int/lit8 v1, v1, 0x10

    .line 1561
    .restart local v1    # "b24":I
    if-ge v0, v10, :cond_6

    .line 1562
    aget-byte v5, p3, v0

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v1, v5

    .line 1563
    const/4 v5, 0x2

    .local v5, "amount":I
    goto :goto_2

    .line 1565
    .end local v5    # "amount":I
    :cond_6
    const/4 v5, 0x1

    .line 1567
    .restart local v5    # "amount":I
    :goto_2
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v1, v5, v7, v8}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[CI)I

    move-result v7

    iput v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1568
    sub-int/2addr v11, v5

    move v9, v0

    .line 1571
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

    .line 1477
    add-int/lit8 v0, p4, -0x3

    .line 1479
    .local v0, "safeInputEnd":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    add-int/lit8 v1, v1, -0x6

    .line 1480
    .local v1, "safeOutputEnd":I
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v2

    const/4 v3, 0x2

    shr-int/2addr v2, v3

    .line 1483
    .local v2, "chunksBeforeLF":I
    :goto_0
    if-gt p3, v0, :cond_2

    .line 1484
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v4, v1, :cond_0

    .line 1485
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1488
    :cond_0
    add-int/lit8 v4, p3, 0x1

    .end local p3    # "inputPtr":I
    .local v4, "inputPtr":I
    aget-byte p3, p2, p3

    shl-int/lit8 p3, p3, 0x8

    .line 1489
    .local p3, "b24":I
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "inputPtr":I
    .local v5, "inputPtr":I
    aget-byte v4, p2, v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr p3, v4

    .line 1490
    shl-int/lit8 v4, p3, 0x8

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "inputPtr":I
    .local v6, "inputPtr":I
    aget-byte v5, p2, v5

    and-int/lit16 v5, v5, 0xff

    or-int p3, v4, v5

    .line 1491
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, p3, v4, v5}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[CI)I

    move-result v4

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1492
    add-int/lit8 v2, v2, -0x1

    if-gtz v2, :cond_1

    .line 1494
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v7, 0x5c

    aput-char v7, v4, v5

    .line 1495
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v7, 0x6e

    aput-char v7, v4, v5

    .line 1496
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v4

    shr-int/lit8 v2, v4, 0x2

    .line 1498
    .end local p3    # "b24":I
    :cond_1
    move p3, v6

    goto :goto_0

    .line 1501
    .end local v6    # "inputPtr":I
    .local p3, "inputPtr":I
    :cond_2
    sub-int v4, p4, p3

    .line 1502
    .local v4, "inputLeft":I
    if-lez v4, :cond_5

    .line 1503
    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v5, v1, :cond_3

    .line 1504
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1506
    :cond_3
    add-int/lit8 v5, p3, 0x1

    .end local p3    # "inputPtr":I
    .restart local v5    # "inputPtr":I
    aget-byte p3, p2, p3

    shl-int/lit8 p3, p3, 0x10

    .line 1507
    .local p3, "b24":I
    if-ne v4, v3, :cond_4

    .line 1508
    add-int/lit8 v3, v5, 0x1

    .end local v5    # "inputPtr":I
    .local v3, "inputPtr":I
    aget-byte v5, p2, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr p3, v5

    goto :goto_1

    .line 1507
    .end local v3    # "inputPtr":I
    .restart local v5    # "inputPtr":I
    :cond_4
    move v3, v5

    .line 1510
    .end local v5    # "inputPtr":I
    .restart local v3    # "inputPtr":I
    :goto_1
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, p3, v4, v5, v6}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[CI)I

    move-result v5

    iput v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    move p3, v3

    .line 1512
    .end local v3    # "inputPtr":I
    .local p3, "inputPtr":I
    :cond_5
    return-void
.end method

.method protected final _writeFieldName(Lcom/fasterxml/jackson/core/SerializableString;Z)V
    .locals 5
    .param p1, "name"    # Lcom/fasterxml/jackson/core/SerializableString;
    .param p2, "commaBefore"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 184
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writePPFieldName(Lcom/fasterxml/jackson/core/SerializableString;Z)V

    .line 186
    return-void

    .line 189
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 190
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 192
    :cond_1
    if-eqz p2, :cond_2

    .line 193
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x2c

    aput-char v2, v0, v1

    .line 196
    :cond_2
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedChars()[C

    move-result-object v0

    .line 197
    .local v0, "quoted":[C
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgUnqNames:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 198
    array-length v1, v0

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw([CII)V

    .line 199
    return-void

    .line 202
    :cond_3
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v4, v1, v3

    .line 204
    array-length v1, v0

    .line 205
    .local v1, "qlen":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v3, v1

    add-int/lit8 v3, v3, 0x1

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v3, v4, :cond_5

    .line 206
    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw([CII)V

    .line 208
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_4

    .line 209
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 211
    :cond_4
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v4, v2, v3

    goto :goto_0

    .line 213
    :cond_5
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {v0, v2, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 214
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 215
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v4, v2, v3

    .line 217
    :goto_0
    return-void
.end method

.method protected final _writeFieldName(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "commaBefore"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_0

    .line 156
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writePPFieldName(Ljava/lang/String;Z)V

    .line 157
    return-void

    .line 160
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 161
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 163
    :cond_1
    if-eqz p2, :cond_2

    .line 164
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x2c

    aput-char v2, v0, v1

    .line 167
    :cond_2
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgUnqNames:Z

    if-eqz v0, :cond_3

    .line 168
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    .line 169
    return-void

    .line 172
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 174
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    .line 176
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_4

    .line 177
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 179
    :cond_4
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 180
    return-void
.end method

.method protected final _writePPFieldName(Lcom/fasterxml/jackson/core/SerializableString;Z)V
    .locals 5
    .param p1, "name"    # Lcom/fasterxml/jackson/core/SerializableString;
    .param p2, "commaBefore"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 337
    if-eqz p2, :cond_0

    .line 338
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeObjectEntrySeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 340
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->beforeObjectEntries(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 343
    :goto_0
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedChars()[C

    move-result-object v0

    .line 344
    .local v0, "quoted":[C
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgUnqNames:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 345
    array-length v1, v0

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw([CII)V

    goto :goto_1

    .line 347
    :cond_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v1, v3, :cond_2

    .line 348
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 350
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v4, v1, v3

    .line 351
    array-length v1, v0

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw([CII)V

    .line 352
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_3

    .line 353
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 355
    :cond_3
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v3, v1, v2

    .line 357
    :goto_1
    return-void
.end method

.method protected final _writePPFieldName(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "commaBefore"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 314
    if-eqz p2, :cond_0

    .line 315
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeObjectEntrySeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 317
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->beforeObjectEntries(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 320
    :goto_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgUnqNames:Z

    if-eqz v0, :cond_1

    .line 321
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    goto :goto_1

    .line 323
    :cond_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_2

    .line 324
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 326
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 327
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    .line 328
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_3

    .line 329
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 331
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 333
    :goto_1
    return-void
.end method

.method public canWriteFormattedNumbers()Z
    .locals 1

    .line 124
    const/4 v0, 0x1

    return v0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 895
    invoke-super {p0}, Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;->close()V

    .line 901
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    if-eqz v0, :cond_1

    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_JSON_CONTENT:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 904
    :goto_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->getOutputContext()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object v0

    .line 905
    .local v0, "ctxt":Lcom/fasterxml/jackson/core/JsonStreamContext;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inArray()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 906
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeEndArray()V

    goto :goto_1

    .line 907
    :cond_0
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inObject()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 908
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeEndObject()V

    .line 912
    .end local v0    # "ctxt":Lcom/fasterxml/jackson/core/JsonStreamContext;
    :goto_1
    goto :goto_0

    .line 914
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 915
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 916
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 924
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    if-eqz v0, :cond_4

    .line 925
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->isResourceManaged()Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_TARGET:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 927
    :cond_2
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->FLUSH_PASSED_TO_STREAM:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 929
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    goto :goto_3

    .line 926
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 933
    :cond_4
    :goto_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_releaseBuffers()V

    .line 934
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 884
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 885
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    if-eqz v0, :cond_0

    .line 886
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->FLUSH_PASSED_TO_STREAM:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 887
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 890
    :cond_0
    return-void
.end method

.method public getOutputBuffered()I
    .locals 2

    .line 118
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v0, v1

    .line 119
    .local v0, "len":I
    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    return v1
.end method

.method public getOutputTarget()Ljava/lang/Object;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

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

    .line 615
    const-string/jumbo v0, "write a binary value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 617
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 618
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 620
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 621
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->allocBase64Buffer()[B

    move-result-object v0

    .line 624
    .local v0, "encodingBuffer":[B
    const/4 v1, 0x0

    if-gez p3, :cond_1

    .line 625
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[B)I

    move-result v1

    .local v1, "bytes":I
    goto :goto_0

    .line 627
    .end local v1    # "bytes":I
    :cond_1
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[BI)I

    move-result v2

    .line 628
    .local v2, "missing":I
    if-lez v2, :cond_2

    .line 629
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

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 631
    :cond_2
    move v1, p3

    .line 634
    .end local v2    # "missing":I
    .restart local v1    # "bytes":I
    :goto_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    .line 635
    nop

    .line 637
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_3

    .line 638
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 640
    :cond_3
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v4, v2, v3

    .line 641
    return v1

    .line 634
    .end local v1    # "bytes":I
    :catchall_0
    move-exception v2

    .restart local v1    # "bytes":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

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

    .line 596
    const-string/jumbo v0, "write a binary value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 598
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 599
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 601
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 602
    add-int v0, p3, p4

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;[BII)V

    .line 604
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 605
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 607
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 608
    return-void
.end method

.method public writeBoolean(Z)V
    .locals 4
    .param p1, "state"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 807
    const-string/jumbo v0, "write a boolean value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 808
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x5

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 809
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 811
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 812
    .local v0, "ptr":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 813
    .local v1, "buf":[C
    const/16 v2, 0x65

    if-eqz p1, :cond_1

    .line 814
    const/16 v3, 0x74

    aput-char v3, v1, v0

    .line 815
    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x72

    aput-char v3, v1, v0

    .line 816
    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x75

    aput-char v3, v1, v0

    .line 817
    add-int/lit8 v0, v0, 0x1

    aput-char v2, v1, v0

    goto :goto_0

    .line 819
    :cond_1
    const/16 v3, 0x66

    aput-char v3, v1, v0

    .line 820
    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x61

    aput-char v3, v1, v0

    .line 821
    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x6c

    aput-char v3, v1, v0

    .line 822
    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x73

    aput-char v3, v1, v0

    .line 823
    add-int/lit8 v0, v0, 0x1

    aput-char v2, v1, v0

    .line 825
    :goto_0
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 826
    return-void
.end method

.method public writeEndArray()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 243
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->inArray()Z

    move-result v0

    if-nez v0, :cond_0

    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current context not Array but "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->typeDesc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 246
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_1

    .line 247
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getEntryCount()I

    move-result v1

    invoke-interface {v0, p0, v1}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeEndArray(Lcom/fasterxml/jackson/core/JsonGenerator;I)V

    goto :goto_0

    .line 249
    :cond_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_2

    .line 250
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 252
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x5d

    aput-char v2, v0, v1

    .line 254
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 255
    return-void
.end method

.method public writeEndObject()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 294
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->inObject()Z

    move-result v0

    if-nez v0, :cond_0

    .line 295
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current context not Object but "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->typeDesc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_1

    .line 298
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getEntryCount()I

    move-result v1

    invoke-interface {v0, p0, v1}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeEndObject(Lcom/fasterxml/jackson/core/JsonGenerator;I)V

    goto :goto_0

    .line 300
    :cond_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_2

    .line 301
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 303
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x7d

    aput-char v2, v0, v1

    .line 305
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 306
    return-void
.end method

.method public writeFieldName(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 2
    .param p1, "name"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeFieldName(Ljava/lang/String;)I

    move-result v0

    .line 147
    .local v0, "status":I
    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 148
    const-string v1, "Can not write a field name, expecting a value"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 150
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeFieldName(Lcom/fasterxml/jackson/core/SerializableString;Z)V

    .line 151
    return-void
.end method

.method public writeFieldName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeFieldName(Ljava/lang/String;)I

    move-result v0

    .line 136
    .local v0, "status":I
    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 137
    const-string v1, "Can not write a field name, expecting a value"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 139
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeFieldName(Ljava/lang/String;Z)V

    .line 140
    return-void
.end method

.method public writeNull()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 830
    const-string/jumbo v0, "write a null"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 831
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeNull()V

    .line 832
    return-void
.end method

.method public writeNumber(D)V
    .locals 1
    .param p1, "d"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 741
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-nez v0, :cond_1

    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 748
    :cond_0
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 749
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 750
    return-void

    .line 744
    :cond_1
    :goto_0
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeString(Ljava/lang/String;)V

    .line 745
    return-void
.end method

.method public writeNumber(F)V
    .locals 1
    .param p1, "f"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 755
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-nez v0, :cond_1

    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 762
    :cond_0
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 763
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 764
    return-void

    .line 758
    :cond_1
    :goto_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeString(Ljava/lang/String;)V

    .line 759
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

    .line 677
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 678
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_0

    .line 679
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedInt(I)V

    .line 680
    return-void

    .line 683
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0xb

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 684
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 686
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 687
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

    .line 701
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 702
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_0

    .line 703
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedLong(J)V

    .line 704
    return-void

    .line 706
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x15

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 708
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 710
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputLong(J[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 711
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

    .line 783
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 784
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_0

    .line 785
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedRaw(Ljava/lang/String;)V

    goto :goto_0

    .line 787
    :cond_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 789
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

    .line 770
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 771
    if-nez p1, :cond_0

    .line 772
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeNull()V

    goto :goto_0

    .line 773
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_1

    .line 774
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_asString(Ljava/math/BigDecimal;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedRaw(Ljava/lang/String;)V

    goto :goto_0

    .line 776
    :cond_1
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_asString(Ljava/math/BigDecimal;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 778
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

    .line 727
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 728
    if-nez p1, :cond_0

    .line 729
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeNull()V

    goto :goto_0

    .line 730
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_1

    .line 731
    invoke-virtual {p1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedRaw(Ljava/lang/String;)V

    goto :goto_0

    .line 733
    :cond_1
    invoke-virtual {p1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 735
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

    .line 653
    const-string/jumbo v0, "write a number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 654
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_0

    .line 655
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedShort(S)V

    .line 656
    return-void

    .line 659
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x6

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 660
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 662
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 663
    return-void
.end method

.method public writeRaw(C)V
    .locals 3
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 555
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 556
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 558
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char p1, v0, v1

    .line 559
    return-void
.end method

.method public writeRaw(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 1
    .param p1, "text"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 531
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 532
    return-void
.end method

.method public writeRaw(Ljava/lang/String;)V
    .locals 5
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 493
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 494
    .local v0, "len":I
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v1, v2

    .line 496
    .local v1, "room":I
    if-nez v1, :cond_0

    .line 497
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 498
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int v1, v2, v3

    .line 501
    :cond_0
    if-lt v1, v0, :cond_1

    .line 502
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/4 v4, 0x0

    invoke-virtual {p1, v4, v0, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 503
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_0

    .line 505
    :cond_1
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRawLong(Ljava/lang/String;)V

    .line 507
    :goto_0
    return-void
.end method

.method public writeRaw(Ljava/lang/String;II)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 513
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v1

    .line 515
    .local v0, "room":I
    if-ge v0, p3, :cond_0

    .line 516
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 517
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int v0, v1, v2

    .line 520
    :cond_0
    if-lt v0, p3, :cond_1

    .line 521
    add-int v1, p2, p3

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, p2, v1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 522
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v1, p3

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_0

    .line 524
    :cond_1
    add-int v1, p2, p3

    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRawLong(Ljava/lang/String;)V

    .line 526
    :goto_0
    return-void
.end method

.method public writeRaw([CII)V
    .locals 3
    .param p1, "text"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 538
    const/16 v0, 0x20

    if-ge p3, v0, :cond_1

    .line 539
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v1

    .line 540
    .local v0, "room":I
    if-le p3, v0, :cond_0

    .line 541
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 543
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 544
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v1, p3

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 545
    return-void

    .line 548
    .end local v0    # "room":I
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 549
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    .line 550
    return-void
.end method

.method public writeRawUTF8String([BII)V
    .locals 0
    .param p1, "text"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 474
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportUnsupportedOperation()V

    .line 475
    return-void
.end method

.method public writeStartArray()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 228
    const-string/jumbo v0, "start an array"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 229
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->createChildArrayContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 230
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeStartArray(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 233
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 234
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 236
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x5b

    aput-char v2, v0, v1

    .line 238
    :goto_0
    return-void
.end method

.method public writeStartObject()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 279
    const-string/jumbo v0, "start an object"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->createChildObjectContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 281
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeStartObject(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 284
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 285
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 287
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x7b

    aput-char v2, v0, v1

    .line 289
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

    .line 260
    const-string/jumbo v0, "start an object"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 261
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->createChildObjectContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    .line 262
    .local v0, "ctxt":Lcom/fasterxml/jackson/core/json/JsonWriteContext;
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 263
    if-eqz p1, :cond_0

    .line 264
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->setCurrentValue(Ljava/lang/Object;)V

    .line 266
    :cond_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v1, :cond_1

    .line 267
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v1, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeStartObject(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_0

    .line 269
    :cond_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_2

    .line 270
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 272
    :cond_2
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v3, 0x7b

    aput-char v3, v1, v2

    .line 274
    :goto_0
    return-void
.end method

.method public writeString(Lcom/fasterxml/jackson/core/SerializableString;)V
    .locals 6
    .param p1, "sstr"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 444
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 445
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 446
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 448
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 450
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedChars()[C

    move-result-object v0

    .line 451
    .local v0, "text":[C
    array-length v1, v0

    .line 453
    .local v1, "len":I
    const/16 v2, 0x20

    const/4 v3, 0x0

    if-ge v1, v2, :cond_2

    .line 454
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v2, v4

    .line 455
    .local v2, "room":I
    if-le v1, v2, :cond_1

    .line 456
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 458
    :cond_1
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {v0, v3, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 459
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 460
    .end local v2    # "room":I
    goto :goto_0

    .line 462
    :cond_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 463
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/Writer;->write([CII)V

    .line 465
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_3

    .line 466
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 468
    :cond_3
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v4, v2, v3

    .line 469
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

    .line 387
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 388
    if-nez p1, :cond_0

    .line 389
    const-string v0, "null reader"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 391
    :cond_0
    if-ltz p2, :cond_1

    move v0, p2

    goto :goto_0

    :cond_1
    const v0, 0x7fffffff

    .line 392
    .local v0, "toRead":I
    :goto_0
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateCopyBuffer()[C

    move-result-object v1

    .line 394
    .local v1, "buf":[C
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, p2

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_2

    .line 395
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 397
    :cond_2
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v4, v2, v3

    .line 400
    :goto_1
    if-lez v0, :cond_5

    .line 401
    array-length v2, v1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 402
    .local v2, "toReadNow":I
    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3, v2}, Ljava/io/Reader;->read([CII)I

    move-result v4

    .line 403
    .local v4, "numRead":I
    if-gtz v4, :cond_3

    .line 404
    goto :goto_2

    .line 406
    :cond_3
    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v5, p2

    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v5, v6, :cond_4

    .line 407
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 409
    :cond_4
    invoke-direct {p0, v1, v3, v4}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString([CII)V

    .line 412
    sub-int/2addr v0, v4

    .line 413
    .end local v2    # "toReadNow":I
    .end local v4    # "numRead":I
    goto :goto_1

    .line 415
    :cond_5
    :goto_2
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, p2

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_6

    .line 416
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 418
    :cond_6
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v4, v2, v3

    .line 420
    if-lez v0, :cond_7

    if-ltz p2, :cond_7

    .line 421
    const-string v2, "Didn\'t read enough from reader"

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 423
    :cond_7
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 368
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 369
    if-nez p1, :cond_0

    .line 370
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeNull()V

    .line 371
    return-void

    .line 373
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 374
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 376
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 377
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    .line 379
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_2

    .line 380
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 382
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 383
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

    .line 428
    const-string/jumbo v0, "write a string"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 429
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_0

    .line 430
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 432
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 433
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString([CII)V

    .line 435
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1

    .line 436
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 438
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget-char v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_quoteChar:C

    aput-char v2, v0, v1

    .line 439
    return-void
.end method

.method public writeUTF8String([BII)V
    .locals 0
    .param p1, "text"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 480
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportUnsupportedOperation()V

    .line 481
    return-void
.end method
