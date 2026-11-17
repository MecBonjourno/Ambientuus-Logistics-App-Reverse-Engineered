.class public Lorg/apache/commons/lang/RandomStringUtils;
.super Ljava/lang/Object;
.source "RandomStringUtils.java"


# static fields
.field private static final RANDOM:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method public static random(I)Ljava/lang/String;
    .locals 1
    .param p0, "count"    # I

    .line 71
    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(IIIZZ)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "letters"    # Z
    .param p4, "numbers"    # Z

    .line 165
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .end local p0    # "count":I
    .end local p1    # "start":I
    .end local p2    # "end":I
    .end local p3    # "letters":Z
    .end local p4    # "numbers":Z
    .local v0, "count":I
    .local v1, "start":I
    .local v2, "end":I
    .local v3, "letters":Z
    .local v4, "numbers":Z
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static random(IIIZZ[C)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "letters"    # Z
    .param p4, "numbers"    # Z
    .param p5, "chars"    # [C

    .line 189
    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .end local p0    # "count":I
    .end local p1    # "start":I
    .end local p2    # "end":I
    .end local p3    # "letters":Z
    .end local p4    # "numbers":Z
    .end local p5    # "chars":[C
    .local v0, "count":I
    .local v1, "start":I
    .local v2, "end":I
    .local v3, "letters":Z
    .local v4, "numbers":Z
    .local v5, "chars":[C
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "letters"    # Z
    .param p4, "numbers"    # Z
    .param p5, "chars"    # [C
    .param p6, "random"    # Ljava/util/Random;

    .line 227
    if-nez p0, :cond_0

    .line 228
    const-string v0, ""

    return-object v0

    .line 229
    :cond_0
    if-ltz p0, :cond_d

    .line 232
    if-nez p1, :cond_1

    if-nez p2, :cond_1

    .line 233
    const/16 p2, 0x7b

    .line 234
    const/16 p1, 0x20

    .line 235
    if-nez p3, :cond_1

    if-nez p4, :cond_1

    .line 236
    const/4 p1, 0x0

    .line 237
    const p2, 0x7fffffff

    .line 241
    :cond_1
    new-array v0, p0, [C

    .line 242
    .local v0, "buffer":[C
    sub-int v1, p2, p1

    .line 244
    .local v1, "gap":I
    :goto_0
    add-int/lit8 v2, p0, -0x1

    .end local p0    # "count":I
    .local v2, "count":I
    if-eqz p0, :cond_c

    .line 246
    if-nez p5, :cond_2

    .line 247
    invoke-virtual {p6, v1}, Ljava/util/Random;->nextInt(I)I

    move-result p0

    add-int/2addr p0, p1

    int-to-char p0, p0

    .local p0, "ch":C
    goto :goto_1

    .line 249
    .end local p0    # "ch":C
    :cond_2
    invoke-virtual {p6, v1}, Ljava/util/Random;->nextInt(I)I

    move-result p0

    add-int/2addr p0, p1

    aget-char p0, p5, p0

    .line 251
    .restart local p0    # "ch":C
    :goto_1
    if-eqz p3, :cond_3

    invoke-static {p0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-nez v3, :cond_5

    :cond_3
    if-eqz p4, :cond_4

    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-nez v3, :cond_5

    :cond_4
    if-nez p3, :cond_b

    if-nez p4, :cond_b

    .line 255
    :cond_5
    const/16 v3, 0x80

    const v4, 0xd800

    const v5, 0xdc00

    if-lt p0, v5, :cond_7

    const v6, 0xdfff

    if-gt p0, v6, :cond_7

    .line 256
    if-nez v2, :cond_6

    .line 257
    add-int/lit8 v2, v2, 0x1

    move p0, v2

    goto :goto_2

    .line 260
    :cond_6
    aput-char p0, v0, v2

    .line 261
    add-int/lit8 v2, v2, -0x1

    .line 262
    invoke-virtual {p6, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    add-int/2addr v3, v4

    int-to-char v3, v3

    aput-char v3, v0, v2

    move p0, v2

    goto :goto_2

    .line 264
    :cond_7
    if-lt p0, v4, :cond_9

    const v4, 0xdb7f

    if-gt p0, v4, :cond_9

    .line 265
    if-nez v2, :cond_8

    .line 266
    add-int/lit8 v2, v2, 0x1

    move p0, v2

    goto :goto_2

    .line 269
    :cond_8
    invoke-virtual {p6, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    add-int/2addr v3, v5

    int-to-char v3, v3

    aput-char v3, v0, v2

    .line 270
    add-int/lit8 v2, v2, -0x1

    .line 271
    aput-char p0, v0, v2

    move p0, v2

    goto :goto_2

    .line 273
    :cond_9
    const v3, 0xdb80

    if-lt p0, v3, :cond_a

    const v3, 0xdbff

    if-gt p0, v3, :cond_a

    .line 275
    add-int/lit8 v2, v2, 0x1

    move p0, v2

    goto :goto_2

    .line 277
    :cond_a
    aput-char p0, v0, v2

    move p0, v2

    goto :goto_2

    .line 280
    :cond_b
    add-int/lit8 v2, v2, 0x1

    move p0, v2

    .end local v2    # "count":I
    .local p0, "count":I
    :goto_2
    goto :goto_0

    .line 283
    .end local p0    # "count":I
    .restart local v2    # "count":I
    :cond_c
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    return-object p0

    .line 230
    .end local v0    # "buffer":[C
    .end local v1    # "gap":I
    .end local v2    # "count":I
    .restart local p0    # "count":I
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Requested random string length "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " is less than 0."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static random(ILjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "chars"    # Ljava/lang/String;

    .line 300
    if-nez p1, :cond_0

    .line 301
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v0, p0

    .end local p0    # "count":I
    .local v0, "count":I
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 303
    .end local v0    # "count":I
    .restart local p0    # "count":I
    :cond_0
    move v0, p0

    .end local p0    # "count":I
    .restart local v0    # "count":I
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    invoke-static {v0, p0}, Lorg/apache/commons/lang/RandomStringUtils;->random(I[C)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static random(IZZ)Ljava/lang/String;
    .locals 1
    .param p0, "count"    # I
    .param p1, "letters"    # Z
    .param p2, "numbers"    # Z

    .line 145
    const/4 v0, 0x0

    invoke-static {p0, v0, v0, p1, p2}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(I[C)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "chars"    # [C

    .line 319
    if-nez p1, :cond_0

    .line 320
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v0, p0

    .end local p0    # "count":I
    .local v0, "count":I
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 322
    .end local v0    # "count":I
    .restart local p0    # "count":I
    :cond_0
    move v0, p0

    .end local p0    # "count":I
    .restart local v0    # "count":I
    array-length v2, p1

    const/4 v4, 0x0

    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object v5, p1

    .end local p1    # "chars":[C
    .local v5, "chars":[C
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static randomAlphabetic(I)Ljava/lang/String;
    .locals 2
    .param p0, "count"    # I

    .line 99
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomAlphanumeric(I)Ljava/lang/String;
    .locals 1
    .param p0, "count"    # I

    .line 113
    const/4 v0, 0x1

    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomAscii(I)Ljava/lang/String;
    .locals 3
    .param p0, "count"    # I

    .line 85
    const/16 v0, 0x7f

    const/4 v1, 0x0

    const/16 v2, 0x20

    invoke-static {p0, v2, v0, v1, v1}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomNumeric(I)Ljava/lang/String;
    .locals 2
    .param p0, "count"    # I

    .line 127
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
