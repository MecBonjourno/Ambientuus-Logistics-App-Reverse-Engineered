.class final Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;
.super Ljava/lang/Object;
.source "AuthKeyValueParser.java"

# interfaces
.implements Lcom/google/api/client/util/ObjectParser;


# static fields
.field public static final INSTANCE:Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    new-instance v0, Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;

    invoke-direct {v0}, Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;-><init>()V

    sput-object v0, Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;->INSTANCE:Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 49
    const-string v0, "text/plain"

    return-object v0
.end method

.method public parse(Lcom/google/api/client/http/HttpResponse;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p1, "response"    # Lcom/google/api/client/http/HttpResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/api/client/http/HttpResponse;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    .local p2, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/api/client/http/HttpResponse;->setContentLoggingLimit(I)Lcom/google/api/client/http/HttpResponse;

    .line 54
    invoke-virtual {p1}, Lcom/google/api/client/http/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 56
    .local v0, "content":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0, v0, p2}, Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;->parse(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 56
    return-object v1

    .line 58
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 59
    throw v1
.end method

.method public parse(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 10
    .param p1, "content"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    .local p2, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p2}, Lcom/google/api/client/util/ClassInfo;->of(Ljava/lang/Class;)Lcom/google/api/client/util/ClassInfo;

    move-result-object v0

    .line 64
    .local v0, "classInfo":Lcom/google/api/client/util/ClassInfo;
    invoke-static {p2}, Lcom/google/api/client/util/Types;->newInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 65
    .local v1, "newInstance":Ljava/lang/Object;, "TT;"
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 67
    .local v2, "reader":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 68
    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 69
    nop

    .line 95
    .end local v3    # "line":Ljava/lang/String;
    return-object v1

    .line 71
    .restart local v3    # "line":Ljava/lang/String;
    :cond_0
    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 72
    .local v4, "equals":I
    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 73
    .local v5, "key":Ljava/lang/String;
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 75
    .local v6, "value":Ljava/lang/String;
    invoke-virtual {v0, v5}, Lcom/google/api/client/util/ClassInfo;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 76
    .local v7, "field":Ljava/lang/reflect/Field;
    if-eqz v7, :cond_3

    .line 77
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    .line 79
    .local v8, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v8, v9, :cond_2

    const-class v9, Ljava/lang/Boolean;

    if-ne v8, v9, :cond_1

    goto :goto_1

    .line 82
    :cond_1
    move-object v9, v6

    .local v9, "fieldValue":Ljava/lang/Object;
    goto :goto_2

    .line 80
    .end local v9    # "fieldValue":Ljava/lang/Object;
    :cond_2
    :goto_1
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v9

    .line 84
    .restart local v9    # "fieldValue":Ljava/lang/Object;
    :goto_2
    invoke-static {v7, v1, v9}, Lcom/google/api/client/util/FieldInfo;->setFieldValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .end local v8    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "fieldValue":Ljava/lang/Object;
    goto :goto_4

    :cond_3
    const-class v8, Lcom/google/api/client/util/GenericData;

    invoke-virtual {v8, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 86
    move-object v8, v1

    check-cast v8, Lcom/google/api/client/util/GenericData;

    .line 87
    .local v8, "data":Lcom/google/api/client/util/GenericData;
    invoke-virtual {v8, v5, v6}, Lcom/google/api/client/util/GenericData;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;

    .end local v8    # "data":Lcom/google/api/client/util/GenericData;
    goto :goto_3

    .line 88
    :cond_4
    const-class v8, Ljava/util/Map;

    invoke-virtual {v8, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 90
    move-object v8, v1

    check-cast v8, Ljava/util/Map;

    .line 91
    .local v8, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-interface {v8, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 88
    .end local v8    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    :cond_5
    :goto_3
    nop

    .line 93
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "equals":I
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    .end local v7    # "field":Ljava/lang/reflect/Field;
    :goto_4
    goto :goto_0
.end method

.method public parseAndClose(Ljava/io/InputStream;Ljava/nio/charset/Charset;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/nio/charset/Charset;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    .local p3, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 104
    .local v0, "reader":Ljava/io/Reader;
    invoke-virtual {p0, v0, p3}, Lcom/google/api/client/googleapis/auth/clientlogin/AuthKeyValueParser;->parseAndClose(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public parseAndClose(Ljava/io/InputStream;Ljava/nio/charset/Charset;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "dataType"    # Ljava/lang/reflect/Type;

    .line 108
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Type-based parsing is not yet supported -- use Class<T> instead"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public parseAndClose(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 10
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/Reader;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    .local p2, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-static {p2}, Lcom/google/api/client/util/ClassInfo;->of(Ljava/lang/Class;)Lcom/google/api/client/util/ClassInfo;

    move-result-object v0

    .line 115
    .local v0, "classInfo":Lcom/google/api/client/util/ClassInfo;
    invoke-static {p2}, Lcom/google/api/client/util/Types;->newInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 116
    .local v1, "newInstance":Ljava/lang/Object;, "TT;"
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 118
    .local v2, "breader":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 120
    nop

    .line 146
    .end local v3    # "line":Ljava/lang/String;
    nop

    .line 148
    invoke-virtual {p1}, Ljava/io/Reader;->close()V

    .line 146
    return-object v1

    .line 122
    .restart local v3    # "line":Ljava/lang/String;
    :cond_0
    const/16 v4, 0x3d

    :try_start_1
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 123
    .local v4, "equals":I
    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 124
    .local v5, "key":Ljava/lang/String;
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 126
    .local v6, "value":Ljava/lang/String;
    invoke-virtual {v0, v5}, Lcom/google/api/client/util/ClassInfo;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 127
    .local v7, "field":Ljava/lang/reflect/Field;
    if-eqz v7, :cond_3

    .line 128
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    .line 130
    .local v8, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v8, v9, :cond_2

    const-class v9, Ljava/lang/Boolean;

    if-ne v8, v9, :cond_1

    goto :goto_1

    .line 133
    :cond_1
    move-object v9, v6

    .local v9, "fieldValue":Ljava/lang/Object;
    goto :goto_2

    .line 131
    .end local v9    # "fieldValue":Ljava/lang/Object;
    :cond_2
    :goto_1
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v9

    .line 135
    .restart local v9    # "fieldValue":Ljava/lang/Object;
    :goto_2
    invoke-static {v7, v1, v9}, Lcom/google/api/client/util/FieldInfo;->setFieldValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 136
    .end local v8    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "fieldValue":Ljava/lang/Object;
    goto :goto_3

    :cond_3
    const-class v8, Lcom/google/api/client/util/GenericData;

    invoke-virtual {v8, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 137
    move-object v8, v1

    check-cast v8, Lcom/google/api/client/util/GenericData;

    .line 138
    .local v8, "data":Lcom/google/api/client/util/GenericData;
    invoke-virtual {v8, v5, v6}, Lcom/google/api/client/util/GenericData;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;

    .line 139
    nop

    .end local v8    # "data":Lcom/google/api/client/util/GenericData;
    goto :goto_3

    :cond_4
    const-class v8, Ljava/util/Map;

    invoke-virtual {v8, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 141
    move-object v8, v1

    check-cast v8, Ljava/util/Map;

    .line 142
    .local v8, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-interface {v8, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "equals":I
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    .end local v7    # "field":Ljava/lang/reflect/Field;
    .end local v8    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    :cond_5
    :goto_3
    goto :goto_0

    .line 148
    .end local v0    # "classInfo":Lcom/google/api/client/util/ClassInfo;
    .end local v1    # "newInstance":Ljava/lang/Object;, "TT;"
    .end local v2    # "breader":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/io/Reader;->close()V

    .line 149
    throw v0
.end method

.method public parseAndClose(Ljava/io/Reader;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 2
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "dataType"    # Ljava/lang/reflect/Type;

    .line 153
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Type-based parsing is not yet supported -- use Class<T> instead"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
