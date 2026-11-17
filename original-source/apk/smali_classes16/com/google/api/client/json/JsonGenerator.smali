.class public abstract Lcom/google/api/client/json/JsonGenerator;
.super Ljava/lang/Object;
.source "JsonGenerator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private serialize(ZLjava/lang/Object;)V
    .locals 11
    .param p1, "isJsonString"    # Z
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    if-nez p2, :cond_0

    .line 111
    return-void

    .line 113
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 114
    .local v0, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2}, Lcom/google/api/client/util/Data;->isNull(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 115
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonGenerator;->writeNull()V

    goto/16 :goto_b

    .line 116
    :cond_1
    instance-of v1, p2, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 117
    move-object v1, p2

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 118
    :cond_2
    instance-of v1, p2, Ljava/lang/Number;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_c

    .line 119
    if-eqz p1, :cond_3

    .line 120
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 121
    :cond_3
    instance-of v1, p2, Ljava/math/BigDecimal;

    if-eqz v1, :cond_4

    .line 122
    move-object v1, p2

    check-cast v1, Ljava/math/BigDecimal;

    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeNumber(Ljava/math/BigDecimal;)V

    goto/16 :goto_b

    .line 123
    :cond_4
    instance-of v1, p2, Ljava/math/BigInteger;

    if-eqz v1, :cond_5

    .line 124
    move-object v1, p2

    check-cast v1, Ljava/math/BigInteger;

    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeNumber(Ljava/math/BigInteger;)V

    goto/16 :goto_b

    .line 125
    :cond_5
    instance-of v1, p2, Ljava/lang/Long;

    if-eqz v1, :cond_6

    .line 126
    move-object v1, p2

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lcom/google/api/client/json/JsonGenerator;->writeNumber(J)V

    goto/16 :goto_b

    .line 127
    :cond_6
    instance-of v1, p2, Ljava/lang/Float;

    if-eqz v1, :cond_8

    .line 128
    move-object v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    .line 129
    .local v1, "floatValue":F
    invoke-static {v1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v4

    if-nez v4, :cond_7

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_0

    :cond_7
    move v2, v3

    :goto_0
    invoke-static {v2}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 130
    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeNumber(F)V

    .line 131
    .end local v1    # "floatValue":F
    goto/16 :goto_b

    :cond_8
    instance-of v1, p2, Ljava/lang/Integer;

    if-nez v1, :cond_b

    instance-of v1, p2, Ljava/lang/Short;

    if-nez v1, :cond_b

    instance-of v1, p2, Ljava/lang/Byte;

    if-eqz v1, :cond_9

    goto :goto_2

    .line 134
    :cond_9
    move-object v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .line 135
    .local v4, "doubleValue":D
    invoke-static {v4, v5}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v1

    if-nez v1, :cond_a

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-nez v1, :cond_a

    goto :goto_1

    :cond_a
    move v2, v3

    :goto_1
    invoke-static {v2}, Lcom/google/api/client/util/Preconditions;->checkArgument(Z)V

    .line 136
    invoke-virtual {p0, v4, v5}, Lcom/google/api/client/json/JsonGenerator;->writeNumber(D)V

    .line 137
    .end local v4    # "doubleValue":D
    goto/16 :goto_b

    .line 132
    :cond_b
    :goto_2
    move-object v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeNumber(I)V

    goto/16 :goto_b

    .line 138
    :cond_c
    instance-of v1, p2, Ljava/lang/Boolean;

    if-eqz v1, :cond_d

    .line 139
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeBoolean(Z)V

    goto/16 :goto_b

    .line 140
    :cond_d
    instance-of v1, p2, Lcom/google/api/client/util/DateTime;

    if-eqz v1, :cond_e

    .line 141
    move-object v1, p2

    check-cast v1, Lcom/google/api/client/util/DateTime;

    invoke-virtual {v1}, Lcom/google/api/client/util/DateTime;->toStringRfc3339()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 142
    :cond_e
    instance-of v1, p2, Ljava/lang/Iterable;

    if-nez v1, :cond_18

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_f

    goto/16 :goto_9

    .line 148
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Class;->isEnum()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 149
    move-object v1, p2

    check-cast v1, Ljava/lang/Enum;

    invoke-static {v1}, Lcom/google/api/client/util/FieldInfo;->of(Ljava/lang/Enum;)Lcom/google/api/client/util/FieldInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/api/client/util/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v1

    .line 150
    .local v1, "name":Ljava/lang/String;
    if-nez v1, :cond_10

    .line 151
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonGenerator;->writeNull()V

    goto :goto_3

    .line 153
    :cond_10
    invoke-virtual {p0, v1}, Lcom/google/api/client/json/JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 155
    .end local v1    # "name":Ljava/lang/String;
    :goto_3
    goto/16 :goto_b

    .line 156
    :cond_11
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonGenerator;->writeStartObject()V

    .line 158
    instance-of v1, p2, Ljava/util/Map;

    if-eqz v1, :cond_12

    instance-of v1, p2, Lcom/google/api/client/util/GenericData;

    if-nez v1, :cond_12

    move v1, v2

    goto :goto_4

    :cond_12
    move v1, v3

    .line 159
    .local v1, "isMapNotGenericData":Z
    :goto_4
    if-eqz v1, :cond_13

    const/4 v4, 0x0

    goto :goto_5

    :cond_13
    invoke-static {v0}, Lcom/google/api/client/util/ClassInfo;->of(Ljava/lang/Class;)Lcom/google/api/client/util/ClassInfo;

    move-result-object v4

    .line 160
    .local v4, "classInfo":Lcom/google/api/client/util/ClassInfo;
    :goto_5
    invoke-static {p2}, Lcom/google/api/client/util/Data;->mapOf(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_17

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 161
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    .line 162
    .local v7, "fieldValue":Ljava/lang/Object;
    if-eqz v7, :cond_16

    .line 163
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 165
    .local v8, "fieldName":Ljava/lang/String;
    if-eqz v1, :cond_14

    .line 166
    move v9, p1

    .local v9, "isJsonStringForField":Z
    goto :goto_8

    .line 168
    .end local v9    # "isJsonStringForField":Z
    :cond_14
    invoke-virtual {v4, v8}, Lcom/google/api/client/util/ClassInfo;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    .line 169
    .local v9, "field":Ljava/lang/reflect/Field;
    if-eqz v9, :cond_15

    const-class v10, Lcom/google/api/client/json/JsonString;

    invoke-virtual {v9, v10}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    if-eqz v10, :cond_15

    move v10, v2

    goto :goto_7

    :cond_15
    move v10, v3

    :goto_7
    move v9, v10

    .line 171
    .local v9, "isJsonStringForField":Z
    :goto_8
    invoke-virtual {p0, v8}, Lcom/google/api/client/json/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 172
    invoke-direct {p0, v9, v7}, Lcom/google/api/client/json/JsonGenerator;->serialize(ZLjava/lang/Object;)V

    .line 174
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7    # "fieldValue":Ljava/lang/Object;
    .end local v8    # "fieldName":Ljava/lang/String;
    .end local v9    # "isJsonStringForField":Z
    :cond_16
    goto :goto_6

    .line 175
    :cond_17
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonGenerator;->writeEndObject()V

    goto :goto_b

    .line 143
    .end local v1    # "isMapNotGenericData":Z
    .end local v4    # "classInfo":Lcom/google/api/client/util/ClassInfo;
    :cond_18
    :goto_9
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonGenerator;->writeStartArray()V

    .line 144
    invoke-static {p2}, Lcom/google/api/client/util/Types;->iterableOf(Ljava/lang/Object;)Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 145
    .local v2, "o":Ljava/lang/Object;
    invoke-direct {p0, p1, v2}, Lcom/google/api/client/json/JsonGenerator;->serialize(ZLjava/lang/Object;)V

    .line 146
    .end local v2    # "o":Ljava/lang/Object;
    goto :goto_a

    .line 147
    :cond_19
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonGenerator;->writeEndArray()V

    .line 177
    :goto_b
    return-void
.end method


# virtual methods
.method public abstract close()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public enablePrettyPrint()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 192
    return-void
.end method

.method public abstract flush()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getFactory()Lcom/google/api/client/json/JsonFactory;
.end method

.method public final serialize(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/google/api/client/json/JsonGenerator;->serialize(ZLjava/lang/Object;)V

    .line 107
    return-void
.end method

.method public abstract writeBoolean(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeEndArray()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeEndObject()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeFieldName(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeNull()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeNumber(D)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeNumber(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeNumber(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeNumber(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeNumber(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeNumber(Ljava/math/BigDecimal;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeNumber(Ljava/math/BigInteger;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeStartArray()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeStartObject()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeString(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
