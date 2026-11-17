.class public Lorg/apache/commons/lang/time/DurationFormatUtils;
.super Ljava/lang/Object;
.source "DurationFormatUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    }
.end annotation


# static fields
.field static final H:Ljava/lang/Object;

.field public static final ISO_EXTENDED_FORMAT_PATTERN:Ljava/lang/String; = "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

.field static final M:Ljava/lang/Object;

.field static final S:Ljava/lang/Object;

.field static final d:Ljava/lang/Object;

.field static final m:Ljava/lang/Object;

.field static final s:Ljava/lang/Object;

.field static final y:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 476
    const-string v0, "y"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    .line 477
    const-string v0, "M"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->M:Ljava/lang/Object;

    .line 478
    const-string v0, "d"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    .line 479
    const-string v0, "H"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    .line 480
    const-string v0, "m"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    .line 481
    const-string v0, "s"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    .line 482
    const-string v0, "S"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->S:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method static format([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;IIIIIIIZ)Ljava/lang/String;
    .locals 10
    .param p0, "tokens"    # [Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    .param p1, "years"    # I
    .param p2, "months"    # I
    .param p3, "days"    # I
    .param p4, "hours"    # I
    .param p5, "minutes"    # I
    .param p6, "seconds"    # I
    .param p7, "milliseconds"    # I
    .param p8, "padWithZeros"    # Z

    .line 423
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 424
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 425
    .local v1, "lastOutputSeconds":Z
    array-length v2, p0

    .line 426
    .local v2, "sz":I
    const/4 v3, 0x0

    move v4, v3

    move v3, v1

    move/from16 v1, p7

    .end local p7    # "milliseconds":I
    .local v1, "milliseconds":I
    .local v3, "lastOutputSeconds":Z
    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_11

    .line 427
    aget-object v5, p0, v4

    .line 428
    .local v5, "token":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    invoke-virtual {v5}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->getValue()Ljava/lang/Object;

    move-result-object v6

    .line 429
    .local v6, "value":Ljava/lang/Object;
    invoke-virtual {v5}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->getCount()I

    move-result v7

    .line 430
    .local v7, "count":I
    instance-of v8, v6, Ljava/lang/StringBuffer;

    if-eqz v8, :cond_0

    .line 431
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_2

    .line 433
    :cond_0
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    const/16 v9, 0x30

    if-ne v6, v8, :cond_2

    .line 434
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    if-eqz p8, :cond_1

    invoke-static {v8, v7, v9}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v8

    :cond_1
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 436
    const/4 v3, 0x0

    goto/16 :goto_2

    .line 437
    :cond_2
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->M:Ljava/lang/Object;

    if-ne v6, v8, :cond_4

    .line 438
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    if-eqz p8, :cond_3

    invoke-static {v8, v7, v9}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v8

    :cond_3
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 440
    const/4 v3, 0x0

    goto/16 :goto_2

    .line 441
    :cond_4
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    if-ne v6, v8, :cond_6

    .line 442
    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    if-eqz p8, :cond_5

    invoke-static {v8, v7, v9}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v8

    :cond_5
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 444
    const/4 v3, 0x0

    goto :goto_2

    .line 445
    :cond_6
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    if-ne v6, v8, :cond_8

    .line 446
    invoke-static {p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    if-eqz p8, :cond_7

    invoke-static {v8, v7, v9}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v8

    :cond_7
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 448
    const/4 v3, 0x0

    goto :goto_2

    .line 449
    :cond_8
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    if-ne v6, v8, :cond_a

    .line 450
    invoke-static {p5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    if-eqz p8, :cond_9

    invoke-static {v8, v7, v9}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v8

    :cond_9
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 452
    const/4 v3, 0x0

    goto :goto_2

    .line 453
    :cond_a
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    if-ne v6, v8, :cond_c

    .line 454
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    if-eqz p8, :cond_b

    invoke-static {v8, v7, v9}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v8

    :cond_b
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 456
    const/4 v3, 0x1

    goto :goto_2

    .line 457
    :cond_c
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->S:Ljava/lang/Object;

    if-ne v6, v8, :cond_10

    .line 458
    if-eqz v3, :cond_e

    .line 459
    add-int/lit16 v1, v1, 0x3e8

    .line 460
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    if-eqz p8, :cond_d

    invoke-static {v8, v7, v9}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v8

    .line 463
    .local v8, "str":Ljava/lang/String;
    :cond_d
    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 465
    .end local v8    # "str":Ljava/lang/String;
    :cond_e
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    if-eqz p8, :cond_f

    invoke-static {v8, v7, v9}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v8

    :cond_f
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 469
    :goto_1
    const/4 v3, 0x0

    .line 426
    .end local v5    # "token":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    .end local v6    # "value":Ljava/lang/Object;
    .end local v7    # "count":I
    :cond_10
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 473
    .end local v4    # "i":I
    :cond_11
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static formatDuration(JLjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "durationMillis"    # J
    .param p2, "format"    # Ljava/lang/String;

    .line 111
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDuration(JLjava/lang/String;Z)Ljava/lang/String;
    .locals 10
    .param p0, "durationMillis"    # J
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "padWithZeros"    # Z

    .line 129
    invoke-static {p2}, Lorg/apache/commons/lang/time/DurationFormatUtils;->lexx(Ljava/lang/String;)[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    move-result-object v0

    .line 131
    .local v0, "tokens":[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    const/4 v1, 0x0

    .line 132
    .local v1, "days":I
    const/4 v2, 0x0

    .line 133
    .local v2, "hours":I
    const/4 v3, 0x0

    .line 134
    .local v3, "minutes":I
    const/4 v4, 0x0

    .line 135
    .local v4, "seconds":I
    const/4 v5, 0x0

    .line 137
    .local v5, "milliseconds":I
    sget-object v6, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    invoke-static {v0, v6}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 138
    const-wide/32 v6, 0x5265c00

    div-long v8, p0, v6

    long-to-int v1, v8

    .line 139
    int-to-long v8, v1

    mul-long/2addr v8, v6

    sub-long/2addr p0, v8

    .line 141
    :cond_0
    sget-object v6, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    invoke-static {v0, v6}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 142
    const-wide/32 v6, 0x36ee80

    div-long v8, p0, v6

    long-to-int v2, v8

    .line 143
    int-to-long v8, v2

    mul-long/2addr v8, v6

    sub-long/2addr p0, v8

    .line 145
    :cond_1
    sget-object v6, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    invoke-static {v0, v6}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 146
    const-wide/32 v6, 0xea60

    div-long v8, p0, v6

    long-to-int v3, v8

    .line 147
    int-to-long v8, v3

    mul-long/2addr v8, v6

    sub-long/2addr p0, v8

    .line 149
    :cond_2
    sget-object v6, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    invoke-static {v0, v6}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 150
    const-wide/16 v6, 0x3e8

    div-long v8, p0, v6

    long-to-int v4, v8

    .line 151
    int-to-long v8, v4

    mul-long/2addr v8, v6

    sub-long/2addr p0, v8

    move v6, v4

    goto :goto_0

    .line 149
    :cond_3
    move v6, v4

    .line 153
    .end local v4    # "seconds":I
    .local v6, "seconds":I
    :goto_0
    sget-object v4, Lorg/apache/commons/lang/time/DurationFormatUtils;->S:Ljava/lang/Object;

    invoke-static {v0, v4}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 154
    long-to-int v5, p0

    move v7, v5

    goto :goto_1

    .line 153
    :cond_4
    move v7, v5

    .line 157
    .end local v5    # "milliseconds":I
    .local v7, "milliseconds":I
    :goto_1
    move v5, v3

    move v3, v1

    .end local v1    # "days":I
    .local v3, "days":I
    .local v5, "minutes":I
    const/4 v1, 0x0

    move v4, v2

    .end local v2    # "hours":I
    .local v4, "hours":I
    const/4 v2, 0x0

    move v8, p3

    .end local p3    # "padWithZeros":Z
    .local v8, "padWithZeros":Z
    invoke-static/range {v0 .. v8}, Lorg/apache/commons/lang/time/DurationFormatUtils;->format([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;IIIIIIIZ)Ljava/lang/String;

    move-result-object p3

    return-object p3
.end method

.method public static formatDurationHMS(J)Ljava/lang/String;
    .locals 1
    .param p0, "durationMillis"    # J

    .line 81
    const-string v0, "H:mm:ss.SSS"

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDurationISO(J)Ljava/lang/String;
    .locals 2
    .param p0, "durationMillis"    # J

    .line 96
    const-string v0, "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDurationWords(JZZ)Ljava/lang/String;
    .locals 10
    .param p0, "durationMillis"    # J
    .param p2, "suppressLeadingZeroElements"    # Z
    .param p3, "suppressTrailingZeroElements"    # Z

    .line 179
    const-string v0, "d\' days \'H\' hours \'m\' minutes \'s\' seconds\'"

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, "duration":Ljava/lang/String;
    const-string v1, " 0 minutes"

    const-string v2, " 0 hours"

    const-string v3, " 0 seconds"

    const-string v4, " 0 days"

    const-string v5, " "

    const-string v6, ""

    if-eqz p2, :cond_1

    .line 182
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 183
    invoke-static {v0, v4, v6}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 184
    .local v7, "tmp":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-eq v8, v9, :cond_0

    .line 185
    move-object v0, v7

    .line 186
    invoke-static {v0, v2, v6}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 187
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-eq v8, v9, :cond_0

    .line 188
    move-object v0, v7

    .line 189
    invoke-static {v0, v1, v6}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 190
    move-object v0, v7

    .line 191
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-eq v8, v9, :cond_0

    .line 192
    invoke-static {v7, v3, v6}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 196
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_1

    .line 198
    const/4 v8, 0x1

    invoke-virtual {v0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 201
    .end local v7    # "tmp":Ljava/lang/String;
    :cond_1
    if-eqz p3, :cond_2

    .line 202
    invoke-static {v0, v3, v6}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 203
    .local v3, "tmp":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-eq v7, v8, :cond_2

    .line 204
    move-object v0, v3

    .line 205
    invoke-static {v0, v1, v6}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 206
    .end local v3    # "tmp":Ljava/lang/String;
    .local v1, "tmp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-eq v3, v7, :cond_2

    .line 207
    move-object v0, v1

    .line 208
    invoke-static {v0, v2, v6}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 209
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 210
    invoke-static {v1, v4, v6}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 216
    .end local v1    # "tmp":Ljava/lang/String;
    :cond_2
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 217
    const-string v1, " 1 seconds"

    const-string v2, " 1 second"

    invoke-static {v0, v1, v2}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 218
    const-string v1, " 1 minutes"

    const-string v2, " 1 minute"

    invoke-static {v0, v1, v2}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    const-string v1, " 1 hours"

    const-string v2, " 1 hour"

    invoke-static {v0, v1, v2}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 220
    const-string v1, " 1 days"

    const-string v2, " 1 day"

    invoke-static {v0, v1, v2}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 221
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static formatPeriod(JJLjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J
    .param p4, "format"    # Ljava/lang/String;

    .line 248
    const/4 v5, 0x1

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    move-wide v0, p0

    move-wide v2, p2

    move-object v4, p4

    .end local p0    # "startMillis":J
    .end local p2    # "endMillis":J
    .end local p4    # "format":Ljava/lang/String;
    .local v0, "startMillis":J
    .local v2, "endMillis":J
    .local v4, "format":Ljava/lang/String;
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;
    .locals 20
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J
    .param p4, "format"    # Ljava/lang/String;
    .param p5, "padWithZeros"    # Z
    .param p6, "timezone"    # Ljava/util/TimeZone;

    .line 283
    invoke-static/range {p4 .. p4}, Lorg/apache/commons/lang/time/DurationFormatUtils;->lexx(Ljava/lang/String;)[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    move-result-object v0

    .line 287
    .local v0, "tokens":[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    invoke-static/range {p6 .. p6}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v9

    .line 288
    .local v9, "start":Ljava/util/Calendar;
    new-instance v1, Ljava/util/Date;

    move-wide/from16 v10, p0

    invoke-direct {v1, v10, v11}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 289
    invoke-static/range {p6 .. p6}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v12

    .line 290
    .local v12, "end":Ljava/util/Calendar;
    new-instance v1, Ljava/util/Date;

    move-wide/from16 v13, p2

    invoke-direct {v1, v13, v14}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v12, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 293
    const/16 v1, 0xe

    invoke-virtual {v12, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    sub-int/2addr v2, v1

    .line 294
    .local v2, "milliseconds":I
    const/16 v1, 0xd

    invoke-virtual {v12, v1}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    sub-int/2addr v3, v1

    .line 295
    .local v3, "seconds":I
    const/16 v1, 0xc

    invoke-virtual {v12, v1}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    sub-int/2addr v4, v1

    .line 296
    .local v4, "minutes":I
    const/16 v1, 0xb

    invoke-virtual {v12, v1}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    sub-int/2addr v5, v1

    .line 297
    .local v5, "hours":I
    const/4 v1, 0x5

    invoke-virtual {v12, v1}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v7

    sub-int/2addr v6, v7

    .line 298
    .local v6, "days":I
    const/4 v7, 0x2

    invoke-virtual {v12, v7}, Ljava/util/Calendar;->get(I)I

    move-result v8

    invoke-virtual {v9, v7}, Ljava/util/Calendar;->get(I)I

    move-result v15

    sub-int/2addr v8, v15

    .line 299
    .local v8, "months":I
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Ljava/util/Calendar;->get(I)I

    move-result v16

    invoke-virtual {v9, v15}, Ljava/util/Calendar;->get(I)I

    move-result v17

    sub-int v16, v16, v17

    .line 302
    .local v16, "years":I
    :goto_0
    if-gez v2, :cond_0

    .line 303
    add-int/lit16 v2, v2, 0x3e8

    .line 304
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 306
    :cond_0
    :goto_1
    if-gez v3, :cond_1

    .line 307
    add-int/lit8 v3, v3, 0x3c

    .line 308
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 310
    :cond_1
    :goto_2
    if-gez v4, :cond_2

    .line 311
    add-int/lit8 v4, v4, 0x3c

    .line 312
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    .line 314
    :cond_2
    :goto_3
    if-gez v5, :cond_3

    .line 315
    add-int/lit8 v5, v5, 0x18

    .line 316
    add-int/lit8 v6, v6, -0x1

    goto :goto_3

    .line 319
    :cond_3
    sget-object v7, Lorg/apache/commons/lang/time/DurationFormatUtils;->M:Ljava/lang/Object;

    invoke-static {v0, v7}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 320
    :goto_4
    if-gez v6, :cond_4

    .line 321
    invoke-virtual {v9, v1}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v7

    add-int/2addr v6, v7

    .line 322
    add-int/lit8 v8, v8, -0x1

    .line 323
    const/4 v7, 0x2

    invoke-virtual {v9, v7, v15}, Ljava/util/Calendar;->add(II)V

    goto :goto_4

    .line 326
    :cond_4
    :goto_5
    if-gez v8, :cond_5

    .line 327
    add-int/lit8 v8, v8, 0xc

    .line 328
    add-int/lit8 v16, v16, -0x1

    goto :goto_5

    .line 331
    :cond_5
    sget-object v1, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    if-eqz v16, :cond_7

    .line 332
    :goto_6
    if-eqz v16, :cond_6

    .line 333
    mul-int/lit8 v1, v16, 0xc

    add-int/2addr v8, v1

    .line 334
    const/16 v16, 0x0

    goto :goto_6

    .line 332
    :cond_6
    move/from16 v19, v2

    move v2, v8

    move/from16 v1, v16

    goto/16 :goto_b

    .line 386
    :cond_7
    move/from16 v19, v2

    move v2, v8

    move/from16 v1, v16

    goto/16 :goto_b

    .line 340
    :cond_8
    sget-object v7, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    invoke-static {v0, v7}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d

    .line 341
    invoke-virtual {v12, v15}, Ljava/util/Calendar;->get(I)I

    move-result v7

    .line 342
    .local v7, "target":I
    if-gez v8, :cond_9

    .line 344
    add-int/lit8 v7, v7, -0x1

    .line 347
    :cond_9
    :goto_7
    invoke-virtual {v9, v15}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-eq v1, v7, :cond_c

    .line 348
    const/4 v1, 0x6

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v18

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v19

    sub-int v18, v18, v19

    add-int v6, v6, v18

    .line 351
    instance-of v1, v9, Ljava/util/GregorianCalendar;

    if-eqz v1, :cond_a

    .line 352
    move/from16 v19, v2

    const/4 v1, 0x2

    .end local v2    # "milliseconds":I
    .local v19, "milliseconds":I
    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v2, v15, :cond_b

    const/4 v1, 0x5

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/16 v1, 0x1d

    if-ne v2, v1, :cond_b

    .line 355
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 351
    .end local v19    # "milliseconds":I
    .restart local v2    # "milliseconds":I
    :cond_a
    move/from16 v19, v2

    .line 359
    .end local v2    # "milliseconds":I
    .restart local v19    # "milliseconds":I
    :cond_b
    :goto_8
    invoke-virtual {v9, v15, v15}, Ljava/util/Calendar;->add(II)V

    .line 361
    const/4 v1, 0x6

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/2addr v6, v1

    move/from16 v2, v19

    const/4 v1, 0x5

    goto :goto_7

    .line 364
    .end local v19    # "milliseconds":I
    .restart local v2    # "milliseconds":I
    :cond_c
    move/from16 v19, v2

    .end local v2    # "milliseconds":I
    .restart local v19    # "milliseconds":I
    const/16 v16, 0x0

    goto :goto_9

    .line 340
    .end local v7    # "target":I
    .end local v19    # "milliseconds":I
    .restart local v2    # "milliseconds":I
    :cond_d
    move/from16 v19, v2

    .line 367
    .end local v2    # "milliseconds":I
    .restart local v19    # "milliseconds":I
    :goto_9
    const/4 v1, 0x2

    invoke-virtual {v9, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v12, v1}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-eq v2, v7, :cond_e

    .line 368
    const/4 v2, 0x5

    invoke-virtual {v9, v2}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v7

    add-int/2addr v6, v7

    .line 369
    invoke-virtual {v9, v1, v15}, Ljava/util/Calendar;->add(II)V

    goto :goto_9

    .line 372
    :cond_e
    const/4 v2, 0x5

    const/4 v1, 0x0

    move v8, v1

    .line 374
    :goto_a
    if-gez v6, :cond_f

    .line 375
    invoke-virtual {v9, v2}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v1

    add-int/2addr v6, v1

    .line 376
    add-int/lit8 v8, v8, -0x1

    .line 377
    const/4 v1, 0x2

    invoke-virtual {v9, v1, v15}, Ljava/util/Calendar;->add(II)V

    goto :goto_a

    .line 374
    :cond_f
    move v2, v8

    move/from16 v1, v16

    .line 386
    .end local v8    # "months":I
    .end local v16    # "years":I
    .local v1, "years":I
    .local v2, "months":I
    :goto_b
    sget-object v7, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    invoke-static {v0, v7}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_10

    .line 387
    mul-int/lit8 v7, v6, 0x18

    add-int/2addr v5, v7

    .line 388
    const/4 v6, 0x0

    .line 390
    :cond_10
    sget-object v7, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    invoke-static {v0, v7}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_11

    .line 391
    mul-int/lit8 v7, v5, 0x3c

    add-int/2addr v4, v7

    .line 392
    const/4 v5, 0x0

    .line 394
    :cond_11
    sget-object v7, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    invoke-static {v0, v7}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_12

    .line 395
    mul-int/lit8 v7, v4, 0x3c

    add-int/2addr v3, v7

    .line 396
    const/4 v4, 0x0

    .line 398
    :cond_12
    sget-object v7, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    invoke-static {v0, v7}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_13

    .line 399
    mul-int/lit16 v7, v3, 0x3e8

    add-int v7, v19, v7

    .line 400
    .end local v19    # "milliseconds":I
    .local v7, "milliseconds":I
    const/4 v3, 0x0

    goto :goto_c

    .line 398
    .end local v7    # "milliseconds":I
    .restart local v19    # "milliseconds":I
    :cond_13
    move/from16 v7, v19

    .line 403
    .end local v19    # "milliseconds":I
    .restart local v7    # "milliseconds":I
    :goto_c
    move v8, v6

    move v6, v3

    move v3, v8

    move v8, v5

    move v5, v4

    move v4, v8

    move/from16 v8, p5

    .local v3, "days":I
    .local v4, "hours":I
    .local v5, "minutes":I
    .local v6, "seconds":I
    invoke-static/range {v0 .. v8}, Lorg/apache/commons/lang/time/DurationFormatUtils;->format([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;IIIIIIIZ)Ljava/lang/String;

    move-result-object v15

    return-object v15
.end method

.method public static formatPeriodISO(JJ)Ljava/lang/String;
    .locals 7
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J

    .line 235
    const/4 v5, 0x0

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    const-string v4, "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

    move-wide v0, p0

    move-wide v2, p2

    .end local p0    # "startMillis":J
    .end local p2    # "endMillis":J
    .local v0, "startMillis":J
    .local v2, "endMillis":J
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static lexx(Ljava/lang/String;)[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    .locals 10
    .param p0, "format"    # Ljava/lang/String;

    .line 491
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 492
    .local v0, "array":[C
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 494
    .local v1, "list":Ljava/util/ArrayList;
    const/4 v2, 0x0

    .line 495
    .local v2, "inLiteral":Z
    const/4 v3, 0x0

    .line 496
    .local v3, "buffer":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .line 497
    .local v4, "previous":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    array-length v5, v0

    .line 498
    .local v5, "sz":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v5, :cond_5

    .line 499
    aget-char v7, v0, v6

    .line 500
    .local v7, "ch":C
    if-eqz v2, :cond_0

    const/16 v8, 0x27

    if-eq v7, v8, :cond_0

    .line 501
    invoke-virtual {v3, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 502
    goto :goto_4

    .line 504
    :cond_0
    const/4 v8, 0x0

    .line 505
    .local v8, "value":Ljava/lang/Object;
    sparse-switch v7, :sswitch_data_0

    .line 525
    if-nez v3, :cond_2

    .line 526
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    move-object v3, v9

    .line 527
    new-instance v9, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    invoke-direct {v9, v3}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 517
    :sswitch_0
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    goto :goto_2

    .line 522
    :sswitch_1
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    goto :goto_2

    .line 521
    :sswitch_2
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    goto :goto_2

    .line 519
    :sswitch_3
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    goto :goto_2

    .line 523
    :sswitch_4
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->S:Ljava/lang/Object;

    goto :goto_2

    .line 518
    :sswitch_5
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->M:Ljava/lang/Object;

    goto :goto_2

    .line 520
    :sswitch_6
    sget-object v8, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    goto :goto_2

    .line 508
    :sswitch_7
    if-eqz v2, :cond_1

    .line 509
    const/4 v3, 0x0

    .line 510
    const/4 v2, 0x0

    goto :goto_2

    .line 512
    :cond_1
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    move-object v3, v9

    .line 513
    new-instance v9, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    invoke-direct {v9, v3}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 514
    const/4 v2, 0x1

    .line 516
    goto :goto_2

    .line 529
    :cond_2
    :goto_1
    invoke-virtual {v3, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 532
    :goto_2
    if-eqz v8, :cond_4

    .line 533
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->getValue()Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v8, :cond_3

    .line 534
    invoke-virtual {v4}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->increment()V

    goto :goto_3

    .line 536
    :cond_3
    new-instance v9, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    invoke-direct {v9, v8}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    .line 537
    .local v9, "token":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 538
    move-object v4, v9

    .line 540
    .end local v9    # "token":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    :goto_3
    const/4 v3, 0x0

    .line 498
    .end local v7    # "ch":C
    .end local v8    # "value":Ljava/lang/Object;
    :cond_4
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 543
    .end local v6    # "i":I
    :cond_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    return-object v6

    nop

    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_7
        0x48 -> :sswitch_6
        0x4d -> :sswitch_5
        0x53 -> :sswitch_4
        0x64 -> :sswitch_3
        0x6d -> :sswitch_2
        0x73 -> :sswitch_1
        0x79 -> :sswitch_0
    .end sparse-switch
.end method
