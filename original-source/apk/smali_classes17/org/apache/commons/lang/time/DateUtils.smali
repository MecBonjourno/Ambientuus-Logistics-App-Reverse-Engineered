.class public Lorg/apache/commons/lang/time/DateUtils;
.super Ljava/lang/Object;
.source "DateUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang/time/DateUtils$DateIterator;
    }
.end annotation


# static fields
.field public static final MILLIS_IN_DAY:I = 0x5265c00

.field public static final MILLIS_IN_HOUR:I = 0x36ee80

.field public static final MILLIS_IN_MINUTE:I = 0xea60

.field public static final MILLIS_IN_SECOND:I = 0x3e8

.field public static final MILLIS_PER_DAY:J = 0x5265c00L

.field public static final MILLIS_PER_HOUR:J = 0x36ee80L

.field public static final MILLIS_PER_MINUTE:J = 0xea60L

.field public static final MILLIS_PER_SECOND:J = 0x3e8L

.field public static final RANGE_MONTH_MONDAY:I = 0x6

.field public static final RANGE_MONTH_SUNDAY:I = 0x5

.field public static final RANGE_WEEK_CENTER:I = 0x4

.field public static final RANGE_WEEK_MONDAY:I = 0x2

.field public static final RANGE_WEEK_RELATIVE:I = 0x3

.field public static final RANGE_WEEK_SUNDAY:I = 0x1

.field public static final SEMI_MONTH:I = 0x3e9

.field public static final UTC_TIME_ZONE:Ljava/util/TimeZone;

