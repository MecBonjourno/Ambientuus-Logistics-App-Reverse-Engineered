.class public Lcom/fasterxml/jackson/core/io/SerializedString;
.super Ljava/lang/Object;
.source "SerializedString.java"

# interfaces
.implements Lcom/fasterxml/jackson/core/SerializableString;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected transient _jdkSerializeValue:Ljava/lang/String;

.field protected _quotedChars:[C

.field protected _quotedUTF8Ref:[B

.field protected _unquotedUTF8Ref:[B

.field protected final _value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "v"    # Ljava/lang/String;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    if-eqz p1, :cond_0

    .line 54
    iput-object p1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    .line 55
    return-void

    .line 52
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Null String illegal for SerializedString"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_jdkSerializeValue:Ljava/lang/String;

    .line 73
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 77
    return-void
.end method


# virtual methods
.method public appendQuoted([CI)I
    .locals 4
    .param p1, "buffer"    # [C
    .param p2, "offset"    # I

    .line 159
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedChars:[C

    .line 160
    .local v0, "result":[C
    if-nez v0, :cond_0

    .line 161
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->quoteAsJsonText(Ljava/lang/String;)[C

    move-result-object v0

    .line 162
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedChars:[C

    .line 164
    :cond_0
    array-length v1, v0

    .line 165
    .local v1, "length":I
    add-int v2, p2, v1

    array-length v3, p1

    if-le v2, v3, :cond_1

    .line 166
    const/4 v2, -0x1

    return v2

    .line 168
    :cond_1
    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 169
    return v1
.end method

.method public appendQuotedUTF8([BI)I
    .locals 4
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I

    .line 144
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 145
    .local v0, "result":[B
    if-nez v0, :cond_0

    .line 146
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->quoteAsJsonUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 149
    :cond_0
    array-length v1, v0

    .line 150
    .local v1, "length":I
    add-int v2, p2, v1

    array-length v3, p1

    if-le v2, v3, :cond_1

    .line 151
    const/4 v2, -0x1

    return v2

    .line 153
    :cond_1
    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 154
    return v1
.end method

.method public appendUnquoted([CI)I
    .locals 4
    .param p1, "buffer"    # [C
    .param p2, "offset"    # I

    .line 189
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    .line 190
    .local v0, "str":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 191
    .local v1, "length":I
    add-int v2, p2, v1

    array-length v3, p1

    if-le v2, v3, :cond_0

    .line 192
    const/4 v2, -0x1

    return v2

    .line 194
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, p1, p2}, Ljava/lang/String;->getChars(II[CI)V

    .line 195
    return v1
.end method

.method public appendUnquotedUTF8([BI)I
    .locals 4
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I

    .line 174
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 175
    .local v0, "result":[B
    if-nez v0, :cond_0

    .line 176
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->encodeAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 177
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 179
    :cond_0
    array-length v1, v0

    .line 180
    .local v1, "length":I
    add-int v2, p2, v1

    array-length v3, p1

    if-le v2, v3, :cond_1

    .line 181
    const/4 v2, -0x1

    return v2

    .line 183
    :cond_1
    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 184
    return v1
.end method

.method public final asQuotedChars()[C
    .locals 2

    .line 100
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedChars:[C

    .line 101
    .local v0, "result":[C
    if-nez v0, :cond_0

    .line 102
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->quoteAsJsonText(Ljava/lang/String;)[C

    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedChars:[C

    .line 105
    :cond_0
    return-object v0
.end method

.method public final asQuotedUTF8()[B
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 129
    .local v0, "result":[B
    if-nez v0, :cond_0

    .line 130
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->quoteAsJsonUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 133
    :cond_0
    return-object v0
.end method

.method public final asUnquotedUTF8()[B
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 115
    .local v0, "result":[B
    if-nez v0, :cond_0

    .line 116
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->encodeAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 119
    :cond_0
    return-object v0
.end method

.method public final charLength()I
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .line 267
    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 268
    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 269
    :cond_1
    move-object v0, p1

    check-cast v0, Lcom/fasterxml/jackson/core/io/SerializedString;

    .line 270
    .local v0, "other":Lcom/fasterxml/jackson/core/io/SerializedString;
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    iget-object v2, v0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 268
    .end local v0    # "other":Lcom/fasterxml/jackson/core/io/SerializedString;
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public final getValue()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    return-object v0
.end method

.method public final hashCode()I
    .locals 1

    .line 263
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public putQuotedUTF8(Ljava/nio/ByteBuffer;)I
    .locals 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 224
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 225
    .local v0, "result":[B
    if-nez v0, :cond_0

    .line 226
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->quoteAsJsonUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 227
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 229
    :cond_0
    array-length v1, v0

    .line 230
    .local v1, "length":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-le v1, v2, :cond_1

    .line 231
    const/4 v2, -0x1

    return v2

    .line 233
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 234
    return v1
.end method

.method public putUnquotedUTF8(Ljava/nio/ByteBuffer;)I
    .locals 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .line 239
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 240
    .local v0, "result":[B
    if-nez v0, :cond_0

    .line 241
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->encodeAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 242
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 244
    :cond_0
    array-length v1, v0

    .line 245
    .local v1, "length":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-le v1, v2, :cond_1

    .line 246
    const/4 v2, -0x1

    return v2

    .line 248
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 249
    return v1
.end method

.method protected readResolve()Ljava/lang/Object;
    .locals 2

    .line 80
    new-instance v0, Lcom/fasterxml/jackson/core/io/SerializedString;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_jdkSerializeValue:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/io/SerializedString;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 260
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    return-object v0
.end method

.method public writeQuotedUTF8(Ljava/io/OutputStream;)I
    .locals 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 201
    .local v0, "result":[B
    if-nez v0, :cond_0

    .line 202
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->quoteAsJsonUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 203
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 205
    :cond_0
    array-length v1, v0

    .line 206
    .local v1, "length":I
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 207
    return v1
.end method

.method public writeUnquotedUTF8(Ljava/io/OutputStream;)I
    .locals 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 212
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 213
    .local v0, "result":[B
    if-nez v0, :cond_0

    .line 214
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/BufferRecyclers;->encodeAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 215
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 217
    :cond_0
    array-length v1, v0

    .line 218
    .local v1, "length":I
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 219
    return v1
.end method
