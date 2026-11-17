.class public Lorg/chromium/base/Log;
.super Ljava/lang/Object;
.source "Log.java"


# static fields
.field public static final ASSERT:I = 0x7

.field public static final DEBUG:I = 0x3

.field public static final ERROR:I = 0x6

.field public static final INFO:I = 0x4

.field public static final VERBOSE:I = 0x2

.field public static final WARN:I = 0x5


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    return-void
.end method

.method public static varargs d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 131
    invoke-static {}, Lorg/chromium/base/Log;->isDebug()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 133
    :cond_0
    invoke-static {p2}, Lorg/chromium/base/Log;->getThrowableToLog([Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    .line 134
    .local v0, "tr":Ljava/lang/Throwable;
    invoke-static {p1, v0, p2}, Lorg/chromium/base/Log;->formatLogWithStack(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 135
    .local v1, "message":Ljava/lang/String;
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 136
    if-eqz v0, :cond_1

    .line 137
    invoke-static {p0, v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 139
    :cond_1
    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    :goto_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 245
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "o"    # Ljava/lang/Object;

    .line 253
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p0, p1, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 254
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "o1"    # Ljava/lang/Object;
    .param p3, "o2"    # Ljava/lang/Object;

    .line 257
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-static {p0, p1, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 258
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .line 249
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 250
    return-void
.end method

.method public static varargs e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 232
    invoke-static {p2}, Lorg/chromium/base/Log;->getThrowableToLog([Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    .line 233
    .local v0, "tr":Ljava/lang/Throwable;
    invoke-static {p1, v0, p2}, Lorg/chromium/base/Log;->formatLog(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 234
    .local v1, "message":Ljava/lang/String;
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 235
    if-eqz v0, :cond_0

    .line 236
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 238
    :cond_0
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    :goto_0
    return-void
.end method

.method private static varargs formatLog(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageTemplate"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;
    .param p2, "params"    # [Ljava/lang/Object;

    .line 50
    if-eqz p2, :cond_2

    if-nez p1, :cond_0

    array-length v0, p2

    if-gtz v0, :cond_1

    :cond_0
    array-length v0, p2

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    .line 51
    :cond_1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, p0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 54
    :cond_2
    return-object p0
.end method

.method private static varargs formatLogWithStack(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p0, "messageTemplate"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;
    .param p2, "params"    # [Ljava/lang/Object;

    .line 75
    invoke-static {}, Lorg/chromium/base/Log;->getCallOrigin()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lorg/chromium/base/Log;->formatLog(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "] "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getCallOrigin()Ljava/lang/String;
    .locals 6

    .line 302
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 312
    .local v0, "st":[Ljava/lang/StackTraceElement;
    const-class v1, Lorg/chromium/base/Log;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 313
    .local v1, "logClassName":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "callerStackIndex":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 314
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 315
    add-int/lit8 v2, v2, 0x3

    .line 316
    goto :goto_1

    .line 313
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 320
    :cond_1
    :goto_1
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v3

    aget-object v4, v0, v2

    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ":"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 1
    .param p0, "tr"    # Ljava/lang/Throwable;

    .line 287
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getThrowableToLog([Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 3
    .param p0, "args"    # [Ljava/lang/Object;

    .line 291
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    array-length v1, p0

    if-nez v1, :cond_0

    goto :goto_0

    .line 293
    :cond_0
    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, p0, v1

    .line 295
    .local v1, "lastArg":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/Throwable;

    if-nez v2, :cond_1

    return-object v0

    .line 296
    :cond_1
    move-object v0, v1

    check-cast v0, Ljava/lang/Throwable;

    return-object v0

    .line 291
    .end local v1    # "lastArg":Ljava/lang/Object;
    :cond_2
    :goto_0
    return-object v0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 167
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "o"    # Ljava/lang/Object;

    .line 175
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p0, p1, v0}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 176
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "o1"    # Ljava/lang/Object;
    .param p3, "o2"    # Ljava/lang/Object;

    .line 179
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-static {p0, p1, v0}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 180
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .line 171
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 172
    return-void
.end method

.method public static varargs i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 154
    invoke-static {p2}, Lorg/chromium/base/Log;->getThrowableToLog([Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    .line 155
    .local v0, "tr":Ljava/lang/Throwable;
    invoke-static {p1, v0, p2}, Lorg/chromium/base/Log;->formatLog(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "message":Ljava/lang/String;
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 157
    if-eqz v0, :cond_0

    .line 158
    invoke-static {p0, v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 160
    :cond_0
    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    :goto_0
    return-void
.end method

.method private static isDebug()Z
    .locals 1

    .line 80
    const/4 v0, 0x1

    return v0
.end method

.method public static isLoggable(Ljava/lang/String;I)Z
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "level"    # I

    .line 89
    invoke-static {}, Lorg/chromium/base/Log;->isDebug()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x4

    if-gt p1, v0, :cond_0

    .line 90
    const/4 v0, 0x0

    return v0

    .line 92
    :cond_0
    invoke-static {p0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static normalizeTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cr_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 107
    invoke-static {}, Lorg/chromium/base/Log;->isDebug()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 109
    :cond_0
    invoke-static {p2}, Lorg/chromium/base/Log;->getThrowableToLog([Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    .line 110
    .local v0, "tr":Ljava/lang/Throwable;
    invoke-static {p1, v0, p2}, Lorg/chromium/base/Log;->formatLogWithStack(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "message":Ljava/lang/String;
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    invoke-static {p0, v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 115
    :cond_1
    invoke-static {p0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    :goto_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 206
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "o"    # Ljava/lang/Object;

    .line 214
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p0, p1, v0}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 215
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "o1"    # Ljava/lang/Object;
    .param p3, "o2"    # Ljava/lang/Object;

    .line 218
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-static {p0, p1, v0}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 219
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .line 210
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 211
    return-void
.end method

.method public static varargs w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 193
    invoke-static {p2}, Lorg/chromium/base/Log;->getThrowableToLog([Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    .line 194
    .local v0, "tr":Ljava/lang/Throwable;
    invoke-static {p1, v0, p2}, Lorg/chromium/base/Log;->formatLog(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 195
    .local v1, "message":Ljava/lang/String;
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 196
    if-eqz v0, :cond_0

    .line 197
    invoke-static {p0, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 199
    :cond_0
    invoke-static {p0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    :goto_0
    return-void
.end method

.method public static varargs wtf(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "messageTemplate"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 275
    invoke-static {p2}, Lorg/chromium/base/Log;->getThrowableToLog([Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    .line 276
    .local v0, "tr":Ljava/lang/Throwable;
    invoke-static {p1, v0, p2}, Lorg/chromium/base/Log;->formatLog(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 277
    .local v1, "message":Ljava/lang/String;
    invoke-static {p0}, Lorg/chromium/base/Log;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 278
    if-eqz v0, :cond_0

    .line 279
    invoke-static {p0, v1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 281
    :cond_0
    invoke-static {p0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    :goto_0
    return-void
.end method
