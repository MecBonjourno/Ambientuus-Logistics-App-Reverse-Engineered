.class public abstract Lcom/google/api/client/json/JsonParser;
.super Ljava/lang/Object;
.source "JsonParser.java"


# static fields
.field private static cachedTypemapFields:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation
.end field

.field private static final lock:Ljava/util/concurrent/locks/Lock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 69
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/google/api/client/json/JsonParser;->cachedTypemapFields:Ljava/util/WeakHashMap;

    .line 73
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    sput-object v0, Lcom/google/api/client/json/JsonParser;->lock:Ljava/util/concurrent/locks/Lock;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getCachedTypemapFieldFor(Ljava/lang/Class;)Ljava/lang/reflect/Field;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 906
    .local p0, "key":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v1, p0

    if-nez v1, :cond_0

    .line 907
    const/4 v0, 0x0

    return-object v0

    .line 909
    :cond_0
    sget-object v0, Lcom/google/api/client/json/JsonParser;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 913
    :try_start_0
    sget-object v0, Lcom/google/api/client/json/JsonParser;->cachedTypemapFields:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 914
    sget-object v0, Lcom/google/api/client/json/JsonParser;->cachedTypemapFields:Ljava/util/WeakHashMap;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 945
    sget-object v2, Lcom/google/api/client/json/JsonParser;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 914
    return-object v0

    .line 917
    :cond_1
    const/4 v0, 0x0

    .line 918
    .local v0, "value":Ljava/lang/reflect/Field;
    :try_start_1
    invoke-static {v1}, Lcom/google/api/client/util/ClassInfo;->of(Ljava/lang/Class;)Lcom/google/api/client/util/ClassInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/api/client/util/ClassInfo;->getFieldInfos()Ljava/util/Collection;

    move-result-object v2

    .line 919
    .local v2, "fieldInfos":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/api/client/util/FieldInfo;>;"
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/api/client/util/FieldInfo;

    .line 920
    .local v4, "fieldInfo":Lcom/google/api/client/util/FieldInfo;
    invoke-virtual {v4}, Lcom/google/api/client/util/FieldInfo;->getField()Ljava/lang/reflect/Field;

    move-result-object v5

    .line 921
    .local v5, "field":Ljava/lang/reflect/Field;
    const-class v6, Lcom/google/api/client/json/JsonPolymorphicTypeMap;

    .line 922
    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lcom/google/api/client/json/JsonPolymorphicTypeMap;

    .line 923
    .local v6, "typemapAnnotation":Lcom/google/api/client/json/JsonPolymorphicTypeMap;
    if-eqz v6, :cond_4

    .line 924
    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v0, :cond_2

    move v9, v7

    goto :goto_1

    :cond_2
    move v9, v8

    :goto_1
    const-string v10, "Class contains more than one field with @JsonPolymorphicTypeMap annotation: %s"

    new-array v11, v7, [Ljava/lang/Object;

    aput-object v1, v11, v8

    invoke-static {v9, v10, v11}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 927
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    invoke-static {v9}, Lcom/google/api/client/util/Data;->isPrimitive(Ljava/lang/reflect/Type;)Z

    move-result v9

    const-string v10, "Field which has the @JsonPolymorphicTypeMap, %s, is not a supported type: %s"

    .line 929
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v11

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    aput-object v1, v12, v8

    aput-object v11, v12, v7

    .line 927
    invoke-static {v9, v10, v12}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 930
    move-object v0, v5

    .line 932
    invoke-interface {v6}, Lcom/google/api/client/json/JsonPolymorphicTypeMap;->typeDefinitions()[Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;

    move-result-object v9

    .line 933
    .local v9, "typeDefs":[Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;
    invoke-static {}, Lcom/google/api/client/util/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v10

    .line 934
    .local v10, "typeDefKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    array-length v11, v9

    if-lez v11, :cond_3

    move v11, v7

    goto :goto_2

    :cond_3
    move v11, v8

    :goto_2
    const-string v12, "@JsonPolymorphicTypeMap must have at least one @TypeDef"

    invoke-static {v11, v12}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 936
    array-length v11, v9

    move v12, v8

    :goto_3
    if-ge v12, v11, :cond_4

    aget-object v13, v9, v12

    .line 937
    .local v13, "typeDef":Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;
    invoke-interface {v13}, Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;->key()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v14

    const-string v15, "Class contains two @TypeDef annotations with identical key: %s"

    .line 938
    invoke-interface {v13}, Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;->key()Ljava/lang/String;

    move-result-object v16

    move/from16 v17, v8

    new-array v8, v7, [Ljava/lang/Object;

    aput-object v16, v8, v17

    .line 937
    invoke-static {v14, v15, v8}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 936
    .end local v13    # "typeDef":Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;
    add-int/lit8 v12, v12, 0x1

    move/from16 v8, v17

    goto :goto_3

    .line 941
    .end local v4    # "fieldInfo":Lcom/google/api/client/util/FieldInfo;
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "typemapAnnotation":Lcom/google/api/client/json/JsonPolymorphicTypeMap;
    .end local v9    # "typeDefs":[Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;
    .end local v10    # "typeDefKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_4
    goto :goto_0

    .line 942
    :cond_5
    sget-object v3, Lcom/google/api/client/json/JsonParser;->cachedTypemapFields:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 943
    nop

    .line 945
    sget-object v3, Lcom/google/api/client/json/JsonParser;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 943
    return-object v0

    .line 945
    .end local v0    # "value":Ljava/lang/reflect/Field;
    .end local v2    # "fieldInfos":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/api/client/util/FieldInfo;>;"
    :catchall_0
    move-exception v0

    sget-object v2, Lcom/google/api/client/json/JsonParser;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 946
    throw v0
.end method

.method private parse(Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;)V
    .locals 14
    .param p2, "destination"    # Ljava/lang/Object;
    .param p3, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Type;",
            ">;",
            "Ljava/lang/Object;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 439
    .local p1, "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    move-object/from16 v4, p2

    instance-of v0, v4, Lcom/google/api/client/json/GenericJson;

    if-eqz v0, :cond_0

    .line 440
    move-object v0, v4

    check-cast v0, Lcom/google/api/client/json/GenericJson;

    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->getFactory()Lcom/google/api/client/json/JsonFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/api/client/json/GenericJson;->setFactory(Lcom/google/api/client/json/JsonFactory;)V

    .line 442
    :cond_0
    invoke-direct {p0}, Lcom/google/api/client/json/JsonParser;->startParsingObjectOrArray()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 443
    .local v0, "curToken":Lcom/google/api/client/json/JsonToken;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    .line 444
    .local v11, "destinationClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v11}, Lcom/google/api/client/util/ClassInfo;->of(Ljava/lang/Class;)Lcom/google/api/client/util/ClassInfo;

    move-result-object v12

    .line 445
    .local v12, "classInfo":Lcom/google/api/client/util/ClassInfo;
    const-class v1, Lcom/google/api/client/util/GenericData;

    invoke-virtual {v1, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v13

    .line 446
    .local v13, "isGenericData":Z
    if-nez v13, :cond_1

    const-class v1, Ljava/util/Map;

    invoke-virtual {v1, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 450
    move-object v7, v4

    check-cast v7, Ljava/util/Map;

    .line 451
    .local v7, "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v6, 0x0

    invoke-static {v11}, Lcom/google/api/client/util/Types;->getMapValueParameter(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v8

    move-object v5, p0

    move-object v9, p1

    move-object/from16 v10, p3

    invoke-direct/range {v5 .. v10}, Lcom/google/api/client/json/JsonParser;->parseMap(Ljava/lang/reflect/Field;Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 453
    move-object v5, v10

    return-void

    .line 446
    .end local v7    # "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    move-object/from16 v5, p3

    .line 455
    move-object v7, v0

    .end local v0    # "curToken":Lcom/google/api/client/json/JsonToken;
    .local v7, "curToken":Lcom/google/api/client/json/JsonToken;
    :goto_0
    sget-object v0, Lcom/google/api/client/json/JsonToken;->FIELD_NAME:Lcom/google/api/client/json/JsonToken;

    if-ne v7, v0, :cond_8

    .line 456
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->getText()Ljava/lang/String;

    move-result-object v8

    .line 457
    .local v8, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    .line 459
    if-eqz v5, :cond_2

    invoke-virtual {v5, v4, v8}, Lcom/google/api/client/json/CustomizeJsonParser;->stopAt(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 460
    return-void

    .line 463
    :cond_2
    invoke-virtual {v12, v8}, Lcom/google/api/client/util/ClassInfo;->getFieldInfo(Ljava/lang/String;)Lcom/google/api/client/util/FieldInfo;

    move-result-object v9

    .line 464
    .local v9, "fieldInfo":Lcom/google/api/client/util/FieldInfo;
    if-eqz v9, :cond_5

    .line 466
    invoke-virtual {v9}, Lcom/google/api/client/util/FieldInfo;->isFinal()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v9}, Lcom/google/api/client/util/FieldInfo;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 467
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "final array/object fields are not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 469
    :cond_4
    :goto_1
    invoke-virtual {v9}, Lcom/google/api/client/util/FieldInfo;->getField()Ljava/lang/reflect/Field;

    move-result-object v1

    .line 470
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 471
    .local v10, "contextSize":I
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 472
    nop

    .line 473
    invoke-virtual {v9}, Lcom/google/api/client/util/FieldInfo;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 472
    const/4 v6, 0x1

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v6}, Lcom/google/api/client/json/JsonParser;->parseValue(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;Z)Ljava/lang/Object;

    move-result-object v2

    .line 478
    .local v2, "fieldValue":Ljava/lang/Object;
    invoke-virtual {p1, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 479
    invoke-virtual {v9, v4, v2}, Lcom/google/api/client/util/FieldInfo;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 480
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "fieldValue":Ljava/lang/Object;
    .end local v10    # "contextSize":I
    move-object/from16 v5, p3

    goto :goto_2

    :cond_5
    if-eqz v13, :cond_6

    .line 482
    move-object v10, v4

    check-cast v10, Lcom/google/api/client/util/GenericData;

    .line 483
    .local v10, "object":Lcom/google/api/client/util/GenericData;
    const/4 v2, 0x0

    const/4 v6, 0x1

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object/from16 v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/google/api/client/json/JsonParser;->parseValue(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;Z)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v10, v8, v1}, Lcom/google/api/client/util/GenericData;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;

    .line 484
    .end local v10    # "object":Lcom/google/api/client/util/GenericData;
    goto :goto_2

    .line 486
    :cond_6
    move-object/from16 v5, p3

    if-eqz v5, :cond_7

    .line 487
    invoke-virtual {v5, v4, v8}, Lcom/google/api/client/json/CustomizeJsonParser;->handleUnrecognizedKey(Ljava/lang/Object;Ljava/lang/String;)V

    .line 489
    :cond_7
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->skipChildren()Lcom/google/api/client/json/JsonParser;

    .line 491
    :goto_2
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v7

    .line 492
    .end local v8    # "key":Ljava/lang/String;
    .end local v9    # "fieldInfo":Lcom/google/api/client/util/FieldInfo;
    goto :goto_0

    .line 493
    :cond_8
    return-void
.end method

.method private parseArray(Ljava/lang/reflect/Field;Ljava/util/Collection;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Lcom/google/api/client/json/CustomizeJsonParser;)V
    .locals 9
    .param p1, "fieldContext"    # Ljava/lang/reflect/Field;
    .param p3, "destinationItemType"    # Ljava/lang/reflect/Type;
    .param p5, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Field;",
            "Ljava/util/Collection<",
            "TT;>;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Type;",
            ">;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 645
    .local p2, "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    .local p4, "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    invoke-direct {p0}, Lcom/google/api/client/json/JsonParser;->startParsingObjectOrArray()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 646
    .local v0, "curToken":Lcom/google/api/client/json/JsonToken;
    :goto_0
    sget-object v1, Lcom/google/api/client/json/JsonToken;->END_ARRAY:Lcom/google/api/client/json/JsonToken;

    if-eq v0, v1, :cond_0

    .line 648
    const/4 v8, 0x1

    move-object v2, p0

    move-object v3, p1

    move-object v6, p2

    move-object v4, p3

    move-object v5, p4

    move-object v7, p5

    .end local p1    # "fieldContext":Ljava/lang/reflect/Field;
    .end local p2    # "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    .end local p3    # "destinationItemType":Ljava/lang/reflect/Type;
    .end local p4    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .end local p5    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .local v3, "fieldContext":Ljava/lang/reflect/Field;
    .local v4, "destinationItemType":Ljava/lang/reflect/Type;
    .local v5, "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .local v6, "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    .local v7, "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    invoke-direct/range {v2 .. v8}, Lcom/google/api/client/json/JsonParser;->parseValue(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;Z)Ljava/lang/Object;

    move-result-object p1

    .line 654
    .local p1, "parsedValue":Ljava/lang/Object;, "TT;"
    invoke-interface {v6, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 655
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 656
    .end local p1    # "parsedValue":Ljava/lang/Object;, "TT;"
    move-object p1, v3

    goto :goto_0

    .line 657
    .end local v3    # "fieldContext":Ljava/lang/reflect/Field;
    .end local v4    # "destinationItemType":Ljava/lang/reflect/Type;
    .end local v5    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .end local v6    # "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    .end local v7    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .local p1, "fieldContext":Ljava/lang/reflect/Field;
    .restart local p2    # "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    .restart local p3    # "destinationItemType":Ljava/lang/reflect/Type;
    .restart local p4    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .restart local p5    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    :cond_0
    return-void
.end method

.method private parseMap(Ljava/lang/reflect/Field;Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Lcom/google/api/client/json/CustomizeJsonParser;)V
    .locals 10
    .param p1, "fieldContext"    # Ljava/lang/reflect/Field;
    .param p3, "valueType"    # Ljava/lang/reflect/Type;
    .param p5, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Field;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Type;",
            ">;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 671
    .local p2, "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    invoke-direct {p0}, Lcom/google/api/client/json/JsonParser;->startParsingObjectOrArray()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 672
    .local v0, "curToken":Lcom/google/api/client/json/JsonToken;
    :goto_0
    sget-object v1, Lcom/google/api/client/json/JsonToken;->FIELD_NAME:Lcom/google/api/client/json/JsonToken;

    if-ne v0, v1, :cond_1

    .line 673
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 674
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    .line 676
    if-eqz p5, :cond_0

    invoke-virtual {p5, p2, v1}, Lcom/google/api/client/json/CustomizeJsonParser;->stopAt(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 677
    return-void

    .line 679
    :cond_0
    nop

    .line 680
    const/4 v9, 0x1

    move-object v3, p0

    move-object v4, p1

    move-object v7, p2

    move-object v5, p3

    move-object v6, p4

    move-object v8, p5

    .end local p1    # "fieldContext":Ljava/lang/reflect/Field;
    .end local p2    # "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local p3    # "valueType":Ljava/lang/reflect/Type;
    .end local p4    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .end local p5    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .local v4, "fieldContext":Ljava/lang/reflect/Field;
    .local v5, "valueType":Ljava/lang/reflect/Type;
    .local v6, "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .local v7, "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v8, "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    invoke-direct/range {v3 .. v9}, Lcom/google/api/client/json/JsonParser;->parseValue(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;Z)Ljava/lang/Object;

    move-result-object p1

    .line 681
    .local p1, "value":Ljava/lang/Object;
    invoke-interface {v7, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 682
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 683
    .end local v1    # "key":Ljava/lang/String;
    .end local p1    # "value":Ljava/lang/Object;
    move-object p1, v4

    goto :goto_0

    .line 684
    .end local v4    # "fieldContext":Ljava/lang/reflect/Field;
    .end local v5    # "valueType":Ljava/lang/reflect/Type;
    .end local v6    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .end local v7    # "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .local p1, "fieldContext":Ljava/lang/reflect/Field;
    .restart local p2    # "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local p3    # "valueType":Ljava/lang/reflect/Type;
    .restart local p4    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .restart local p5    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    :cond_1
    return-void
.end method

.method private final parseValue(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;Z)Ljava/lang/Object;
    .locals 20
    .param p1, "fieldContext"    # Ljava/lang/reflect/Field;
    .param p2, "valueType"    # Ljava/lang/reflect/Type;
    .param p4, "destination"    # Ljava/lang/Object;
    .param p5, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .param p6, "handlePolymorphic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Field;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Type;",
            ">;",
            "Ljava/lang/Object;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            "Z)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 705
    .local p3, "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    move-object/from16 v2, p1

    move-object/from16 v5, p3

    move-object/from16 v7, p4

    move-object/from16 v6, p5

    move-object/from16 v0, p2

    invoke-static {v5, v0}, Lcom/google/api/client/util/Data;->resolveWildcardTypeOrTypeVariable(Ljava/util/List;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v8

    .line 707
    .end local p2    # "valueType":Ljava/lang/reflect/Type;
    .local v8, "valueType":Ljava/lang/reflect/Type;
    instance-of v0, v8, Ljava/lang/Class;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, v8

    check-cast v0, Ljava/lang/Class;

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 708
    .local v0, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    instance-of v3, v8, Ljava/lang/reflect/ParameterizedType;

    if-eqz v3, :cond_1

    .line 709
    move-object v3, v8

    check-cast v3, Ljava/lang/reflect/ParameterizedType;

    invoke-static {v3}, Lcom/google/api/client/util/Types;->getRawClass(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v0

    move-object v9, v0

    goto :goto_1

    .line 708
    :cond_1
    move-object v9, v0

    .line 712
    .end local v0    # "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v9, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    const-class v0, Ljava/lang/Void;

    if-ne v9, v0, :cond_2

    .line 713
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->skipChildren()Lcom/google/api/client/json/JsonParser;

    .line 714
    return-object v1

    .line 717
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getCurrentToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v10

    .line 719
    .local v10, "token":Lcom/google/api/client/json/JsonToken;
    :try_start_0
    sget-object v0, Lcom/google/api/client/json/JsonParser$1;->$SwitchMap$com$google$api$client$json$JsonToken:[I

    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getCurrentToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/api/client/json/JsonToken;->ordinal()I

    move-result v3

    aget v0, v0, v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_5

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    .line 874
    move-object v15, v6

    :try_start_1
    new-instance v0, Ljava/lang/IllegalArgumentException;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_4

    goto/16 :goto_1d

    .line 861
    :pswitch_0
    if-eqz v9, :cond_3

    :try_start_2
    invoke-virtual {v9}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_3
    move v3, v4

    :cond_4
    const-string v0, "primitive number field but found a JSON null"

    invoke-static {v3, v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 863
    if-eqz v9, :cond_6

    .line 864
    invoke-virtual {v9}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    and-int/lit16 v0, v0, 0x600

    if-eqz v0, :cond_6

    .line 865
    const-class v0, Ljava/util/Collection;

    invoke-static {v9, v0}, Lcom/google/api/client/util/Types;->isAssignableToOrFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 866
    invoke-static {v8}, Lcom/google/api/client/util/Data;->newCollectionInstance(Ljava/lang/reflect/Type;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/util/Data;->nullOf(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 868
    :cond_5
    const-class v0, Ljava/util/Map;

    invoke-static {v9, v0}, Lcom/google/api/client/util/Types;->isAssignableToOrFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 869
    invoke-static {v9}, Lcom/google/api/client/util/Data;->newMapInstance(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/util/Data;->nullOf(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 872
    :cond_6
    invoke-static {v5, v8}, Lcom/google/api/client/util/Types;->getRawArrayComponentType(Ljava/util/List;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/google/api/client/util/Data;->nullOf(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 847
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 851
    .local v0, "text":Ljava/lang/String;
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq v9, v1, :cond_7

    const-class v1, Ljava/lang/Float;

    if-eq v9, v1, :cond_7

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq v9, v1, :cond_7

    const-class v1, Ljava/lang/Double;

    if-ne v9, v1, :cond_8

    :cond_7
    const-string v1, "nan"

    .line 853
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    const-string v1, "infinity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    const-string v1, "-infinity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 854
    :cond_8
    if-eqz v9, :cond_a

    const-class v1, Ljava/lang/Number;

    .line 855
    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_a

    if-eqz v2, :cond_9

    const-class v1, Lcom/google/api/client/json/JsonString;

    .line 856
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    if-eqz v1, :cond_9

    goto :goto_2

    :cond_9
    goto :goto_3

    :cond_a
    :goto_2
    move v3, v4

    :goto_3
    const-string v1, "number field formatted as a JSON string must use the @JsonString annotation"

    .line 854
    invoke-static {v3, v1}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 859
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8, v1}, Lcom/google/api/client/util/Data;->parsePrimitiveValue(Ljava/lang/reflect/Type;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 817
    .end local v0    # "text":Ljava/lang/String;
    :pswitch_2
    if-eqz v2, :cond_c

    const-class v0, Lcom/google/api/client/json/JsonString;

    .line 818
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-nez v0, :cond_d

    :cond_c
    move v3, v4

    :cond_d
    const-string v0, "number type formatted as a JSON number cannot use @JsonString annotation"

    .line 817
    invoke-static {v3, v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 820
    if-eqz v9, :cond_1c

    const-class v0, Ljava/math/BigDecimal;

    invoke-virtual {v9, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_e

    goto/16 :goto_a

    .line 823
    :cond_e
    const-class v0, Ljava/math/BigInteger;

    if-ne v9, v0, :cond_f

    .line 824
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getBigIntegerValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0

    .line 826
    :cond_f
    const-class v0, Ljava/lang/Double;

    if-eq v9, v0, :cond_1b

    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v9, v0, :cond_10

    goto/16 :goto_9

    .line 829
    :cond_10
    const-class v0, Ljava/lang/Long;

    if-eq v9, v0, :cond_1a

    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v9, v0, :cond_11

    goto :goto_8

    .line 832
    :cond_11
    const-class v0, Ljava/lang/Float;

    if-eq v9, v0, :cond_19

    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v9, v0, :cond_12

    goto :goto_7

    .line 835
    :cond_12
    const-class v0, Ljava/lang/Integer;

    if-eq v9, v0, :cond_18

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v9, v0, :cond_13

    goto :goto_6

    .line 838
    :cond_13
    const-class v0, Ljava/lang/Short;

    if-eq v9, v0, :cond_17

    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v9, v0, :cond_14

    goto :goto_5

    .line 841
    :cond_14
    const-class v0, Ljava/lang/Byte;

    if-eq v9, v0, :cond_16

    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v9, v0, :cond_15

    goto :goto_4

    .line 844
    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "expected numeric type but got "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v8    # "valueType":Ljava/lang/reflect/Type;
    .end local v9    # "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "token":Lcom/google/api/client/json/JsonToken;
    .end local p1    # "fieldContext":Ljava/lang/reflect/Field;
    .end local p3    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .end local p4    # "destination":Ljava/lang/Object;
    .end local p5    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .end local p6    # "handlePolymorphic":Z
    throw v0

    .line 842
    .restart local v8    # "valueType":Ljava/lang/reflect/Type;
    .restart local v9    # "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v10    # "token":Lcom/google/api/client/json/JsonToken;
    .restart local p1    # "fieldContext":Ljava/lang/reflect/Field;
    .restart local p3    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .restart local p4    # "destination":Ljava/lang/Object;
    .restart local p5    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .restart local p6    # "handlePolymorphic":Z
    :cond_16
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getByteValue()B

    move-result v0

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    return-object v0

    .line 839
    :cond_17
    :goto_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getShortValue()S

    move-result v0

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    return-object v0

    .line 836
    :cond_18
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getIntValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 833
    :cond_19
    :goto_7
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getFloatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    .line 830
    :cond_1a
    :goto_8
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getLongValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 827
    :cond_1b
    :goto_9
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getDoubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 821
    :cond_1c
    :goto_a
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getDecimalValue()Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0

    .line 811
    :pswitch_3
    if-eqz v8, :cond_1e

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v9, v0, :cond_1e

    if-eqz v9, :cond_1d

    const-class v0, Ljava/lang/Boolean;

    .line 812
    invoke-virtual {v9, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1d

    goto :goto_b

    :cond_1d
    move v0, v3

    goto :goto_c

    :cond_1e
    :goto_b
    move v0, v4

    :goto_c
    const-string v1, "expected type Boolean or boolean but got %s"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v8, v4, v3

    .line 811
    invoke-static {v0, v1, v4}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 814
    sget-object v0, Lcom/google/api/client/json/JsonToken;->VALUE_TRUE:Lcom/google/api/client/json/JsonToken;

    if-ne v10, v0, :cond_1f

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_d

    :cond_1f
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_5

    :goto_d
    return-object v0

    .line 722
    :pswitch_4
    :try_start_3
    invoke-static {v8}, Lcom/google/api/client/util/Types;->isArray(Ljava/lang/reflect/Type;)Z

    move-result v0
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3

    .line 723
    .local v0, "isArray":Z
    if-eqz v8, :cond_21

    if-nez v0, :cond_21

    if-eqz v9, :cond_20

    :try_start_4
    const-class v1, Ljava/util/Collection;

    .line 724
    invoke-static {v9, v1}, Lcom/google/api/client/util/Types;->isAssignableToOrFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v1
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_5

    if-eqz v1, :cond_20

    goto :goto_e

    :cond_20
    move v1, v3

    goto :goto_f

    :cond_21
    :goto_e
    move v1, v4

    :goto_f
    :try_start_5
    const-string v11, "expected collection or array type but got %s"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v8, v4, v3

    .line 723
    invoke-static {v1, v11, v4}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_3

    .line 726
    const/4 v1, 0x0

    .line 727
    .local v1, "collectionValue":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    if-eqz v6, :cond_22

    if-eqz v2, :cond_22

    .line 728
    :try_start_6
    invoke-virtual {v6, v7, v2}, Lcom/google/api/client/json/CustomizeJsonParser;->newInstanceForArray(Ljava/lang/Object;Ljava/lang/reflect/Field;)Ljava/util/Collection;

    move-result-object v3

    move-object v1, v3

    .line 730
    :cond_22
    if-nez v1, :cond_23

    .line 731
    invoke-static {v8}, Lcom/google/api/client/util/Data;->newCollectionInstance(Ljava/lang/reflect/Type;)Ljava/util/Collection;

    move-result-object v3

    move-object v1, v3

    goto :goto_10

    .line 730
    :cond_23
    move-object v3, v1

    .line 733
    .end local v1    # "collectionValue":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    .local v3, "collectionValue":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    :goto_10
    const/4 v1, 0x0

    .line 734
    .local v1, "subType":Ljava/lang/reflect/Type;
    if-eqz v0, :cond_24

    .line 735
    invoke-static {v8}, Lcom/google/api/client/util/Types;->getArrayComponentType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v4

    move-object v1, v4

    goto :goto_11

    .line 736
    :cond_24
    if-eqz v9, :cond_25

    const-class v4, Ljava/lang/Iterable;

    invoke-virtual {v4, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_25

    .line 737
    invoke-static {v8}, Lcom/google/api/client/util/Types;->getIterableParameter(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v4
    :try_end_6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_5

    move-object v1, v4

    .line 739
    :cond_25
    :goto_11
    :try_start_7
    invoke-static {v5, v1}, Lcom/google/api/client/util/Data;->resolveWildcardTypeOrTypeVariable(Ljava/util/List;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v4

    .line 740
    .end local v1    # "subType":Ljava/lang/reflect/Type;
    .local v4, "subType":Ljava/lang/reflect/Type;
    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/google/api/client/json/JsonParser;->parseArray(Ljava/lang/reflect/Field;Ljava/util/Collection;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 741
    if-eqz v0, :cond_26

    .line 742
    invoke-static {v5, v4}, Lcom/google/api/client/util/Types;->getRawArrayComponentType(Ljava/util/List;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/google/api/client/util/Types;->toArray(Ljava/util/Collection;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 744
    :cond_26
    return-object v3

    .line 748
    .end local v0    # "isArray":Z
    .end local v3    # "collectionValue":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    .end local v4    # "subType":Ljava/lang/reflect/Type;
    :pswitch_5
    nop

    .line 749
    invoke-static {v8}, Lcom/google/api/client/util/Types;->isArray(Ljava/lang/reflect/Type;)Z

    move-result v0

    if-nez v0, :cond_27

    move v0, v4

    goto :goto_12

    :cond_27
    move v0, v3

    :goto_12
    const-string v2, "expected object or map type but got %s"

    new-array v11, v4, [Ljava/lang/Object;

    aput-object v8, v11, v3

    .line 748
    invoke-static {v0, v2, v11}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 751
    if-eqz p6, :cond_28

    invoke-static {v9}, Lcom/google/api/client/json/JsonParser;->getCachedTypemapFieldFor(Ljava/lang/Class;)Ljava/lang/reflect/Field;

    move-result-object v0

    goto :goto_13

    :cond_28
    move-object v0, v1

    :goto_13
    move-object v11, v0

    .line 752
    .local v11, "typemapField":Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    .line 753
    .local v0, "newInstance":Ljava/lang/Object;
    if-eqz v9, :cond_29

    if-eqz v6, :cond_29

    .line 754
    invoke-virtual {v6, v7, v9}, Lcom/google/api/client/json/CustomizeJsonParser;->newInstanceForObject(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    .line 756
    :cond_29
    if-eqz v9, :cond_2a

    const-class v2, Ljava/util/Map;

    invoke-static {v9, v2}, Lcom/google/api/client/util/Types;->isAssignableToOrFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2a

    move v2, v4

    goto :goto_14

    :cond_2a
    move v2, v3

    :goto_14
    move v12, v2

    .line 757
    .local v12, "isMap":Z
    if-eqz v11, :cond_2b

    .line 758
    new-instance v2, Lcom/google/api/client/json/GenericJson;

    invoke-direct {v2}, Lcom/google/api/client/json/GenericJson;-><init>()V

    move-object v0, v2

    move-object v13, v0

    goto :goto_16

    .line 759
    :cond_2b
    if-nez v0, :cond_2e

    .line 761
    if-nez v12, :cond_2d

    if-nez v9, :cond_2c

    goto :goto_15

    .line 764
    :cond_2c
    invoke-static {v9}, Lcom/google/api/client/util/Types;->newInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    move-object v13, v0

    goto :goto_16

    .line 762
    :cond_2d
    :goto_15
    invoke-static {v9}, Lcom/google/api/client/util/Data;->newMapInstance(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v2

    move-object v0, v2

    move-object v13, v0

    goto :goto_16

    .line 759
    :cond_2e
    move-object v13, v0

    .line 767
    .end local v0    # "newInstance":Ljava/lang/Object;
    .local v13, "newInstance":Ljava/lang/Object;
    :goto_16
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v14, v0

    .line 768
    .local v14, "contextSize":I
    if-eqz v8, :cond_2f

    .line 769
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_7} :catch_3

    .line 771
    :cond_2f
    if-eqz v12, :cond_32

    :try_start_8
    const-class v0, Lcom/google/api/client/util/GenericData;

    invoke-virtual {v0, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_32

    .line 772
    const-class v0, Ljava/util/Map;

    invoke-virtual {v0, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0
    :try_end_8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_8} :catch_0

    if-eqz v0, :cond_30

    .line 773
    :try_start_9
    invoke-static {v8}, Lcom/google/api/client/util/Types;->getMapValueParameter(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v1
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_9 .. :try_end_9} :catch_3

    :cond_30
    nop

    .line 774
    .local v1, "subValueType":Ljava/lang/reflect/Type;
    if-eqz v1, :cond_31

    .line 776
    :try_start_a
    move-object v3, v13

    check-cast v3, Ljava/util/Map;

    .line 777
    .local v3, "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v2, p1

    move-object v4, v1

    move-object/from16 v1, p0

    .end local v1    # "subValueType":Ljava/lang/reflect/Type;
    .local v4, "subValueType":Ljava/lang/reflect/Type;
    invoke-direct/range {v1 .. v6}, Lcom/google/api/client/json/JsonParser;->parseMap(Ljava/lang/reflect/Field;Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Lcom/google/api/client/json/CustomizeJsonParser;)V
    :try_end_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_a} :catch_0

    move-object v1, v4

    move-object v15, v6

    .line 778
    .end local v4    # "subValueType":Ljava/lang/reflect/Type;
    .restart local v1    # "subValueType":Ljava/lang/reflect/Type;
    return-object v13

    .line 774
    .end local v3    # "destinationMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_31
    move-object v15, v6

    goto :goto_17

    .line 876
    .end local v1    # "subValueType":Ljava/lang/reflect/Type;
    .end local v11    # "typemapField":Ljava/lang/reflect/Field;
    .end local v12    # "isMap":Z
    .end local v13    # "newInstance":Ljava/lang/Object;
    .end local v14    # "contextSize":I
    :catch_0
    move-exception v0

    move-object v15, v6

    goto/16 :goto_1c

    .line 771
    .restart local v11    # "typemapField":Ljava/lang/reflect/Field;
    .restart local v12    # "isMap":Z
    .restart local v13    # "newInstance":Ljava/lang/Object;
    .restart local v14    # "contextSize":I
    :cond_32
    move-object v15, v6

    .line 781
    :goto_17
    move-object/from16 v1, p0

    :try_start_b
    invoke-direct {v1, v5, v13, v15}, Lcom/google/api/client/json/JsonParser;->parse(Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 782
    if-eqz v8, :cond_33

    .line 783
    invoke-virtual {v5, v14}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 785
    :cond_33
    if-nez v11, :cond_34

    .line 786
    return-object v13

    .line 790
    :cond_34
    move-object v0, v13

    check-cast v0, Lcom/google/api/client/json/GenericJson;

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/api/client/json/GenericJson;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v16, v0

    .line 791
    .local v16, "typeValueObject":Ljava/lang/Object;
    if-eqz v16, :cond_35

    move v0, v4

    goto :goto_18

    :cond_35
    move v0, v3

    :goto_18
    const-string v2, "No value specified for @JsonPolymorphicTypeMap field"

    invoke-static {v0, v2}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 793
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 794
    .local v0, "typeValue":Ljava/lang/String;
    const-class v2, Lcom/google/api/client/json/JsonPolymorphicTypeMap;

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/google/api/client/json/JsonPolymorphicTypeMap;

    move-object/from16 v17, v2

    .line 795
    .local v17, "typeMap":Lcom/google/api/client/json/JsonPolymorphicTypeMap;
    const/4 v2, 0x0

    .line 796
    .local v2, "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface/range {v17 .. v17}, Lcom/google/api/client/json/JsonPolymorphicTypeMap;->typeDefinitions()[Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;

    move-result-object v6

    array-length v3, v6

    const/4 v4, 0x0

    :goto_19
    if-ge v4, v3, :cond_37

    aget-object v19, v6, v4

    .line 797
    .local v19, "typeDefinition":Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;
    invoke-interface/range {v19 .. v19}, Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;->key()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 798
    invoke-interface/range {v19 .. v19}, Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;->ref()Ljava/lang/Class;

    move-result-object v1

    move-object v2, v1

    .line 799
    goto :goto_1a

    .line 796
    .end local v19    # "typeDefinition":Lcom/google/api/client/json/JsonPolymorphicTypeMap$TypeDef;
    :cond_36
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v1, p0

    goto :goto_19

    .line 802
    :cond_37
    :goto_1a
    if-eqz v2, :cond_38

    const/4 v3, 0x1

    goto :goto_1b

    :cond_38
    const/4 v3, 0x0

    :goto_1b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No TypeDef annotation found with key: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 804
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getFactory()Lcom/google/api/client/json/JsonFactory;

    move-result-object v1

    .line 806
    .local v1, "factory":Lcom/google/api/client/json/JsonFactory;
    invoke-virtual {v1, v13}, Lcom/google/api/client/json/JsonFactory;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/api/client/json/JsonFactory;->createJsonParser(Ljava/lang/String;)Lcom/google/api/client/json/JsonParser;

    move-result-object v3

    .line 807
    .local v3, "parser":Lcom/google/api/client/json/JsonParser;
    invoke-direct {v3}, Lcom/google/api/client/json/JsonParser;->startParsing()Lcom/google/api/client/json/JsonToken;
    :try_end_b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_b .. :try_end_b} :catch_2

    .line 808
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object/from16 v18, v0

    move-object/from16 v19, v1

    move-object v0, v3

    move-object/from16 v1, p1

    move-object/from16 v3, p3

    .end local v1    # "factory":Lcom/google/api/client/json/JsonFactory;
    .end local v3    # "parser":Lcom/google/api/client/json/JsonParser;
    .local v0, "parser":Lcom/google/api/client/json/JsonParser;
    .local v18, "typeValue":Ljava/lang/String;
    .local v19, "factory":Lcom/google/api/client/json/JsonFactory;
    :try_start_c
    invoke-direct/range {v0 .. v6}, Lcom/google/api/client/json/JsonParser;->parseValue(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;Z)Ljava/lang/Object;

    move-result-object v4
    :try_end_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_c} :catch_1

    move-object v3, v0

    move-object v0, v2

    move-object v2, v1

    .end local v2    # "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v0, "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "parser":Lcom/google/api/client/json/JsonParser;
    return-object v4

    .line 876
    .end local v0    # "typeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "parser":Lcom/google/api/client/json/JsonParser;
    .end local v11    # "typemapField":Ljava/lang/reflect/Field;
    .end local v12    # "isMap":Z
    .end local v13    # "newInstance":Ljava/lang/Object;
    .end local v14    # "contextSize":I
    .end local v16    # "typeValueObject":Ljava/lang/Object;
    .end local v17    # "typeMap":Lcom/google/api/client/json/JsonPolymorphicTypeMap;
    .end local v18    # "typeValue":Ljava/lang/String;
    .end local v19    # "factory":Lcom/google/api/client/json/JsonFactory;
    :catch_1
    move-exception v0

    move-object v2, v1

    goto :goto_1f

    :catch_2
    move-exception v0

    :goto_1c
    move-object/from16 v2, p1

    goto :goto_1f

    :catch_3
    move-exception v0

    move-object/from16 v2, p1

    goto :goto_1e

    .line 874
    :goto_1d
    :try_start_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unexpected JSON node type: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v8    # "valueType":Ljava/lang/reflect/Type;
    .end local v9    # "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "token":Lcom/google/api/client/json/JsonToken;
    .end local p1    # "fieldContext":Ljava/lang/reflect/Field;
    .end local p3    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .end local p4    # "destination":Ljava/lang/Object;
    .end local p5    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .end local p6    # "handlePolymorphic":Z
    throw v0
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d .. :try_end_d} :catch_4

    .line 876
    .restart local v8    # "valueType":Ljava/lang/reflect/Type;
    .restart local v9    # "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v10    # "token":Lcom/google/api/client/json/JsonToken;
    .restart local p1    # "fieldContext":Ljava/lang/reflect/Field;
    .restart local p3    # "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    .restart local p4    # "destination":Ljava/lang/Object;
    .restart local p5    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .restart local p6    # "handlePolymorphic":Z
    :catch_4
    move-exception v0

    goto :goto_1f

    :catch_5
    move-exception v0

    :goto_1e
    move-object v15, v6

    .line 878
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    :goto_1f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 879
    .local v1, "contextStringBuilder":Ljava/lang/StringBuilder;
    invoke-virtual/range {p0 .. p0}, Lcom/google/api/client/json/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    .line 880
    .local v3, "currentName":Ljava/lang/String;
    if-eqz v3, :cond_39

    .line 881
    const-string v4, "key "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 883
    :cond_39
    if-eqz v2, :cond_3b

    .line 884
    if-eqz v3, :cond_3a

    .line 885
    const-string v4, ", "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 887
    :cond_3a
    const-string v4, "field "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 889
    :cond_3b
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private startParsing()Lcom/google/api/client/json/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->getCurrentToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 220
    .local v0, "currentToken":Lcom/google/api/client/json/JsonToken;
    if-nez v0, :cond_0

    .line 221
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 223
    :cond_0
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    const-string v2, "no JSON input found"

    invoke-static {v1, v2}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 224
    return-object v0
.end method

.method private startParsingObjectOrArray()Lcom/google/api/client/json/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 240
    invoke-direct {p0}, Lcom/google/api/client/json/JsonParser;->startParsing()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 241
    .local v0, "currentToken":Lcom/google/api/client/json/JsonToken;
    sget-object v1, Lcom/google/api/client/json/JsonParser$1;->$SwitchMap$com$google$api$client$json$JsonToken:[I

    invoke-virtual {v0}, Lcom/google/api/client/json/JsonToken;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_2

    .line 249
    :pswitch_0
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 250
    goto :goto_2

    .line 243
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 244
    sget-object v1, Lcom/google/api/client/json/JsonToken;->FIELD_NAME:Lcom/google/api/client/json/JsonToken;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/google/api/client/json/JsonToken;->END_OBJECT:Lcom/google/api/client/json/JsonToken;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    invoke-static {v1, v0}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 247
    nop

    .line 254
    :goto_2
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public abstract close()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getBigIntegerValue()Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getByteValue()B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getCurrentName()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getCurrentToken()Lcom/google/api/client/json/JsonToken;
.end method

.method public abstract getDecimalValue()Ljava/math/BigDecimal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getDoubleValue()D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getFactory()Lcom/google/api/client/json/JsonFactory;
.end method

.method public abstract getFloatValue()F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getIntValue()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getLongValue()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getShortValue()S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getText()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract nextToken()Lcom/google/api/client/json/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final parse(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 312
    .local p1, "destinationClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/api/client/json/JsonParser;->parse(Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final parse(Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/lang/Object;
    .locals 1
    .param p2, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 336
    .local p1, "destinationClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/google/api/client/json/JsonParser;->parse(Ljava/lang/reflect/Type;ZLcom/google/api/client/json/CustomizeJsonParser;)Ljava/lang/Object;

    move-result-object v0

    .line 337
    .local v0, "result":Ljava/lang/Object;, "TT;"
    return-object v0
.end method

.method public parse(Ljava/lang/reflect/Type;Z)Ljava/lang/Object;
    .locals 1
    .param p1, "dataType"    # Ljava/lang/reflect/Type;
    .param p2, "close"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 355
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/api/client/json/JsonParser;->parse(Ljava/lang/reflect/Type;ZLcom/google/api/client/json/CustomizeJsonParser;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/reflect/Type;ZLcom/google/api/client/json/CustomizeJsonParser;)Ljava/lang/Object;
    .locals 8
    .param p1, "dataType"    # Ljava/lang/reflect/Type;
    .param p2, "close"    # Z
    .param p3, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 379
    :try_start_0
    const-class v0, Ljava/lang/Void;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-nez v0, :cond_0

    .line 380
    :try_start_1
    invoke-direct {p0}, Lcom/google/api/client/json/JsonParser;->startParsing()Lcom/google/api/client/json/JsonToken;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 384
    :catchall_0
    move-exception v0

    move-object v3, p1

    move-object v6, p3

    goto :goto_1

    .line 382
    :cond_0
    :goto_0
    :try_start_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    const/4 v5, 0x0

    const/4 v7, 0x1

    const/4 v2, 0x0

    move-object v1, p0

    move-object v3, p1

    move-object v6, p3

    .end local p1    # "dataType":Ljava/lang/reflect/Type;
    .end local p3    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .local v3, "dataType":Ljava/lang/reflect/Type;
    .local v6, "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    :try_start_3
    invoke-direct/range {v1 .. v7}, Lcom/google/api/client/json/JsonParser;->parseValue(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;Z)Ljava/lang/Object;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 384
    if-eqz p2, :cond_1

    .line 385
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 382
    :cond_1
    return-object p1

    .line 384
    :catchall_1
    move-exception v0

    goto :goto_1

    .end local v3    # "dataType":Ljava/lang/reflect/Type;
    .end local v6    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .restart local p1    # "dataType":Ljava/lang/reflect/Type;
    .restart local p3    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    :catchall_2
    move-exception v0

    move-object v3, p1

    move-object v6, p3

    .end local p1    # "dataType":Ljava/lang/reflect/Type;
    .end local p3    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .restart local v3    # "dataType":Ljava/lang/reflect/Type;
    .restart local v6    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    :goto_1
    if-eqz p2, :cond_2

    .line 385
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 387
    :cond_2
    throw v0
.end method

.method public final parse(Ljava/lang/Object;)V
    .locals 1
    .param p1, "destination"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 403
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/api/client/json/JsonParser;->parse(Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 404
    return-void
.end method

.method public final parse(Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;)V
    .locals 2
    .param p1, "destination"    # Ljava/lang/Object;
    .param p2, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 423
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 424
    .local v0, "context":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Type;>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 425
    invoke-direct {p0, v0, p1, p2}, Lcom/google/api/client/json/JsonParser;->parse(Ljava/util/ArrayList;Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 426
    return-void
.end method

.method public final parseAndClose(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 148
    .local p1, "destinationClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/api/client/json/JsonParser;->parseAndClose(Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final parseAndClose(Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/lang/Object;
    .locals 1
    .param p2, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 166
    .local p1, "destinationClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/google/api/client/json/JsonParser;->parse(Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 166
    return-object v0

    .line 168
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 169
    throw v0
.end method

.method public final parseAndClose(Ljava/lang/Object;)V
    .locals 1
    .param p1, "destination"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 270
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/api/client/json/JsonParser;->parseAndClose(Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 271
    return-void
.end method

.method public final parseAndClose(Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;)V
    .locals 1
    .param p1, "destination"    # Ljava/lang/Object;
    .param p2, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 290
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/google/api/client/json/JsonParser;->parse(Ljava/lang/Object;Lcom/google/api/client/json/CustomizeJsonParser;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 292
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 293
    nop

    .line 294
    return-void

    .line 292
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 293
    throw v0
.end method

.method public final parseArray(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/Collection<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 577
    .local p1, "destinationCollectionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/api/client/json/JsonParser;->parseArray(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public final parseArray(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/util/Collection;
    .locals 1
    .param p3, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")",
            "Ljava/util/Collection<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 595
    .local p1, "destinationCollectionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    nop

    .line 596
    invoke-static {p1}, Lcom/google/api/client/util/Data;->newCollectionInstance(Ljava/lang/reflect/Type;)Ljava/util/Collection;

    move-result-object v0

    .line 597
    .local v0, "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    invoke-virtual {p0, v0, p2, p3}, Lcom/google/api/client/json/JsonParser;->parseArray(Ljava/util/Collection;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 598
    return-object v0
.end method

.method public final parseArray(Ljava/util/Collection;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "-TT;>;",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 612
    .local p1, "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<-TT;>;"
    .local p2, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/api/client/json/JsonParser;->parseArray(Ljava/util/Collection;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 613
    return-void
.end method

.method public final parseArray(Ljava/util/Collection;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)V
    .locals 6
    .param p3, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "-TT;>;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 628
    .local p1, "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<-TT;>;"
    .local p2, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    .end local p1    # "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<-TT;>;"
    .end local p2    # "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .end local p3    # "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    .local v2, "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<-TT;>;"
    .local v3, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local v5, "customizeParser":Lcom/google/api/client/json/CustomizeJsonParser;
    invoke-direct/range {v0 .. v5}, Lcom/google/api/client/json/JsonParser;->parseArray(Ljava/lang/reflect/Field;Ljava/util/Collection;Ljava/lang/reflect/Type;Ljava/util/ArrayList;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 630
    return-void
.end method

.method public final parseArrayAndClose(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/Collection<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 507
    .local p1, "destinationCollectionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/api/client/json/JsonParser;->parseArrayAndClose(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public final parseArrayAndClose(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/util/Collection;
    .locals 1
    .param p3, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")",
            "Ljava/util/Collection<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 525
    .local p1, "destinationCollectionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/api/client/json/JsonParser;->parseArray(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)Ljava/util/Collection;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 527
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 525
    return-object v0

    .line 527
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 528
    throw v0
.end method

.method public final parseArrayAndClose(Ljava/util/Collection;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "-TT;>;",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 543
    .local p1, "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<-TT;>;"
    .local p2, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/api/client/json/JsonParser;->parseArrayAndClose(Ljava/util/Collection;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)V

    .line 544
    return-void
.end method

.method public final parseArrayAndClose(Ljava/util/Collection;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)V
    .locals 1
    .param p3, "customizeParser"    # Lcom/google/api/client/json/CustomizeJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "-TT;>;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/api/client/json/CustomizeJsonParser;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 560
    .local p1, "destinationCollection":Ljava/util/Collection;, "Ljava/util/Collection<-TT;>;"
    .local p2, "destinationItemClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/api/client/json/JsonParser;->parseArray(Ljava/util/Collection;Ljava/lang/Class;Lcom/google/api/client/json/CustomizeJsonParser;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 562
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 563
    nop

    .line 564
    return-void

    .line 562
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->close()V

    .line 563
    throw v0
.end method

.method public abstract skipChildren()Lcom/google/api/client/json/JsonParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final skipToKey(Ljava/util/Set;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    .local p1, "keysToFind":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/google/api/client/json/JsonParser;->startParsingObjectOrArray()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 204
    .local v0, "curToken":Lcom/google/api/client/json/JsonToken;
    :goto_0
    sget-object v1, Lcom/google/api/client/json/JsonToken;->FIELD_NAME:Lcom/google/api/client/json/JsonToken;

    if-ne v0, v1, :cond_1

    .line 205
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 206
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    .line 207
    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 208
    return-object v1

    .line 210
    :cond_0
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->skipChildren()Lcom/google/api/client/json/JsonParser;

    .line 211
    invoke-virtual {p0}, Lcom/google/api/client/json/JsonParser;->nextToken()Lcom/google/api/client/json/JsonToken;

    move-result-object v0

    .line 212
    .end local v1    # "key":Ljava/lang/String;
    goto :goto_0

    .line 213
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public final skipToKey(Ljava/lang/String;)V
    .locals 1
    .param p1, "keyToFind"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 185
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/api/client/json/JsonParser;->skipToKey(Ljava/util/Set;)Ljava/lang/String;

    .line 186
    return-void
.end method
