.class public final Lcom/google/api/client/util/DateTime;
.super Ljava/lang/Object;
.source "DateTime.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final GMT:Ljava/util/TimeZone;

.field private static final RFC3339_PATTERN:Ljava/util/regex/Pattern;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final dateOnly:Z

.field private final tzShift:I

.field private final value:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const-string v0, "GMT"

    invoke-static {v0}, Lj$/util/DesugarTimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/util/DateTime;->GMT:Ljava/util/TimeZone;

    .line 44
    const-string v0, "^(\\d{4})-(\\d{2})-(\\d{2})([Tt](\\d{2}):(\\d{2}):(\\d{2})(\\.\\d+)?)?([Zz]|([+-])(\\d{2}):(\\d{2}))?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/api/client/util/DateTime;->RFC3339_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(J)V
    .locals 2
    .param p1, "value"    # J

    .line 86
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/google/api/client/util/DateTime;-><init>(ZJLjava/lang/Integer;)V

    .line 87
    return-void
.end method

.method public constructor <init>(JI)V
    .locals 2
    .param p1, "value"    # J
    .param p3, "tzShift"    # I

    .line 111
    const/4 v0, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/google/api/client/util/DateTime;-><init>(ZJLjava/lang/Integer;)V

    .line 112
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    invoke-static {p1}, Lcom/google/api/client/util/DateTime;->parseRfc3339(Ljava/lang/String;)Lcom/google/api/client/util/DateTime;

    move-result-object v0

    .line 151
    .local v0, "dateTime":Lcom/google/api/client/util/DateTime;
    iget-boolean v1, v0, Lcom/google/api/client/util/DateTime;->dateOnly:Z

    iput-boolean v1, p0, Lcom/google/api/client/util/DateTime;->dateOnly:Z

    .line 152
    iget-wide v1, v0, Lcom/google/api/client/util/DateTime;->value:J

    iput-wide v1, p0, Lcom/google/api/client/util/DateTime;->value:J

    .line 153
    iget v1, v0, Lcom/google/api/client/util/DateTime;->tzShift:I

    iput v1, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    .line 154
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 2
    .param p1, "value"    # Ljava/util/Date;

    .line 100
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/google/api/client/util/DateTime;-><init>(J)V

    .line 101
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 4
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "zone"    # Ljava/util/TimeZone;

    .line 72
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    if-nez p2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p2, v2, v3}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v2

    const v3, 0xea60

    div-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :goto_0
    const/4 v3, 0x0

    invoke-direct {p0, v3, v0, v1, v2}, Lcom/google/api/client/util/DateTime;-><init>(ZJLjava/lang/Integer;)V

    .line 73
    return-void
.end method

.method public constructor <init>(ZJLjava/lang/Integer;)V
    .locals 2
    .param p1, "dateOnly"    # Z
    .param p2, "value"    # J
    .param p4, "tzShift"    # Ljava/lang/Integer;

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-boolean p1, p0, Lcom/google/api/client/util/DateTime;->dateOnly:Z

    .line 125
    iput-wide p2, p0, Lcom/google/api/client/util/DateTime;->value:J

    .line 126
    if-eqz p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    if-nez p4, :cond_1

    .line 127
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    const v1, 0xea60

    div-int/2addr v0, v1

    goto :goto_0

    :cond_1
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    .line 128
    return-void
.end method

.method private static appendInt(Ljava/lang/StringBuilder;II)V
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "num"    # I
    .param p2, "numDigits"    # I

    .line 345
    if-gez p1, :cond_0

    .line 346
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 347
    neg-int p1, p1

    .line 349
    :cond_0
    move v0, p1

    .line 350
    .local v0, "x":I
    :goto_0
    if-lez v0, :cond_1

    .line 351
    div-int/lit8 v0, v0, 0xa

    .line 352
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    .line 354
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p2, :cond_2

    .line 355
    const/16 v2, 0x30

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 354
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 357
    .end local v1    # "i":I
    :cond_2
    if-eqz p1, :cond_3

    .line 358
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 360
    :cond_3
    return-void
.end method

