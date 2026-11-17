.class public Lorg/apache/commons/lang/exception/ExceptionUtils;
.super Ljava/lang/Object;
.source "ExceptionUtils.java"


# static fields
.field private static CAUSE_METHOD_NAMES:[Ljava/lang/String; = null

.field private static final THROWABLE_CAUSE_METHOD:Ljava/lang/reflect/Method;

.field private static final THROWABLE_INITCAUSE_METHOD:Ljava/lang/reflect/Method;

.field static final WRAPPED_MARKER:Ljava/lang/String; = " [wrapped] "

.field static synthetic class$java$lang$Throwable:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 62
    const-string v1, "java.lang.Throwable"

    const-string v12, "getLinkedCause"

    const-string v13, "getThrowable"

    const-string v2, "getCause"

    const-string v3, "getNextException"

    const-string v4, "getTargetException"

    const-string v5, "getException"

    const-string v6, "getSourceException"

    const-string v7, "getRootCause"

    const-string v8, "getCausedByException"

    const-string v9, "getNested"

    const-string v10, "getLinkedException"

    const-string v11, "getNestedException"

    filled-new-array/range {v2 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    .line 90
    :try_start_0
    sget-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v0, :cond_0

    invoke-static {v1}, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    goto :goto_0

    :cond_0
    sget-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_0
    const-string v2, "getCause"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .local v0, "causeMethod":Ljava/lang/reflect/Method;
    move-object v2, v0

    goto :goto_1

    .line 91
    .end local v0    # "causeMethod":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 94
    .end local v0    # "e":Ljava/lang/Exception;
    .local v2, "causeMethod":Ljava/lang/reflect/Method;
    :goto_1
    sput-object v2, Lorg/apache/commons/lang/exception/ExceptionUtils;->THROWABLE_CAUSE_METHOD:Ljava/lang/reflect/Method;

    .line 96
    :try_start_1
    sget-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v0, :cond_1

    invoke-static {v1}, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    goto :goto_2

    :cond_1
    sget-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_2
    const-string v3, "initCause"

    sget-object v4, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v4, :cond_2

    invoke-static {v1}, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    goto :goto_3

    :cond_2
    sget-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_3
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 99
    .end local v2    # "causeMethod":Ljava/lang/reflect/Method;
    .local v0, "causeMethod":Ljava/lang/reflect/Method;
    goto :goto_4

    .line 97
    .end local v0    # "causeMethod":Ljava/lang/reflect/Method;
    .restart local v2    # "causeMethod":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    move-object v0, v1

    .line 100
    .end local v2    # "causeMethod":Ljava/lang/reflect/Method;
    .local v0, "causeMethod":Ljava/lang/reflect/Method;
    :goto_4
    sput-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->THROWABLE_INITCAUSE_METHOD:Ljava/lang/reflect/Method;

    .line 101
    .end local v0    # "causeMethod":Ljava/lang/reflect/Method;
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    return-void
.end method

.method public static addCauseMethodName(Ljava/lang/String;)V
    .locals 3
    .param p0, "methodName"    # Ljava/lang/String;

    .line 123
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->isCauseMethodName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 124
    invoke-static {}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getCauseMethodNameList()Ljava/util/ArrayList;

    move-result-object v0

    .line 125
    .local v0, "list":Ljava/util/List;
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 126
    sget-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    monitor-enter v1

    .line 127
    :try_start_0
    invoke-static {v0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->toArray(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    .line 128
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 131
    .end local v0    # "list":Ljava/util/List;
    :cond_0
    :goto_0
    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p0, "x0"    # Ljava/lang/String;

    .line 90
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 278
    sget-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    monitor-enter v0

    .line 279
    :try_start_0
    sget-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getCause(Ljava/lang/Throwable;[Ljava/lang/String;)Ljava/lang/Throwable;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 280
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getCause(Ljava/lang/Throwable;[Ljava/lang/String;)Ljava/lang/Throwable;
    .locals 3
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "methodNames"    # [Ljava/lang/String;

    .line 302
    if-nez p0, :cond_0

    .line 303
    const/4 v0, 0x0

    return-object v0

    .line 305
    :cond_0
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getCauseUsingWellKnownTypes(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    .line 306
    .local v0, "cause":Ljava/lang/Throwable;
    if-nez v0, :cond_4

    .line 307
    if-nez p1, :cond_1

    .line 308
    sget-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    monitor-enter v1

    .line 309
    :try_start_0
    sget-object v2, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    move-object p1, v2

    .line 310
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 312
    :cond_1
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, p1

    if-ge v1, v2, :cond_3

    .line 313
    aget-object v2, p1, v1

    .line 314
    .local v2, "methodName":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 315
    invoke-static {p0, v2}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getCauseUsingMethodName(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/Throwable;

    move-result-object v0

    .line 316
    if-eqz v0, :cond_2

    .line 317
    goto :goto_2

    .line 312
    .end local v2    # "methodName":Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 322
    .end local v1    # "i":I
    :cond_3
    :goto_2
    if-nez v0, :cond_4

    .line 323
    const-string v1, "detail"

    invoke-static {p0, v1}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getCauseUsingFieldName(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/Throwable;

    move-result-object v0

    .line 326
    :cond_4
    return-object v0
.end method

.method private static getCauseMethodNameList()Ljava/util/ArrayList;
    .locals 3

    .line 225
    sget-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    monitor-enter v0

    .line 226
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 227
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static getCauseUsingFieldName(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/Throwable;
    .locals 3
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "fieldName"    # Ljava/lang/String;

    .line 412
    const/4 v0, 0x0

    .line 414
    .local v0, "field":Ljava/lang/reflect/Field;
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 419
    :goto_0
    goto :goto_1

    .line 417
    :catch_0
    move-exception v1

    goto :goto_1

    .line 415
    :catch_1
    move-exception v1

    goto :goto_0

    .line 421
    :goto_1
    if-eqz v0, :cond_1

    sget-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string v1, "java.lang.Throwable"

    invoke-static {v1}, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    goto :goto_2

    :cond_0
    sget-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 423
    :try_start_1
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    return-object v1

    .line 426
    :catch_2
    move-exception v1

    goto :goto_3

    .line 424
    :catch_3
    move-exception v1

    .line 428
    nop

    .line 430
    :cond_1
    :goto_3
    const/4 v1, 0x0

    return-object v1
.end method

.method private static getCauseUsingMethodName(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/Throwable;
    .locals 4
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "methodName"    # Ljava/lang/String;

    .line 381
    const/4 v0, 0x0

    .line 383
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 388
    :goto_0
    goto :goto_1

    .line 386
    :catch_0
    move-exception v2

    goto :goto_1

    .line 384
    :catch_1
    move-exception v2

    goto :goto_0

    .line 390
    :goto_1
    if-eqz v0, :cond_1

    sget-object v2, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string v2, "java.lang.Throwable"

    invoke-static {v2}, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    goto :goto_2

    :cond_0
    sget-object v2, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 392
    :try_start_1
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2

    return-object v2

    .line 397
    :catch_2
    move-exception v2

    goto :goto_4

    .line 395
    :catch_3
    move-exception v2

    goto :goto_3

    .line 393
    :catch_4
    move-exception v2

    .line 399
    :goto_3
    nop

    .line 401
    :cond_1
    :goto_4
    return-object v1
.end method

.method private static getCauseUsingWellKnownTypes(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 362
    instance-of v0, p0, Lorg/apache/commons/lang/exception/Nestable;

    if-eqz v0, :cond_0

    .line 363
    move-object v0, p0

    check-cast v0, Lorg/apache/commons/lang/exception/Nestable;

    invoke-interface {v0}, Lorg/apache/commons/lang/exception/Nestable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0

    .line 364
    :cond_0
    instance-of v0, p0, Ljava/sql/SQLException;

    if-eqz v0, :cond_1

    .line 365
    move-object v0, p0

    check-cast v0, Ljava/sql/SQLException;

    invoke-virtual {v0}, Ljava/sql/SQLException;->getNextException()Ljava/sql/SQLException;

    move-result-object v0

    return-object v0

    .line 366
    :cond_1
    instance-of v0, p0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v0, :cond_2

    .line 367
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/InvocationTargetException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0

    .line 369
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getFullStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 5
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 865
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 866
    .local v0, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    .line 867
    .local v1, "pw":Ljava/io/PrintWriter;
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getThrowables(Ljava/lang/Throwable;)[Ljava/lang/Throwable;

    move-result-object v2

    .line 868
    .local v2, "ts":[Ljava/lang/Throwable;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_1

    .line 869
    aget-object v4, v2, v3

    invoke-virtual {v4, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 870
    aget-object v4, v2, v3

    invoke-static {v4}, Lorg/apache/commons/lang/exception/ExceptionUtils;->isNestedThrowable(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 871
    goto :goto_1

    .line 868
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 874
    .end local v3    # "i":I
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getMessage(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 4
    .param p0, "th"    # Ljava/lang/Throwable;

    .line 984
    if-nez p0, :cond_0

    .line 985
    const-string v0, ""

    return-object v0

    .line 987
    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/ClassUtils;->getShortClassName(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 988
    .local v0, "clsName":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 989
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {v1}, Lorg/apache/commons/lang/StringUtils;->defaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 3
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 347
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getThrowableList(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v0

    .line 348
    .local v0, "list":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    :goto_0
    return-object v1
.end method

.method public static getRootCauseMessage(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2
    .param p0, "th"    # Ljava/lang/Throwable;

    .line 1004
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    .line 1005
    .local v0, "root":Ljava/lang/Throwable;
    if-nez v0, :cond_0

    move-object v1, p0

    goto :goto_0

    :cond_0
    move-object v1, v0

    .line 1006
    .end local v0    # "root":Ljava/lang/Throwable;
    .local v1, "root":Ljava/lang/Throwable;
    :goto_0
    invoke-static {v1}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getMessage(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRootCauseStackTrace(Ljava/lang/Throwable;)[Ljava/lang/String;
    .locals 8
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 801
    if-nez p0, :cond_0

    .line 802
    sget-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-object v0

    .line 804
    :cond_0
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getThrowables(Ljava/lang/Throwable;)[Ljava/lang/Throwable;

    move-result-object v0

    .line 805
    .local v0, "throwables":[Ljava/lang/Throwable;
    array-length v1, v0

    .line 806
    .local v1, "count":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 807
    .local v2, "frames":Ljava/util/ArrayList;
    add-int/lit8 v3, v1, -0x1

    aget-object v3, v0, v3

    invoke-static {v3}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getStackFrameList(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v3

    .line 808
    .local v3, "nextTrace":Ljava/util/List;
    move v4, v1

    .local v4, "i":I
    :goto_0
    add-int/lit8 v4, v4, -0x1

    if-ltz v4, :cond_4

    .line 809
    move-object v5, v3

    .line 810
    .local v5, "trace":Ljava/util/List;
    if-eqz v4, :cond_1

    .line 811
    add-int/lit8 v6, v4, -0x1

    aget-object v6, v0, v6

    invoke-static {v6}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getStackFrameList(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v3

    .line 812
    invoke-static {v5, v3}, Lorg/apache/commons/lang/exception/ExceptionUtils;->removeCommonFrames(Ljava/util/List;Ljava/util/List;)V

    .line 814
    :cond_1
    add-int/lit8 v6, v1, -0x1

    if-ne v4, v6, :cond_2

    .line 815
    aget-object v6, v0, v4

    invoke-virtual {v6}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 817
    :cond_2
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, " [wrapped] "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    aget-object v7, v0, v4

    invoke-virtual {v7}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 819
    :goto_1
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_2
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_3

    .line 820
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 819
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .end local v5    # "trace":Ljava/util/List;
    .end local v6    # "j":I
    :cond_3
    goto :goto_0

    .line 823
    .end local v4    # "i":I
    :cond_4
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    return-object v4
.end method

.method static getStackFrameList(Ljava/lang/Throwable;)Ljava/util/List;
    .locals 8
    .param p0, "t"    # Ljava/lang/Throwable;

    .line 953
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 954
    .local v0, "stackTrace":Ljava/lang/String;
    sget-object v1, Lorg/apache/commons/lang/SystemUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 955
    .local v1, "linebreak":Ljava/lang/String;
    new-instance v2, Ljava/util/StringTokenizer;

    invoke-direct {v2, v0, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 956
    .local v2, "frames":Ljava/util/StringTokenizer;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 957
    .local v3, "list":Ljava/util/List;
    const/4 v4, 0x0

    .line 958
    .local v4, "traceStarted":Z
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 959
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 961
    .local v5, "token":Ljava/lang/String;
    const-string v6, "at"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 962
    .local v6, "at":I
    const/4 v7, -0x1

    if-eq v6, v7, :cond_0

    const/4 v7, 0x0

    invoke-virtual {v5, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_0

    .line 963
    const/4 v4, 0x1

    .line 964
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 965
    :cond_0
    if-eqz v4, :cond_1

    .line 966
    goto :goto_2

    .end local v5    # "token":Ljava/lang/String;
    .end local v6    # "at":I
    :cond_1
    :goto_1
    goto :goto_0

    .line 969
    :cond_2
    :goto_2
    return-object v3
.end method

.method static getStackFrames(Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .param p0, "stackTrace"    # Ljava/lang/String;

    .line 931
    sget-object v0, Lorg/apache/commons/lang/SystemUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 932
    .local v0, "linebreak":Ljava/lang/String;
    new-instance v1, Ljava/util/StringTokenizer;

    invoke-direct {v1, p0, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 933
    .local v1, "frames":Ljava/util/StringTokenizer;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 934
    .local v2, "list":Ljava/util/List;
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 935
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 937
    :cond_0
    invoke-static {v2}, Lorg/apache/commons/lang/exception/ExceptionUtils;->toArray(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getStackFrames(Ljava/lang/Throwable;)[Ljava/lang/String;
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 911
    if-nez p0, :cond_0

    .line 912
    sget-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-object v0

    .line 914
    :cond_0
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getStackFrames(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 3
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 891
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 892
    .local v0, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    .line 893
    .local v1, "pw":Ljava/io/PrintWriter;
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 894
    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getThrowableCount(Ljava/lang/Throwable;)I
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 518
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getThrowableList(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public static getThrowableList(Ljava/lang/Throwable;)Ljava/util/List;
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 565
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 566
    .local v0, "list":Ljava/util/List;
    :goto_0
    if-eqz p0, :cond_0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 567
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 568
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_0

    .line 570
    :cond_0
    return-object v0
.end method

.method public static getThrowables(Ljava/lang/Throwable;)[Ljava/lang/Throwable;
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 541
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getThrowableList(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v0

    .line 542
    .local v0, "list":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Throwable;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Throwable;

    return-object v1
.end method

.method private static indexOf(Ljava/lang/Throwable;Ljava/lang/Class;IZ)I
    .locals 4
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "fromIndex"    # I
    .param p3, "subclass"    # Z

    .line 671
    const/4 v0, -0x1

    if-eqz p0, :cond_8

    if-nez p1, :cond_0

    goto :goto_3

    .line 674
    :cond_0
    if-gez p2, :cond_1

    .line 675
    const/4 p2, 0x0

    .line 677
    :cond_1
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getThrowables(Ljava/lang/Throwable;)[Ljava/lang/Throwable;

    move-result-object v1

    .line 678
    .local v1, "throwables":[Ljava/lang/Throwable;
    array-length v2, v1

    if-lt p2, v2, :cond_2

    .line 679
    return v0

    .line 681
    :cond_2
    if-eqz p3, :cond_5

    .line 682
    move v2, p2

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_4

    .line 683
    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 684
    return v2

    .line 682
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v2    # "i":I
    :cond_4
    goto :goto_2

    .line 688
    :cond_5
    move v2, p2

    .restart local v2    # "i":I
    :goto_1
    array-length v3, v1

    if-ge v2, v3, :cond_7

    .line 689
    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 690
    return v2

    .line 688
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 694
    .end local v2    # "i":I
    :cond_7
    :goto_2
    return v0

    .line 672
    .end local v1    # "throwables":[Ljava/lang/Throwable;
    :cond_8
    :goto_3
    return v0
.end method

.method public static indexOfThrowable(Ljava/lang/Throwable;Ljava/lang/Class;)I
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "clazz"    # Ljava/lang/Class;

    .line 589
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->indexOf(Ljava/lang/Throwable;Ljava/lang/Class;IZ)I

    move-result v0

    return v0
.end method

.method public static indexOfThrowable(Ljava/lang/Throwable;Ljava/lang/Class;I)I
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "fromIndex"    # I

    .line 612
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->indexOf(Ljava/lang/Throwable;Ljava/lang/Class;IZ)I

    move-result v0

    return v0
.end method

.method public static indexOfType(Ljava/lang/Throwable;Ljava/lang/Class;)I
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "type"    # Ljava/lang/Class;

    .line 632
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/exception/ExceptionUtils;->indexOf(Ljava/lang/Throwable;Ljava/lang/Class;IZ)I

    move-result v0

    return v0
.end method

.method public static indexOfType(Ljava/lang/Throwable;Ljava/lang/Class;I)I
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "fromIndex"    # I

    .line 656
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->indexOf(Ljava/lang/Throwable;Ljava/lang/Class;IZ)I

    move-result v0

    return v0
.end method

.method public static isCauseMethodName(Ljava/lang/String;)Z
    .locals 2
    .param p0, "methodName"    # Ljava/lang/String;

    .line 240
    sget-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    monitor-enter v0

    .line 241
    :try_start_0
    sget-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    invoke-static {v1, p0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    .line 242
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static isNestedThrowable(Ljava/lang/Throwable;)Z
    .locals 9
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 456
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 457
    return v0

    .line 460
    :cond_0
    instance-of v1, p0, Lorg/apache/commons/lang/exception/Nestable;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 461
    return v2

    .line 462
    :cond_1
    instance-of v1, p0, Ljava/sql/SQLException;

    if-eqz v1, :cond_2

    .line 463
    return v2

    .line 464
    :cond_2
    instance-of v1, p0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_3

    .line 465
    return v2

    .line 466
    :cond_3
    invoke-static {}, Lorg/apache/commons/lang/exception/ExceptionUtils;->isThrowableNested()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 467
    return v2

    .line 470
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 471
    .local v1, "cls":Ljava/lang/Class;
    sget-object v3, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    monitor-enter v3

    .line 472
    const/4 v4, 0x0

    .local v4, "i":I
    :try_start_0
    sget-object v5, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    array-length v5, v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v5, "isize":I
    :goto_0
    if-ge v4, v5, :cond_7

    .line 474
    :try_start_1
    sget-object v6, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    aget-object v6, v6, v4

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 475
    .local v6, "method":Ljava/lang/reflect/Method;
    if-eqz v6, :cond_6

    sget-object v7, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v7, :cond_5

    const-string v7, "java.lang.Throwable"

    invoke-static {v7}, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    goto :goto_1

    :cond_5
    sget-object v7, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v7, :cond_6

    .line 476
    :try_start_2
    monitor-exit v3

    return v2

    .line 480
    .end local v6    # "method":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v6

    goto :goto_2

    .line 478
    :catch_1
    move-exception v6

    .line 482
    :cond_6
    nop

    .line 472
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 484
    .end local v4    # "i":I
    .end local v5    # "isize":I
    :cond_7
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 487
    :try_start_3
    const-string v3, "detail"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_2

    .line 488
    .local v3, "field":Ljava/lang/reflect/Field;
    if-eqz v3, :cond_8

    .line 489
    return v2

    .line 488
    .end local v3    # "field":Ljava/lang/reflect/Field;
    :cond_8
    goto :goto_3

    .line 493
    :catch_2
    move-exception v2

    goto :goto_4

    .line 491
    :catch_3
    move-exception v2

    .line 495
    :goto_3
    nop

    .line 497
    :goto_4
    return v0

    .line 484
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0
.end method

.method public static isThrowableNested()Z
    .locals 1

    .line 443
    sget-object v0, Lorg/apache/commons/lang/exception/ExceptionUtils;->THROWABLE_CAUSE_METHOD:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static printRootCauseStackTrace(Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 717
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-static {p0, v0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->printRootCauseStackTrace(Ljava/lang/Throwable;Ljava/io/PrintStream;)V

    .line 718
    return-void
.end method

.method public static printRootCauseStackTrace(Ljava/lang/Throwable;Ljava/io/PrintStream;)V
    .locals 3
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "stream"    # Ljava/io/PrintStream;

    .line 740
    if-nez p0, :cond_0

    .line 741
    return-void

    .line 743
    :cond_0
    if-eqz p1, :cond_2

    .line 746
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getRootCauseStackTrace(Ljava/lang/Throwable;)[Ljava/lang/String;

    move-result-object v0

    .line 747
    .local v0, "trace":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 748
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 747
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 750
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p1}, Ljava/io/PrintStream;->flush()V

    .line 751
    return-void

    .line 744
    .end local v0    # "trace":[Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The PrintStream must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static printRootCauseStackTrace(Ljava/lang/Throwable;Ljava/io/PrintWriter;)V
    .locals 3
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "writer"    # Ljava/io/PrintWriter;

    .line 773
    if-nez p0, :cond_0

    .line 774
    return-void

    .line 776
    :cond_0
    if-eqz p1, :cond_2

    .line 779
    invoke-static {p0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getRootCauseStackTrace(Ljava/lang/Throwable;)[Ljava/lang/String;

    move-result-object v0

    .line 780
    .local v0, "trace":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 781
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 780
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 783
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    .line 784
    return-void

    .line 777
    .end local v0    # "trace":[Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The PrintWriter must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static removeCauseMethodName(Ljava/lang/String;)V
    .locals 3
    .param p0, "methodName"    # Ljava/lang/String;

    .line 142
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    invoke-static {}, Lorg/apache/commons/lang/exception/ExceptionUtils;->getCauseMethodNameList()Ljava/util/ArrayList;

    move-result-object v0

    .line 144
    .local v0, "list":Ljava/util/List;
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 145
    sget-object v1, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    monitor-enter v1

    .line 146
    :try_start_0
    invoke-static {v0}, Lorg/apache/commons/lang/exception/ExceptionUtils;->toArray(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/lang/exception/ExceptionUtils;->CAUSE_METHOD_NAMES:[Ljava/lang/String;

    .line 147
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 150
    .end local v0    # "list":Ljava/util/List;
    :cond_0
    :goto_0
    return-void
.end method

.method public static removeCommonFrames(Ljava/util/List;Ljava/util/List;)V
    .locals 5
    .param p0, "causeFrames"    # Ljava/util/List;
    .param p1, "wrapperFrames"    # Ljava/util/List;

    .line 835
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    .line 838
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 839
    .local v0, "causeFrameIndex":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 840
    .local v1, "wrapperFrameIndex":I
    :goto_0
    if-ltz v0, :cond_1

    if-ltz v1, :cond_1

    .line 843
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 844
    .local v2, "causeFrame":Ljava/lang/String;
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 845
    .local v3, "wrapperFrame":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 846
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 848
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 849
    nop

    .end local v2    # "causeFrame":Ljava/lang/String;
    .end local v3    # "wrapperFrame":Ljava/lang/String;
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 851
    :cond_1
    return-void

    .line 836
    .end local v0    # "causeFrameIndex":I
    .end local v1    # "wrapperFrameIndex":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The List must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static setCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z
    .locals 7
    .param p0, "target"    # Ljava/lang/Throwable;
    .param p1, "cause"    # Ljava/lang/Throwable;

    .line 181
    if-eqz p0, :cond_2

    .line 184
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 185
    .local v1, "causeArgs":[Ljava/lang/Object;
    const/4 v3, 0x0

    .line 186
    .local v3, "modifiedTarget":Z
    sget-object v4, Lorg/apache/commons/lang/exception/ExceptionUtils;->THROWABLE_INITCAUSE_METHOD:Ljava/lang/reflect/Method;

    if-eqz v4, :cond_0

    .line 188
    :try_start_0
    sget-object v4, Lorg/apache/commons/lang/exception/ExceptionUtils;->THROWABLE_INITCAUSE_METHOD:Ljava/lang/reflect/Method;

    invoke-virtual {v4, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    const/4 v3, 0x1

    .line 194
    :goto_0
    goto :goto_1

    .line 192
    :catch_0
    move-exception v4

    goto :goto_1

    .line 190
    :catch_1
    move-exception v4

    goto :goto_0

    .line 197
    :cond_0
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "setCause"

    sget-object v6, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v6, :cond_1

    const-string v6, "java.lang.Throwable"

    invoke-static {v6}, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    goto :goto_2

    :cond_1
    sget-object v6, Lorg/apache/commons/lang/exception/ExceptionUtils;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_2
    new-array v0, v0, [Ljava/lang/Class;

    aput-object v6, v0, v2

    invoke-virtual {v4, v5, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 198
    .local v0, "setCauseMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2

    .line 199
    const/4 v3, 0x1

    .line 206
    .end local v0    # "setCauseMethod":Ljava/lang/reflect/Method;
    :goto_3
    goto :goto_4

    .line 204
    :catch_2
    move-exception v0

    goto :goto_4

    .line 202
    :catch_3
    move-exception v0

    goto :goto_3

    .line 200
    :catch_4
    move-exception v0

    goto :goto_3

    .line 207
    :goto_4
    return v3

    .line 182
    .end local v1    # "causeArgs":[Ljava/lang/Object;
    .end local v3    # "modifiedTarget":Z
    :cond_2
    new-instance v0, Lorg/apache/commons/lang/NullArgumentException;

    const-string v1, "target"

    invoke-direct {v0, v1}, Lorg/apache/commons/lang/NullArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static toArray(Ljava/util/List;)[Ljava/lang/String;
    .locals 1
    .param p0, "list"    # Ljava/util/List;

    .line 216
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method
