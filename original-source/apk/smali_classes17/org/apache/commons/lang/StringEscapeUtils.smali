.class public Lorg/apache/commons/lang/StringEscapeUtils;
.super Ljava/lang/Object;
.source "StringEscapeUtils.java"


# static fields
.field private static final CSV_DELIMITER:C = ','

.field private static final CSV_QUOTE:C = '\"'

.field private static final CSV_QUOTE_STR:Ljava/lang/String;

.field private static final CSV_SEARCH_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const/16 v0, 0x22

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_QUOTE_STR:Ljava/lang/String;

    .line 46
    const/4 v0, 0x4

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_SEARCH_CHARS:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x2cs
        0x22s
        0xds
        0xas
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method public static escapeCsv(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .line 721
    sget-object v0, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_SEARCH_CHARS:[C

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->containsNone(Ljava/lang/String;[C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 722
    return-object p0

    .line 725
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 726
    .local v0, "writer":Ljava/io/StringWriter;
    invoke-static {v0, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeCsv(Ljava/io/Writer;Ljava/lang/String;)V

    .line 727
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 728
    .end local v0    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v0

    .line 730
    .local v0, "ioe":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 731
    const/4 v1, 0x0

    return-object v1
.end method

.method public static escapeCsv(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 3
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 759
    sget-object v0, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_SEARCH_CHARS:[C

    invoke-static {p1, v0}, Lorg/apache/commons/lang/StringUtils;->containsNone(Ljava/lang/String;[C)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 760
    if-eqz p1, :cond_0

    .line 761
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 763
    :cond_0
    return-void

    .line 765
    :cond_1
    const/16 v0, 0x22

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 766
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 767
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 768
    .local v2, "c":C
    if-ne v2, v0, :cond_2

    .line 769
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 771
    :cond_2
    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(I)V

    .line 766
    .end local v2    # "c":C
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 773
    .end local v1    # "i":I
    :cond_3
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 774
    return-void
.end method

.method public static escapeHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;

    .line 451
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 452
    return-object v0

    .line 455
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 456
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeHtml(Ljava/io/Writer;Ljava/lang/String;)V

    .line 457
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 458
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v1

    .line 461
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 462
    return-object v0
.end method

.method public static escapeHtml(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 496
    if-eqz p0, :cond_1

    .line 499
    if-nez p1, :cond_0

    .line 500
    return-void

    .line 502
    :cond_0
    sget-object v0, Lorg/apache/commons/lang/Entities;->HTML40:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/Entities;->escape(Ljava/io/Writer;Ljava/lang/String;)V

    .line 503
    return-void

    .line 497
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Writer must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static escapeJava(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 86
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJava(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 1
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/io/Writer;Ljava/lang/String;Z)V

    .line 103
    return-void
.end method

.method public static escapeJavaScript(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 127
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJavaScript(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 1
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/io/Writer;Ljava/lang/String;Z)V

    .line 144
    return-void
.end method

.method private static escapeJavaStyleString(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "escapeSingleQuotes"    # Z

    .line 154
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 155
    return-object v0

    .line 158
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 159
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0, p1}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJavaStyleString(Ljava/io/Writer;Ljava/lang/String;Z)V

    .line 160
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 161
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v1

    .line 163
    .local v1, "ioe":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 164
    return-object v0
.end method

.method private static escapeJavaStyleString(Ljava/io/Writer;Ljava/lang/String;Z)V
    .locals 6
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "escapeSingleQuote"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    if-eqz p0, :cond_8

    .line 180
    if-nez p1, :cond_0

    .line 181
    return-void

    .line 184
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 185
    .local v0, "sz":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_7

    .line 186
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 189
    .local v2, "ch":C
    const/16 v3, 0xfff

    if-le v2, v3, :cond_1

    .line 190
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\\u"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v2}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 191
    :cond_1
    const/16 v3, 0xff

    if-le v2, v3, :cond_2

    .line 192
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\\u0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v2}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 193
    :cond_2
    const/16 v3, 0x7f

    const-string v4, "\\u00"

    if-le v2, v3, :cond_3

    .line 194
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v2}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 195
    :cond_3
    const/16 v3, 0x20

    const/16 v5, 0x5c

    if-ge v2, v3, :cond_5

    .line 196
    packed-switch v2, :pswitch_data_0

    .line 218
    :pswitch_0
    const/16 v3, 0xf

    if-le v2, v3, :cond_4

    .line 219
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v2}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 214
    :pswitch_1
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 215
    const/16 v3, 0x72

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 216
    goto/16 :goto_1

    .line 210
    :pswitch_2
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 211
    const/16 v3, 0x66

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 212
    goto :goto_1

    .line 202
    :pswitch_3
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 203
    const/16 v3, 0x6e

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 204
    goto :goto_1

    .line 206
    :pswitch_4
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 207
    const/16 v3, 0x74

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 208
    goto :goto_1

    .line 198
    :pswitch_5
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 199
    const/16 v3, 0x62

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 200
    goto :goto_1

    .line 221
    :cond_4
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\\u000"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v2}, Lorg/apache/commons/lang/StringEscapeUtils;->hex(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 223
    goto :goto_1

    .line 226
    :cond_5
    sparse-switch v2, :sswitch_data_0

    .line 246
    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 238
    :sswitch_0
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 239
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 240
    goto :goto_1

    .line 242
    :sswitch_1
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 243
    const/16 v3, 0x2f

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 244
    goto :goto_1

    .line 228
    :sswitch_2
    if-eqz p2, :cond_6

    .line 229
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 231
    :cond_6
    const/16 v3, 0x27

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 232
    goto :goto_1

    .line 234
    :sswitch_3
    invoke-virtual {p0, v5}, Ljava/io/Writer;->write(I)V

    .line 235
    const/16 v3, 0x22

    invoke-virtual {p0, v3}, Ljava/io/Writer;->write(I)V

    .line 236
    nop

    .line 185
    .end local v2    # "ch":C
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 251
    .end local v1    # "i":I
    :cond_7
    return-void

    .line 178
    .end local v0    # "sz":I
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Writer must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_3
        0x27 -> :sswitch_2
        0x2f -> :sswitch_1
        0x5c -> :sswitch_0
    .end sparse-switch
.end method

.method public static escapeSql(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .line 690
    if-nez p0, :cond_0

    .line 691
    const/4 v0, 0x0

    return-object v0

    .line 693
    :cond_0
    const-string v0, "\'"

    const-string v1, "\'\'"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeXml(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 614
    if-nez p0, :cond_0

    .line 615
    const/4 v0, 0x0

    return-object v0

    .line 617
    :cond_0
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/Entities;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeXml(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 587
    if-eqz p0, :cond_1

    .line 590
    if-nez p1, :cond_0

    .line 591
    return-void

    .line 593
    :cond_0
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/Entities;->escape(Ljava/io/Writer;Ljava/lang/String;)V

    .line 594
    return-void

    .line 588
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Writer must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static hex(C)Ljava/lang/String;
    .locals 1
    .param p0, "ch"    # C

    .line 261
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeCsv(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .line 799
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 800
    return-object v0

    .line 803
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 804
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeCsv(Ljava/io/Writer;Ljava/lang/String;)V

    .line 805
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 806
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v1

    .line 808
    .local v1, "ioe":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 809
    return-object v0
.end method

.method public static unescapeCsv(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 3
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 837
    if-nez p1, :cond_0

    .line 838
    return-void

    .line 840
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    .line 841
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 842
    return-void

    .line 844
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x22

    if-ne v0, v1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v1, :cond_2

    goto :goto_0

    .line 850
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 852
    .local v0, "quoteless":Ljava/lang/String;
    sget-object v1, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_SEARCH_CHARS:[C

    invoke-static {v0, v1}, Lorg/apache/commons/lang/StringUtils;->containsAny(Ljava/lang/String;[C)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 854
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_QUOTE_STR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_QUOTE_STR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/lang/StringEscapeUtils;->CSV_QUOTE_STR:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lorg/apache/commons/lang/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 857
    :cond_3
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 858
    return-void

    .line 845
    .end local v0    # "quoteless":Ljava/lang/String;
    :cond_4
    :goto_0
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 846
    return-void
.end method

.method public static unescapeHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;

    .line 523
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 524
    return-object v0

    .line 527
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 528
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeHtml(Ljava/io/Writer;Ljava/lang/String;)V

    .line 529
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 530
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v1

    .line 533
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 534
    return-object v0
.end method

.method public static unescapeHtml(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 557
    if-eqz p0, :cond_1

    .line 560
    if-nez p1, :cond_0

    .line 561
    return-void

    .line 563
    :cond_0
    sget-object v0, Lorg/apache/commons/lang/Entities;->HTML40:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/Entities;->unescape(Ljava/io/Writer;Ljava/lang/String;)V

    .line 564
    return-void

    .line 558
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Writer must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static unescapeJava(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .line 274
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 275
    return-object v0

    .line 278
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 279
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {v1, p0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeJava(Ljava/io/Writer;Ljava/lang/String;)V

    .line 280
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 281
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_0
    move-exception v1

    .line 283
    .local v1, "ioe":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 284
    return-object v0
.end method

.method public static unescapeJava(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 10
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 304
    if-eqz p0, :cond_7

    .line 307
    if-nez p1, :cond_0

    .line 308
    return-void

    .line 310
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 311
    .local v0, "sz":I
    new-instance v1, Ljava/lang/StringBuffer;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 312
    .local v1, "unicode":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .line 313
    .local v3, "hadSlash":Z
    const/4 v4, 0x0

    .line 314
    .local v4, "inUnicode":Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/16 v6, 0x5c

    if-ge v5, v0, :cond_5

    .line 315
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 316
    .local v7, "ch":C
    if-eqz v4, :cond_1

    .line 319
    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 320
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    if-ne v6, v2, :cond_4

    .line 324
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/16 v8, 0x10

    invoke-static {v6, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v6

    .line 325
    .local v6, "value":I
    int-to-char v8, v6

    invoke-virtual {p0, v8}, Ljava/io/Writer;->write(I)V

    .line 326
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->setLength(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 327
    const/4 v4, 0x0

    .line 328
    const/4 v3, 0x0

    .line 331
    .end local v6    # "value":I
    goto :goto_1

    .line 329
    :catch_0
    move-exception v2

    .line 330
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    new-instance v6, Lorg/apache/commons/lang/exception/NestableRuntimeException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Unable to parse unicode value: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8, v2}, Lorg/apache/commons/lang/exception/NestableRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 335
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    :cond_1
    if-eqz v3, :cond_2

    .line 337
    const/4 v3, 0x0

    .line 338
    sparse-switch v7, :sswitch_data_0

    .line 370
    invoke-virtual {p0, v7}, Ljava/io/Writer;->write(I)V

    .line 371
    goto :goto_1

    .line 366
    :sswitch_0
    const/4 v4, 0x1

    .line 367
    goto :goto_1

    .line 355
    :sswitch_1
    const/16 v6, 0x9

    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 356
    goto :goto_1

    .line 349
    :sswitch_2
    const/16 v6, 0xd

    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 350
    goto :goto_1

    .line 358
    :sswitch_3
    const/16 v6, 0xa

    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 359
    goto :goto_1

    .line 352
    :sswitch_4
    const/16 v6, 0xc

    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 353
    goto :goto_1

    .line 361
    :sswitch_5
    const/16 v6, 0x8

    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 362
    goto :goto_1

    .line 340
    :sswitch_6
    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 341
    goto :goto_1

    .line 343
    :sswitch_7
    const/16 v6, 0x27

    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 344
    goto :goto_1

    .line 346
    :sswitch_8
    const/16 v6, 0x22

    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 347
    goto :goto_1

    .line 374
    :cond_2
    if-ne v7, v6, :cond_3

    .line 375
    const/4 v3, 0x1

    .line 376
    goto :goto_1

    .line 378
    :cond_3
    invoke-virtual {p0, v7}, Ljava/io/Writer;->write(I)V

    .line 314
    .end local v7    # "ch":C
    :cond_4
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 380
    .end local v5    # "i":I
    :cond_5
    if-eqz v3, :cond_6

    .line 383
    invoke-virtual {p0, v6}, Ljava/io/Writer;->write(I)V

    .line 385
    :cond_6
    return-void

    .line 305
    .end local v0    # "sz":I
    .end local v1    # "unicode":Ljava/lang/StringBuffer;
    .end local v3    # "hadSlash":Z
    .end local v4    # "inUnicode":Z
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Writer must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_8
        0x27 -> :sswitch_7
        0x5c -> :sswitch_6
        0x62 -> :sswitch_5
        0x66 -> :sswitch_4
        0x6e -> :sswitch_3
        0x72 -> :sswitch_2
        0x74 -> :sswitch_1
        0x75 -> :sswitch_0
    .end sparse-switch
.end method

.method public static unescapeJavaScript(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 399
    invoke-static {p0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeJava(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeJavaScript(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 0
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 419
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeJava(Ljava/io/Writer;Ljava/lang/String;)V

    .line 420
    return-void
.end method

.method public static unescapeXml(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 664
    if-nez p0, :cond_0

    .line 665
    const/4 v0, 0x0

    return-object v0

    .line 667
    :cond_0
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/Entities;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeXml(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 639
    if-eqz p0, :cond_1

    .line 642
    if-nez p1, :cond_0

    .line 643
    return-void

    .line 645
    :cond_0
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/Entities;->unescape(Ljava/io/Writer;Ljava/lang/String;)V

    .line 646
    return-void

    .line 640
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Writer must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