.method public static parseRfc3339(Ljava/lang/String;)Lcom/google/api/client/util/DateTime;
    .locals 24
    .param p0, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 288
    move-object/from16 v0, p0

    sget-object v1, Lcom/google/api/client/util/DateTime;->RFC3339_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 289
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 293
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 294
    .local v5, "year":I
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v6, v3, -0x1

    .line 295
    .local v6, "month":I
    const/4 v3, 0x3

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 296
    .local v7, "day":I
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    move v12, v4

    .line 297
    .local v12, "isTimeGiven":Z
    const/16 v4, 0x9

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    .line 298
    .local v13, "tzShiftRegexGroup":Ljava/lang/String;
    if-eqz v13, :cond_1

    move v4, v2

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    move v14, v4

    .line 299
    .local v14, "isTzShiftGiven":Z
    const/4 v4, 0x0

    .line 300
    .local v4, "hourOfDay":I
    const/4 v8, 0x0

    .line 301
    .local v8, "minute":I
    const/4 v9, 0x0

    .line 302
    .local v9, "second":I
    const/4 v10, 0x0

    .line 303
    .local v10, "milliseconds":I
    const/4 v15, 0x0

    .line 305
    .local v15, "tzShiftInteger":Ljava/lang/Integer;
    if-eqz v14, :cond_3

    if-eqz v12, :cond_2

    goto :goto_2

    .line 306
    :cond_2
    new-instance v2, Ljava/lang/NumberFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid date/time format, cannot specify time zone shift without specifying time: "

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 310
    :cond_3
    :goto_2
    if-eqz v12, :cond_5

    .line 311
    move/from16 v16, v3

    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 312
    const/4 v3, 0x6

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 313
    const/4 v3, 0x7

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 314
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_4

    .line 315
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 317
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x3

    .line 318
    .local v3, "fractionDigits":I
    int-to-float v11, v10

    move/from16 v18, v4

    move/from16 v16, v5

    .end local v4    # "hourOfDay":I
    .end local v5    # "year":I
    .local v16, "year":I
    .local v18, "hourOfDay":I
    float-to-double v4, v11

    move-wide/from16 v19, v4

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    move v11, v6

    move/from16 v21, v7

    .end local v6    # "month":I
    .end local v7    # "day":I
    .local v11, "month":I
    .local v21, "day":I
    int-to-double v6, v3

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    div-double v4, v19, v4

    double-to-int v10, v4

    move v3, v10

    move v10, v9

    move v9, v8

    move/from16 v8, v18

    goto :goto_3

    .line 314
    .end local v3    # "fractionDigits":I
    .end local v11    # "month":I
    .end local v16    # "year":I
    .end local v18    # "hourOfDay":I
    .end local v21    # "day":I
    .restart local v4    # "hourOfDay":I
    .restart local v5    # "year":I
    .restart local v6    # "month":I
    .restart local v7    # "day":I
    :cond_4
    move/from16 v18, v4

    move/from16 v16, v5

    move v11, v6

    move/from16 v21, v7

    .end local v4    # "hourOfDay":I
    .end local v5    # "year":I
    .end local v6    # "month":I
    .end local v7    # "day":I
    .restart local v11    # "month":I
    .restart local v16    # "year":I
    .restart local v18    # "hourOfDay":I
    .restart local v21    # "day":I
    move v3, v10

    move v10, v9

    move v9, v8

    move/from16 v8, v18

    goto :goto_3

    .line 310
    .end local v11    # "month":I
    .end local v16    # "year":I
    .end local v18    # "hourOfDay":I
    .end local v21    # "day":I
    .restart local v4    # "hourOfDay":I
    .restart local v5    # "year":I
    .restart local v6    # "month":I
    .restart local v7    # "day":I
    :cond_5
    move/from16 v16, v5

    move v11, v6

    move/from16 v21, v7

    .end local v5    # "year":I
    .end local v6    # "month":I
    .end local v7    # "day":I
    .restart local v11    # "month":I
    .restart local v16    # "year":I
    .restart local v21    # "day":I
    move v3, v10

    move v10, v9

    move v9, v8

    move v8, v4

    .line 321
    .end local v4    # "hourOfDay":I
    .local v3, "milliseconds":I
    .local v8, "hourOfDay":I
    .local v9, "minute":I
    .local v10, "second":I
    :goto_3
    new-instance v4, Ljava/util/GregorianCalendar;

    sget-object v5, Lcom/google/api/client/util/DateTime;->GMT:Ljava/util/TimeZone;

    invoke-direct {v4, v5}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 322
    .local v4, "dateTime":Ljava/util/Calendar;
    move v6, v11

    move/from16 v5, v16

    move/from16 v7, v21

    .end local v11    # "month":I
    .end local v16    # "year":I
    .end local v21    # "day":I
    .restart local v5    # "year":I
    .restart local v6    # "month":I
    .restart local v7    # "day":I
    invoke-virtual/range {v4 .. v10}, Ljava/util/Calendar;->set(IIIIII)V

    .line 323
    .end local v5    # "year":I
    .end local v7    # "day":I
    .restart local v16    # "year":I
    .restart local v21    # "day":I
    const/16 v5, 0xe

    invoke-virtual {v4, v5, v3}, Ljava/util/Calendar;->set(II)V

    .line 324
    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v18

    .line 326
    .local v18, "value":J
    if-eqz v12, :cond_8

    if-eqz v14, :cond_8

    .line 328
    const/4 v5, 0x0

    invoke-virtual {v13, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v5

    const/16 v7, 0x5a

    if-ne v5, v7, :cond_6

    .line 329
    const/4 v5, 0x0

    move v2, v12

    .local v5, "tzShift":I
    goto :goto_4

    .line 331
    .end local v5    # "tzShift":I
    :cond_6
    const/16 v5, 0xb

    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    mul-int/lit8 v5, v5, 0x3c

    .line 332
    const/16 v7, 0xc

    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    add-int/2addr v5, v7

    .line 333
    .restart local v5    # "tzShift":I
    const/16 v7, 0xa

    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    const/4 v11, 0x0

    invoke-virtual {v7, v11}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v2, 0x2d

    if-ne v7, v2, :cond_7

    .line 334
    neg-int v2, v5

    move v5, v2

    .line 336
    :cond_7
    move v2, v12

    .end local v12    # "isTimeGiven":Z
    .local v2, "isTimeGiven":Z
    int-to-long v11, v5

    const-wide/32 v22, 0xea60

    mul-long v11, v11, v22

    sub-long v18, v18, v11

    .line 338
    :goto_4
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    move-wide/from16 v11, v18

    goto :goto_5

    .line 326
    .end local v2    # "isTimeGiven":Z
    .end local v5    # "tzShift":I
    .restart local v12    # "isTimeGiven":Z
    :cond_8
    move v2, v12

    .line 340
    .end local v12    # "isTimeGiven":Z
    .restart local v2    # "isTimeGiven":Z
    move-wide/from16 v11, v18

    .end local v18    # "value":J
    .local v11, "value":J
    :goto_5
    new-instance v5, Lcom/google/api/client/util/DateTime;

    if-nez v2, :cond_9

    const/4 v7, 0x1

    goto :goto_6

    :cond_9
    const/4 v7, 0x0

    :goto_6
    invoke-direct {v5, v7, v11, v12, v15}, Lcom/google/api/client/util/DateTime;-><init>(ZJLjava/lang/Integer;)V

    return-object v5

    .line 290
    .end local v2    # "isTimeGiven":Z
    .end local v3    # "milliseconds":I
    .end local v4    # "dateTime":Ljava/util/Calendar;
    .end local v6    # "month":I
    .end local v8    # "hourOfDay":I
    .end local v9    # "minute":I
    .end local v10    # "second":I
    .end local v11    # "value":J
    .end local v13    # "tzShiftRegexGroup":Ljava/lang/String;
    .end local v14    # "isTzShiftGiven":Z
    .end local v15    # "tzShiftInteger":Ljava/lang/Integer;
    .end local v16    # "year":I
    .end local v21    # "day":I
    :cond_a
    new-instance v2, Ljava/lang/NumberFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid date/time format: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 250
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 251
    return v0

    .line 253
    :cond_0
    instance-of v1, p1, Lcom/google/api/client/util/DateTime;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 254
    return v2

    .line 256
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/google/api/client/util/DateTime;

    .line 257
    .local v1, "other":Lcom/google/api/client/util/DateTime;
    iget-boolean v3, p0, Lcom/google/api/client/util/DateTime;->dateOnly:Z

    iget-boolean v4, v1, Lcom/google/api/client/util/DateTime;->dateOnly:Z

    if-ne v3, v4, :cond_2

    iget-wide v3, p0, Lcom/google/api/client/util/DateTime;->value:J

    iget-wide v5, v1, Lcom/google/api/client/util/DateTime;->value:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_2

    iget v3, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    iget v4, v1, Lcom/google/api/client/util/DateTime;->tzShift:I

    if-ne v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getTimeZoneShift()I
    .locals 1

    .line 185
    iget v0, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    return v0
.end method

.method public getValue()J
    .locals 2

    .line 167
    iget-wide v0, p0, Lcom/google/api/client/util/DateTime;->value:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 8

    .line 262
    iget-wide v0, p0, Lcom/google/api/client/util/DateTime;->value:J

    iget-boolean v2, p0, Lcom/google/api/client/util/DateTime;->dateOnly:Z

    if-eqz v2, :cond_0

    const-wide/16 v2, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v2, 0x0

    :goto_0
    iget v4, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    int-to-long v4, v4

    const/4 v6, 0x3

    new-array v6, v6, [J

    const/4 v7, 0x0

    aput-wide v0, v6, v7

    const/4 v0, 0x1

    aput-wide v2, v6, v0

    const/4 v0, 0x2

    aput-wide v4, v6, v0

    invoke-static {v6}, Ljava/util/Arrays;->hashCode([J)I

    move-result v0

    return v0
.end method

.method public isDateOnly()Z
    .locals 1

    .line 176
    iget-boolean v0, p0, Lcom/google/api/client/util/DateTime;->dateOnly:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 237
    invoke-virtual {p0}, Lcom/google/api/client/util/DateTime;->toStringRfc3339()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringRfc3339()Ljava/lang/String;
    .locals 9

    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/util/GregorianCalendar;

    sget-object v2, Lcom/google/api/client/util/DateTime;->GMT:Ljava/util/TimeZone;

    invoke-direct {v1, v2}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 192
    .local v1, "dateTime":Ljava/util/Calendar;
    iget-wide v2, p0, Lcom/google/api/client/util/DateTime;->value:J

    iget v4, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    int-to-long v4, v4

    const-wide/32 v6, 0xea60

    mul-long/2addr v4, v6

    add-long/2addr v2, v4

    .line 193
    .local v2, "localTime":J
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 195
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v5

    const/4 v6, 0x4

    invoke-static {v0, v5, v6}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 196
    const/16 v5, 0x2d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 197
    const/4 v6, 0x2

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v7

    add-int/2addr v7, v4

    invoke-static {v0, v7, v6}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 198
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 199
    const/4 v4, 0x5

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v0, v4, v6}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 200
    iget-boolean v4, p0, Lcom/google/api/client/util/DateTime;->dateOnly:Z

    if-nez v4, :cond_3

    .line 202
    const/16 v4, 0x54

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 203
    const/16 v4, 0xb

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v0, v4, v6}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 204
    const/16 v4, 0x3a

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 205
    const/16 v7, 0xc

    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-static {v0, v7, v6}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 206
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 207
    const/16 v7, 0xd

    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-static {v0, v7, v6}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 209
    const/16 v7, 0xe

    invoke-virtual {v1, v7}, Ljava/util/Calendar;->isSet(I)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 210
    const/16 v8, 0x2e

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v7

    const/4 v8, 0x3

    invoke-static {v0, v7, v8}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 214
    :cond_0
    iget v7, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    if-nez v7, :cond_1

    .line 215
    const/16 v4, 0x5a

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 217
    :cond_1
    iget v7, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    .line 218
    .local v7, "absTzShift":I
    iget v8, p0, Lcom/google/api/client/util/DateTime;->tzShift:I

    if-lez v8, :cond_2

    .line 219
    const/16 v5, 0x2b

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 221
    :cond_2
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 222
    neg-int v7, v7

    .line 225
    :goto_0
    div-int/lit8 v5, v7, 0x3c

    .line 226
    .local v5, "tzHours":I
    rem-int/lit8 v8, v7, 0x3c

    .line 227
    .local v8, "tzMinutes":I
    invoke-static {v0, v5, v6}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 228
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 229
    invoke-static {v0, v8, v6}, Lcom/google/api/client/util/DateTime;->appendInt(Ljava/lang/StringBuilder;II)V

    .line 232
    .end local v5    # "tzHours":I
    .end local v7    # "absTzShift":I
    .end local v8    # "tzMinutes":I
    :cond_3
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