.field private static final fields:[[I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 59
    const-string v0, "GMT"

    invoke-static {v0}, Lj$/util/DesugarTimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/time/DateUtils;->UTC_TIME_ZONE:Ljava/util/TimeZone;

    .line 87
    const/16 v0, 0x8

    new-array v0, v0, [[I

    const/16 v1, 0xe

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/16 v1, 0xd

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const/16 v1, 0xc

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v4, 0x2

    aput-object v1, v0, v4

    const/16 v1, 0xb

    const/16 v5, 0xa

    filled-new-array {v1, v5}, [I

    move-result-object v1

    const/4 v5, 0x3

    aput-object v1, v0, v5

    const/16 v1, 0x9

    const/4 v5, 0x5

    filled-new-array {v5, v5, v1}, [I

    move-result-object v1

    const/4 v6, 0x4

    aput-object v1, v0, v6

    const/16 v1, 0x3e9

    filled-new-array {v4, v1}, [I

    move-result-object v1

    aput-object v1, v0, v5

    filled-new-array {v3}, [I

    move-result-object v1

    const/4 v3, 0x6

    aput-object v1, v0, v3

    filled-new-array {v2}, [I

    move-result-object v1

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sput-object v0, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    return-void
.end method

.method public static add(Ljava/util/Date;II)Ljava/util/Date;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "calendarField"    # I
    .param p2, "amount"    # I

    .line 413
    if-eqz p0, :cond_0

    .line 416
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 417
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 418
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->add(II)V

    .line 419
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1

    .line 414
    .end local v0    # "c":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static addDays(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 341
    const/4 v0, 0x5

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addHours(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 355
    const/16 v0, 0xb

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addMilliseconds(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 397
    const/16 v0, 0xe

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addMinutes(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 369
    const/16 v0, 0xc

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addMonths(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 313
    const/4 v0, 0x2

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addSeconds(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 383
    const/16 v0, 0xd

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addWeeks(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 327
    const/4 v0, 0x3

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addYears(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 299
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method private static getFragment(Ljava/util/Calendar;II)J
    .locals 8
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I
    .param p2, "unit"    # I

    .line 1484
    if-eqz p0, :cond_0

    .line 1487
    invoke-static {p2}, Lorg/apache/commons/lang/time/DateUtils;->getMillisPerUnit(I)J

    move-result-wide v0

    .line 1488
    .local v0, "millisPerUnit":J
    const-wide/16 v2, 0x0

    .line 1491
    .local v2, "result":J
    const-wide/32 v4, 0x5265c00

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 1496
    :pswitch_0
    const/4 v6, 0x5

    invoke-virtual {p0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v4

    div-long/2addr v6, v0

    add-long/2addr v2, v6

    goto :goto_0

    .line 1493
    :pswitch_1
    const/4 v6, 0x6

    invoke-virtual {p0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v4

    div-long/2addr v6, v0

    add-long/2addr v2, v6

    .line 1494
    nop

    .line 1500
    :goto_0
    packed-switch p1, :pswitch_data_1

    .line 1517
    :pswitch_2
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "The fragment "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " is not supported"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1516
    :pswitch_3
    goto :goto_1

    .line 1508
    :pswitch_4
    const/16 v4, 0xb

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    int-to-long v4, v4

    const-wide/32 v6, 0x36ee80

    mul-long/2addr v4, v6

    div-long/2addr v4, v0

    add-long/2addr v2, v4

    .line 1510
    :pswitch_5
    const/16 v4, 0xc

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    int-to-long v4, v4

    const-wide/32 v6, 0xea60

    mul-long/2addr v4, v6

    div-long/2addr v4, v0

    add-long/2addr v2, v4

    .line 1512
    :pswitch_6
    const/16 v4, 0xd

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    int-to-long v4, v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    div-long/2addr v4, v0

    add-long/2addr v2, v4

    .line 1514
    :pswitch_7
    const/16 v4, 0xe

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    div-long/2addr v4, v0

    add-long/2addr v2, v4

    .line 1515
    nop

    .line 1519
    :goto_1
    return-wide v2

    .line 1485
    .end local v0    # "millisPerUnit":J
    .end local v2    # "result":J
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_3
    .end packed-switch
.end method

.method private static getFragment(Ljava/util/Date;II)J
    .locals 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I
    .param p2, "unit"    # I

    .line 1464
    if-eqz p0, :cond_0

    .line 1467
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1468
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 1469
    invoke-static {v0, p1, p2}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Calendar;II)J

    move-result-wide v1

    return-wide v1

    .line 1465
    .end local v0    # "calendar":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getFragmentInDays(Ljava/util/Calendar;I)J
    .locals 2
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .line 1449
    const/4 v0, 0x6

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Calendar;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInDays(Ljava/util/Date;I)J
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .line 1248
    const/4 v0, 0x6

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Date;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInHours(Ljava/util/Calendar;I)J
    .locals 2
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .line 1407
    const/16 v0, 0xb

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Calendar;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInHours(Ljava/util/Date;I)J
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .line 1208
    const/16 v0, 0xb

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Date;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInMilliseconds(Ljava/util/Calendar;I)J
    .locals 2
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .line 1288
    const/16 v0, 0xe

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Calendar;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInMilliseconds(Ljava/util/Date;I)J
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .line 1088
    const/16 v0, 0xe

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Date;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInMinutes(Ljava/util/Calendar;I)J
    .locals 2
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .line 1367
    const/16 v0, 0xc

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Calendar;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInMinutes(Ljava/util/Date;I)J
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .line 1168
    const/16 v0, 0xc

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Date;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInSeconds(Ljava/util/Calendar;I)J
    .locals 2
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .line 1327
    const/16 v0, 0xd

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Calendar;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInSeconds(Ljava/util/Date;I)J
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .line 1128
    const/16 v0, 0xd

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DateUtils;->getFragment(Ljava/util/Date;II)J

    move-result-wide v0

    return-wide v0
.end method

.method private static getMillisPerUnit(I)J
    .locals 5
    .param p0, "unit"    # I

    .line 1531
    const-wide v0, 0x7fffffffffffffffL

    .line 1532
    .local v0, "result":J
    packed-switch p0, :pswitch_data_0

    .line 1549
    :pswitch_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "The unit "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " cannot be represented is milleseconds"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1547
    :pswitch_1
    const-wide/16 v0, 0x1

    .line 1548
    goto :goto_0

    .line 1544
    :pswitch_2
    const-wide/16 v0, 0x3e8

    .line 1545
    goto :goto_0

    .line 1541
    :pswitch_3
    const-wide/32 v0, 0xea60

    .line 1542
    goto :goto_0

    .line 1538
    :pswitch_4
    const-wide/32 v0, 0x36ee80

    .line 1539
    goto :goto_0

    .line 1535
    :pswitch_5
    const-wide/32 v0, 0x5265c00

    .line 1536
    nop

    .line 1551
    :goto_0
    return-wide v0

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_5
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static isSameDay(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .locals 4
    .param p0, "cal1"    # Ljava/util/Calendar;
    .param p1, "cal2"    # Ljava/util/Calendar;

    .line 180
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 183
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_0

    const/4 v2, 0x6

    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v3, v2, :cond_0

    move v0, v1

    :cond_0
    return v0

    .line 181
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isSameDay(Ljava/util/Date;Ljava/util/Date;)Z
    .locals 3
    .param p0, "date1"    # Ljava/util/Date;
    .param p1, "date2"    # Ljava/util/Date;

    .line 156
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 159
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 160
    .local v0, "cal1":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 161
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 162
    .local v1, "cal2":Ljava/util/Calendar;
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 163
    invoke-static {v0, v1}, Lorg/apache/commons/lang/time/DateUtils;->isSameDay(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v2

    return v2

    .line 157
    .end local v0    # "cal1":Ljava/util/Calendar;
    .end local v1    # "cal2":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isSameInstant(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .locals 4
    .param p0, "cal1"    # Ljava/util/Calendar;
    .param p1, "cal2"    # Ljava/util/Calendar;

    .line 219
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 222
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 220
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isSameInstant(Ljava/util/Date;Ljava/util/Date;)Z
    .locals 4
    .param p0, "date1"    # Ljava/util/Date;
    .param p1, "date2"    # Ljava/util/Date;

    .line 201
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 204
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 202
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isSameLocalTime(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .locals 4
    .param p0, "cal1"    # Ljava/util/Calendar;
    .param p1, "cal2"    # Ljava/util/Calendar;

    .line 239
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 242
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    const/4 v2, 0x0

    if-ne v1, v0, :cond_0

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    if-ne v1, v0, :cond_0

    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    if-ne v1, v0, :cond_0

    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    if-ne v1, v0, :cond_0

    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v1, v3, :cond_0

    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v1, v3, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v1, v3, :cond_0

    move v2, v0

    :cond_0
    return v2

    .line 240
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static iterator(Ljava/lang/Object;I)Ljava/util/Iterator;
    .locals 3
    .param p0, "focus"    # Ljava/lang/Object;
    .param p1, "rangeStyle"    # I

    .line 1042
    if-eqz p0, :cond_2

    .line 1045
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_0

    .line 1046
    move-object v0, p0

    check-cast v0, Ljava/util/Date;

    invoke-static {v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->iterator(Ljava/util/Date;I)Ljava/util/Iterator;

    move-result-object v0

    return-object v0

    .line 1047
    :cond_0
    instance-of v0, p0, Ljava/util/Calendar;

    if-eqz v0, :cond_1

    .line 1048
    move-object v0, p0

    check-cast v0, Ljava/util/Calendar;

    invoke-static {v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->iterator(Ljava/util/Calendar;I)Ljava/util/Iterator;

    move-result-object v0

    return-object v0

    .line 1050
    :cond_1
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Could not iterate based on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1043
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static iterator(Ljava/util/Calendar;I)Ljava/util/Iterator;
    .locals 10
    .param p0, "focus"    # Ljava/util/Calendar;
    .param p1, "rangeStyle"    # I

    .line 951
    if-eqz p0, :cond_7

    .line 954
    const/4 v0, 0x0

    .line 955
    .local v0, "start":Ljava/util/Calendar;
    const/4 v1, 0x0

    .line 956
    .local v1, "end":Ljava/util/Calendar;
    const/4 v2, 0x1

    .line 957
    .local v2, "startCutoff":I
    const/4 v3, 0x7

    .line 958
    .local v3, "endCutoff":I
    const/4 v4, -0x1

    const/4 v5, 0x1

    const/4 v6, 0x5

    const/4 v7, 0x7

    packed-switch p1, :pswitch_data_0

    .line 999
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "The range style "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " is not valid."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 962
    :pswitch_0
    const/4 v8, 0x2

    invoke-static {p0, v8}, Lorg/apache/commons/lang/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    .line 964
    invoke-virtual {v0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v9

    move-object v1, v9

    check-cast v1, Ljava/util/Calendar;

    .line 965
    invoke-virtual {v1, v8, v5}, Ljava/util/Calendar;->add(II)V

    .line 966
    invoke-virtual {v1, v6, v4}, Ljava/util/Calendar;->add(II)V

    .line 968
    const/4 v8, 0x6

    if-ne p1, v8, :cond_0

    .line 969
    const/4 v2, 0x2

    .line 970
    const/4 v3, 0x1

    goto :goto_1

    .line 978
    :pswitch_1
    invoke-static {p0, v6}, Lorg/apache/commons/lang/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    .line 979
    invoke-static {p0, v6}, Lorg/apache/commons/lang/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v1

    .line 980
    packed-switch p1, :pswitch_data_1

    goto :goto_0

    .line 993
    :pswitch_2
    invoke-virtual {p0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v8

    add-int/lit8 v2, v8, -0x3

    .line 994
    invoke-virtual {p0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v8

    add-int/lit8 v3, v8, 0x3

    goto :goto_0

    .line 989
    :pswitch_3
    invoke-virtual {p0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 990
    add-int/lit8 v3, v2, -0x1

    .line 991
    goto :goto_0

    .line 985
    :pswitch_4
    const/4 v2, 0x2

    .line 986
    const/4 v3, 0x1

    .line 987
    goto :goto_0

    .line 983
    :pswitch_5
    nop

    .line 997
    :goto_0
    nop

    .line 1001
    :cond_0
    :goto_1
    if-ge v2, v5, :cond_1

    .line 1002
    add-int/lit8 v2, v2, 0x7

    .line 1004
    :cond_1
    if-le v2, v7, :cond_2

    .line 1005
    add-int/lit8 v2, v2, -0x7

    .line 1007
    :cond_2
    if-ge v3, v5, :cond_3

    .line 1008
    add-int/lit8 v3, v3, 0x7

    .line 1010
    :cond_3
    if-le v3, v7, :cond_4

    .line 1011
    add-int/lit8 v3, v3, -0x7

    .line 1013
    :cond_4
    :goto_2
    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v8

    if-eq v8, v2, :cond_5

    .line 1014
    invoke-virtual {v0, v6, v4}, Ljava/util/Calendar;->add(II)V

    goto :goto_2

    .line 1016
    :cond_5
    :goto_3
    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v4

    if-eq v4, v3, :cond_6

    .line 1017
    invoke-virtual {v1, v6, v5}, Ljava/util/Calendar;->add(II)V

    goto :goto_3

    .line 1019
    :cond_6
    new-instance v4, Lorg/apache/commons/lang/time/DateUtils$DateIterator;

    invoke-direct {v4, v0, v1}, Lorg/apache/commons/lang/time/DateUtils$DateIterator;-><init>(Ljava/util/Calendar;Ljava/util/Calendar;)V

    return-object v4

    .line 952
    .end local v0    # "start":Ljava/util/Calendar;
    .end local v1    # "end":Ljava/util/Calendar;
    .end local v2    # "startCutoff":I
    .end local v3    # "endCutoff":I
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public static iterator(Ljava/util/Date;I)Ljava/util/Iterator;
    .locals 2
    .param p0, "focus"    # Ljava/util/Date;
    .param p1, "rangeStyle"    # I

    .line 918
    if-eqz p0, :cond_0

    .line 921
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 922
    .local v0, "gval":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 923
    invoke-static {v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->iterator(Ljava/util/Calendar;I)Ljava/util/Iterator;

    move-result-object v1

    return-object v1

    .line 919
    .end local v0    # "gval":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static modify(Ljava/util/Calendar;IZ)V
    .locals 21
    .param p0, "val"    # Ljava/util/Calendar;
    .param p1, "field"    # I
    .param p2, "round"    # Z

    .line 767
    move-object/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const v4, 0x10b07600

    if-gt v3, v4, :cond_19

    .line 771
    const/16 v3, 0xe

    if-ne v1, v3, :cond_0

    .line 772
    return-void

    .line 781
    :cond_0
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v4

    .line 782
    .local v4, "date":Ljava/util/Date;
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    .line 783
    .local v5, "time":J
    const/4 v7, 0x0

    .line 786
    .local v7, "done":Z
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 787
    .local v3, "millisecs":I
    if-eqz p2, :cond_1

    const/16 v8, 0x1f4

    if-ge v3, v8, :cond_2

    .line 788
    :cond_1
    int-to-long v8, v3

    sub-long/2addr v5, v8

    .line 790
    :cond_2
    const/16 v8, 0xd

    if-ne v1, v8, :cond_3

    .line 791
    const/4 v7, 0x1

    .line 795
    :cond_3
    invoke-virtual {v0, v8}, Ljava/util/Calendar;->get(I)I

    move-result v8

    .line 796
    .local v8, "seconds":I
    const/16 v9, 0x1e

    if-nez v7, :cond_5

    if-eqz p2, :cond_4

    if-ge v8, v9, :cond_5

    .line 797
    :cond_4
    int-to-long v10, v8

    const-wide/16 v12, 0x3e8

    mul-long/2addr v10, v12

    sub-long/2addr v5, v10

    .line 799
    :cond_5
    const/16 v10, 0xc

    if-ne v1, v10, :cond_6

    .line 800
    const/4 v7, 0x1

    .line 804
    :cond_6
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v11

    .line 805
    .local v11, "minutes":I
    if-nez v7, :cond_8

    if-eqz p2, :cond_7

    if-ge v11, v9, :cond_8

    .line 806
    :cond_7
    int-to-long v12, v11

    const-wide/32 v14, 0xea60

    mul-long/2addr v12, v14

    sub-long/2addr v5, v12

    .line 810
    :cond_8
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    cmp-long v9, v12, v5

    if-eqz v9, :cond_9

    .line 811
    invoke-virtual {v4, v5, v6}, Ljava/util/Date;->setTime(J)V

    .line 812
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 816
    :cond_9
    const/4 v9, 0x0

    .line 817
    .local v9, "roundUp":Z
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    sget-object v13, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    array-length v13, v13

    if-ge v12, v13, :cond_18

    .line 818
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_1
    sget-object v14, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v14, v14, v12

    array-length v14, v14

    const/16 v15, 0xf

    const/4 v10, 0x5

    const/16 v18, 0x0

    if-ge v13, v14, :cond_e

    .line 819
    sget-object v14, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v14, v14, v12

    aget v14, v14, v13

    if-ne v14, v1, :cond_d

    .line 821
    if-eqz p2, :cond_c

    if-eqz v9, :cond_c

    .line 822
    const/16 v14, 0x3e9

    if-ne v1, v14, :cond_b

    .line 826
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v14

    if-ne v14, v2, :cond_a

    .line 827
    invoke-virtual {v0, v10, v15}, Ljava/util/Calendar;->add(II)V

    goto :goto_2

    .line 829
    :cond_a
    const/16 v14, -0xf

    invoke-virtual {v0, v10, v14}, Ljava/util/Calendar;->add(II)V

    .line 830
    const/4 v10, 0x2

    invoke-virtual {v0, v10, v2}, Ljava/util/Calendar;->add(II)V

    goto :goto_2

    .line 835
    :cond_b
    sget-object v10, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v10, v10, v12

    aget v10, v10, v18

    invoke-virtual {v0, v10, v2}, Ljava/util/Calendar;->add(II)V

    .line 838
    :cond_c
    :goto_2
    return-void

    .line 818
    :cond_d
    add-int/lit8 v13, v13, 0x1

    const/16 v10, 0xc

    goto :goto_1

    .line 842
    .end local v13    # "j":I
    :cond_e
    const/4 v13, 0x0

    .line 843
    .local v13, "offset":I
    const/4 v14, 0x0

    .line 845
    .local v14, "offsetSet":Z
    sparse-switch v1, :sswitch_data_0

    move/from16 v20, v2

    const/16 v10, 0xc

    goto :goto_7

    .line 847
    :sswitch_0
    sget-object v19, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v19, v19, v12

    move/from16 v20, v2

    aget v2, v19, v18

    if-ne v2, v10, :cond_11

    .line 851
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 854
    .end local v13    # "offset":I
    .local v2, "offset":I
    if-lt v2, v15, :cond_f

    .line 855
    add-int/lit8 v2, v2, -0xf

    move v13, v2

    goto :goto_3

    .line 854
    :cond_f
    move v13, v2

    .line 858
    .end local v2    # "offset":I
    .restart local v13    # "offset":I
    :goto_3
    const/4 v2, 0x7

    if-le v13, v2, :cond_10

    move/from16 v2, v20

    goto :goto_4

    :cond_10
    move/from16 v2, v18

    :goto_4
    move v9, v2

    .line 859
    const/4 v14, 0x1

    const/16 v10, 0xc

    goto :goto_7

    .line 847
    :cond_11
    const/16 v10, 0xc

    goto :goto_7

    .line 863
    :sswitch_1
    move/from16 v20, v2

    sget-object v2, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v2, v2, v12

    aget v2, v2, v18

    const/16 v10, 0xb

    if-ne v2, v10, :cond_14

    .line 866
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 867
    .end local v13    # "offset":I
    .restart local v2    # "offset":I
    const/16 v10, 0xc

    if-lt v2, v10, :cond_12

    .line 868
    add-int/lit8 v2, v2, -0xc

    move v13, v2

    goto :goto_5

    .line 867
    :cond_12
    move v13, v2

    .line 870
    .end local v2    # "offset":I
    .restart local v13    # "offset":I
    :goto_5
    const/4 v2, 0x6

    if-le v13, v2, :cond_13

    move/from16 v2, v20

    goto :goto_6

    :cond_13
    move/from16 v2, v18

    :goto_6
    move v9, v2

    .line 871
    const/4 v14, 0x1

    goto :goto_7

    .line 863
    :cond_14
    const/16 v10, 0xc

    .line 875
    :goto_7
    if-nez v14, :cond_16

    .line 876
    sget-object v2, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v2, v2, v12

    aget v2, v2, v18

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->getActualMinimum(I)I

    move-result v2

    .line 877
    .local v2, "min":I
    sget-object v15, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v15, v15, v12

    aget v15, v15, v18

    invoke-virtual {v0, v15}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v15

    .line 879
    .local v15, "max":I
    sget-object v16, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v16, v16, v12

    aget v10, v16, v18

    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    sub-int v13, v10, v2

    .line 881
    sub-int v10, v15, v2

    const/16 v17, 0x2

    div-int/lit8 v10, v10, 0x2

    if-le v13, v10, :cond_15

    move/from16 v10, v20

    goto :goto_8

    :cond_15
    move/from16 v10, v18

    :goto_8
    move v9, v10

    .line 884
    .end local v2    # "min":I
    .end local v15    # "max":I
    :cond_16
    if-eqz v13, :cond_17

    .line 885
    sget-object v2, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v2, v2, v12

    aget v2, v2, v18

    sget-object v10, Lorg/apache/commons/lang/time/DateUtils;->fields:[[I

    aget-object v10, v10, v12

    aget v10, v10, v18

    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    sub-int/2addr v10, v13

    invoke-virtual {v0, v2, v10}, Ljava/util/Calendar;->set(II)V

    .line 817
    .end local v13    # "offset":I
    .end local v14    # "offsetSet":Z
    :cond_17
    add-int/lit8 v12, v12, 0x1

    move/from16 v2, v20

    const/16 v10, 0xc

    goto/16 :goto_0

    .line 888
    .end local v12    # "i":I
    :cond_18
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v12, "The field "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v12, " is not supported"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v2, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 768
    .end local v3    # "millisecs":I
    .end local v4    # "date":Ljava/util/Date;
    .end local v5    # "time":J
    .end local v7    # "done":Z
    .end local v8    # "seconds":I
    .end local v9    # "roundUp":Z
    .end local v11    # "minutes":I
    :cond_19
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "Calendar value too large for accurate calculations"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_1
        0x3e9 -> :sswitch_0
    .end sparse-switch
.end method

.method public static parseDate(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Date;
    .locals 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "parsePatterns"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 267
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    .line 271
    const/4 v0, 0x0

    .line 272
    .local v0, "parser":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/text/ParsePosition;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/text/ParsePosition;-><init>(I)V

    .line 273
    .local v1, "pos":Ljava/text/ParsePosition;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_2

    .line 274
    if-nez v3, :cond_0

    .line 275
    new-instance v4, Ljava/text/SimpleDateFormat;

    aget-object v5, p1, v2

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    move-object v0, v4

    .end local v0    # "parser":Ljava/text/SimpleDateFormat;
    .local v4, "parser":Ljava/text/SimpleDateFormat;
    goto :goto_1

    .line 277
    .end local v4    # "parser":Ljava/text/SimpleDateFormat;
    .restart local v0    # "parser":Ljava/text/SimpleDateFormat;
    :cond_0
    aget-object v4, p1, v3

    invoke-virtual {v0, v4}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    .line 279
    :goto_1
    invoke-virtual {v1, v2}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 280
    invoke-virtual {v0, p0, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v4

    .line 281
    .local v4, "date":Ljava/util/Date;
    if-eqz v4, :cond_1

    invoke-virtual {v1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v5

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v5, v6, :cond_1

    .line 282
    return-object v4

    .line 273
    .end local v4    # "date":Ljava/util/Date;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 285
    .end local v3    # "i":I
    :cond_2
    new-instance v2, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Unable to parse the date: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, -0x1

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 268
    .end local v0    # "parser":Ljava/text/SimpleDateFormat;
    .end local v1    # "pos":Ljava/text/ParsePosition;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Date and Patterns must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static round(Ljava/util/Calendar;I)Ljava/util/Calendar;
    .locals 2
    .param p0, "date"    # Ljava/util/Calendar;
    .param p1, "field"    # I

    .line 621
    if-eqz p0, :cond_0

    .line 624
    invoke-virtual {p0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    .line 625
    .local v0, "rounded":Ljava/util/Calendar;
    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang/time/DateUtils;->modify(Ljava/util/Calendar;IZ)V

    .line 626
    return-object v0

    .line 622
    .end local v0    # "rounded":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static round(Ljava/lang/Object;I)Ljava/util/Date;
    .locals 3
    .param p0, "date"    # Ljava/lang/Object;
    .param p1, "field"    # I

    .line 660
    if-eqz p0, :cond_2

    .line 663
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_0

    .line 664
    move-object v0, p0

    check-cast v0, Ljava/util/Date;

    invoke-static {v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->round(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v0

    return-object v0

    .line 665
    :cond_0
    instance-of v0, p0, Ljava/util/Calendar;

    if-eqz v0, :cond_1

    .line 666
    move-object v0, p0

    check-cast v0, Ljava/util/Calendar;

    invoke-static {v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->round(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    return-object v0

    .line 668
    :cond_1
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Could not round "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 661
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static round(Ljava/util/Date;I)Ljava/util/Date;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "field"    # I

    .line 583
    if-eqz p0, :cond_0

    .line 586
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 587
    .local v0, "gval":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 588
    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang/time/DateUtils;->modify(Ljava/util/Calendar;IZ)V

    .line 589
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1

    .line 584
    .end local v0    # "gval":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static set(Ljava/util/Date;II)Ljava/util/Date;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "calendarField"    # I
    .param p2, "amount"    # I

    .line 542
    if-eqz p0, :cond_0

    .line 546
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 547
    .local v0, "c":Ljava/util/Calendar;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setLenient(Z)V

    .line 548
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 549
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->set(II)V

    .line 550
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1

    .line 543
    .end local v0    # "c":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static setDays(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 464
    const/4 v0, 0x5

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setHours(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 480
    const/16 v0, 0xb

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setMilliseconds(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 525
    const/16 v0, 0xe

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setMinutes(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 495
    const/16 v0, 0xc

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setMonths(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 449
    const/4 v0, 0x2

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setSeconds(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 510
    const/16 v0, 0xd

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setYears(Ljava/util/Date;I)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .line 434
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;
    .locals 2
    .param p0, "date"    # Ljava/util/Calendar;
    .param p1, "field"    # I

    .line 716
    if-eqz p0, :cond_0

    .line 719
    invoke-virtual {p0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    .line 720
    .local v0, "truncated":Ljava/util/Calendar;
    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang/time/DateUtils;->modify(Ljava/util/Calendar;IZ)V

    .line 721
    return-object v0

    .line 717
    .end local v0    # "truncated":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static truncate(Ljava/lang/Object;I)Ljava/util/Date;
    .locals 3
    .param p0, "date"    # Ljava/lang/Object;
    .param p1, "field"    # I

    .line 745
    if-eqz p0, :cond_2

    .line 748
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_0

    .line 749
    move-object v0, p0

    check-cast v0, Ljava/util/Date;

    invoke-static {v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->truncate(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v0

    return-object v0

    .line 750
    :cond_0
    instance-of v0, p0, Ljava/util/Calendar;

    if-eqz v0, :cond_1

    .line 751
    move-object v0, p0

    check-cast v0, Ljava/util/Calendar;

    invoke-static {v0, p1}, Lorg/apache/commons/lang/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    return-object v0

    .line 753
    :cond_1
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Could not truncate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 746
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static truncate(Ljava/util/Date;I)Ljava/util/Date;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "field"    # I

    .line 690
    if-eqz p0, :cond_0

    .line 693
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 694
    .local v0, "gval":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 695
    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang/time/DateUtils;->modify(Ljava/util/Calendar;IZ)V

    .line 696
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1

    .line 691
    .end local v0    # "gval":Ljava/util/Calendar;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
