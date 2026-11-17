.class public Lcom/google/api/client/http/UriTemplate;
.super Ljava/lang/Object;
.source "UriTemplate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/client/http/UriTemplate$CompositeOutput;
    }
.end annotation


# static fields
.field private static final COMPOSITE_NON_EXPLODE_JOINER:Ljava/lang/String; = ","

.field static final COMPOSITE_PREFIXES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/google/api/client/http/UriTemplate$CompositeOutput;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/api/client/http/UriTemplate;->COMPOSITE_PREFIXES:Ljava/util/Map;

    .line 86
    invoke-static {}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->values()[Lcom/google/api/client/http/UriTemplate$CompositeOutput;

    .line 87
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static expand(Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/String;
    .locals 22
    .param p0, "pathUri"    # Ljava/lang/String;
    .param p1, "parameters"    # Ljava/lang/Object;
    .param p2, "addUnusedParamsAsQueryParams"    # Z

    .line 284
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Lcom/google/api/client/http/UriTemplate;->getMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    .line 285
    .local v1, "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .local v2, "pathBuf":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 287
    .local v3, "cur":I
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    .line 288
    .local v4, "length":I
    :goto_0
    if-ge v3, v4, :cond_10

    .line 289
    const/16 v5, 0x7b

    invoke-virtual {v0, v5, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 290
    .local v5, "next":I
    const/4 v6, -0x1

    if-ne v5, v6, :cond_1

    .line 291
    if-nez v3, :cond_0

    if-nez p2, :cond_0

    .line 293
    return-object v0

    .line 295
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    move-object/from16 v18, v1

    goto/16 :goto_a

    .line 298
    :cond_1
    invoke-virtual {v0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    add-int/lit8 v6, v5, 0x2

    const/16 v7, 0x7d

    invoke-virtual {v0, v7, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    .line 300
    .local v6, "close":I
    add-int/lit8 v3, v6, 0x1

    .line 302
    add-int/lit8 v7, v5, 0x1

    invoke-virtual {v0, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 303
    .local v7, "templates":Ljava/lang/String;
    invoke-static {v7}, Lcom/google/api/client/http/UriTemplate;->getCompositeOutput(Ljava/lang/String;)Lcom/google/api/client/http/UriTemplate$CompositeOutput;

    move-result-object v8

    .line 304
    .local v8, "compositeOutput":Lcom/google/api/client/http/UriTemplate$CompositeOutput;
    nop

    .line 305
    const/16 v9, 0x2c

    invoke-static {v9}, Lcom/google/common/base/Splitter;->on(C)Lcom/google/common/base/Splitter;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/google/common/base/Splitter;->splitToList(Ljava/lang/CharSequence;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v9

    .line 306
    .local v9, "templateIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/String;>;"
    const/4 v10, 0x1

    .line 307
    .local v10, "isFirstParameter":Z
    :goto_1
    invoke-interface {v9}, Ljava/util/ListIterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_f

    .line 308
    invoke-interface {v9}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 309
    .local v11, "template":Ljava/lang/String;
    const-string v12, "*"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    .line 311
    .local v12, "containsExplodeModifier":Z
    invoke-interface {v9}, Ljava/util/ListIterator;->nextIndex()I

    move-result v13

    const/4 v15, 0x1

    if-ne v13, v15, :cond_2

    .line 312
    invoke-virtual {v8}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getVarNameStartIndex()I

    move-result v13

    goto :goto_2

    :cond_2
    const/4 v13, 0x0

    .line 313
    .local v13, "varNameStartIndex":I
    :goto_2
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v16

    .line 314
    .local v16, "varNameEndIndex":I
    if-eqz v12, :cond_3

    .line 316
    add-int/lit8 v16, v16, -0x1

    move/from16 v14, v16

    const/16 v17, 0x0

    goto :goto_3

    .line 314
    :cond_3
    move/from16 v14, v16

    const/16 v17, 0x0

    .line 319
    .end local v16    # "varNameEndIndex":I
    .local v14, "varNameEndIndex":I
    :goto_3
    move/from16 v16, v15

    invoke-virtual {v11, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    .line 321
    .local v15, "varName":Ljava/lang/String;
    invoke-interface {v1, v15}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 322
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_4

    .line 324
    move-object/from16 v0, p0

    goto :goto_1

    .line 326
    :cond_4
    if-nez v10, :cond_5

    .line 327
    move-object/from16 v18, v1

    .end local v1    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v18, "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v8}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getExplodeJoiner()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 329
    .end local v18    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v1    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_5
    move-object/from16 v18, v1

    .end local v1    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v18    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v8}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getOutputPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    const/4 v1, 0x0

    move v10, v1

    .line 332
    :goto_4
    instance-of v1, v0, Ljava/util/Iterator;

    if-eqz v1, :cond_6

    .line 334
    move-object v1, v0

    check-cast v1, Ljava/util/Iterator;

    .line 335
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-static {v15, v1, v12, v8}, Lcom/google/api/client/http/UriTemplate;->getListPropertyValue(Ljava/lang/String;Ljava/util/Iterator;ZLcom/google/api/client/http/UriTemplate$CompositeOutput;)Ljava/lang/String;

    move-result-object v0

    .line 336
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    goto/16 :goto_9

    :cond_6
    instance-of v1, v0, Ljava/lang/Iterable;

    if-nez v1, :cond_e

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_7

    move-object/from16 v19, v0

    goto/16 :goto_8

    .line 340
    :cond_7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isEnum()Z

    move-result v1

    move-object/from16 v19, v0

    .end local v0    # "value":Ljava/lang/Object;
    .local v19, "value":Ljava/lang/Object;
    const-string v0, "%s=%s"

    move/from16 v20, v1

    const/4 v1, 0x2

    if-eqz v20, :cond_a

    .line 341
    move-object/from16 v20, v19

    check-cast v20, Ljava/lang/Enum;

    invoke-static/range {v20 .. v20}, Lcom/google/api/client/util/FieldInfo;->of(Ljava/lang/Enum;)Lcom/google/api/client/util/FieldInfo;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/google/api/client/util/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v20

    .line 342
    .local v20, "name":Ljava/lang/String;
    if-eqz v20, :cond_9

    .line 343
    invoke-virtual {v8}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->requiresVarAssignment()Z

    move-result v21

    if-eqz v21, :cond_8

    .line 344
    new-array v1, v1, [Ljava/lang/Object;

    aput-object v15, v1, v17

    aput-object v19, v1, v16

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .end local v19    # "value":Ljava/lang/Object;
    .restart local v0    # "value":Ljava/lang/Object;
    goto :goto_5

    .line 343
    .end local v0    # "value":Ljava/lang/Object;
    .restart local v19    # "value":Ljava/lang/Object;
    :cond_8
    move-object/from16 v0, v19

    .line 346
    .end local v19    # "value":Ljava/lang/Object;
    .restart local v0    # "value":Ljava/lang/Object;
    :goto_5
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/api/client/util/escape/CharEscapers;->escapeUriPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 342
    .end local v0    # "value":Ljava/lang/Object;
    .restart local v19    # "value":Ljava/lang/Object;
    :cond_9
    move-object/from16 v0, v19

    .line 348
    .end local v19    # "value":Ljava/lang/Object;
    .end local v20    # "name":Ljava/lang/String;
    .restart local v0    # "value":Ljava/lang/Object;
    :goto_6
    goto :goto_9

    .end local v0    # "value":Ljava/lang/Object;
    .restart local v19    # "value":Ljava/lang/Object;
    :cond_a
    invoke-static/range {v19 .. v19}, Lcom/google/api/client/util/Data;->isValueOfPrimitiveType(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_b

    .line 350
    invoke-static/range {v19 .. v19}, Lcom/google/api/client/http/UriTemplate;->getMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    .line 351
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {v15, v0, v12, v8}, Lcom/google/api/client/http/UriTemplate;->getMapPropertyValue(Ljava/lang/String;Ljava/util/Map;ZLcom/google/api/client/http/UriTemplate$CompositeOutput;)Ljava/lang/String;

    move-result-object v0

    .line 352
    .end local v19    # "value":Ljava/lang/Object;
    .local v0, "value":Ljava/lang/Object;
    goto :goto_9

    .line 354
    .end local v0    # "value":Ljava/lang/Object;
    .restart local v19    # "value":Ljava/lang/Object;
    :cond_b
    invoke-virtual {v8}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->requiresVarAssignment()Z

    move-result v20

    if-eqz v20, :cond_c

    .line 355
    new-array v1, v1, [Ljava/lang/Object;

    aput-object v15, v1, v17

    aput-object v19, v1, v16

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .end local v19    # "value":Ljava/lang/Object;
    .restart local v0    # "value":Ljava/lang/Object;
    goto :goto_7

    .line 354
    .end local v0    # "value":Ljava/lang/Object;
    .restart local v19    # "value":Ljava/lang/Object;
    :cond_c
    move-object/from16 v0, v19

    .line 357
    .end local v19    # "value":Ljava/lang/Object;
    .restart local v0    # "value":Ljava/lang/Object;
    :goto_7
    invoke-virtual {v8}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getReservedExpansion()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 358
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/api/client/util/escape/CharEscapers;->escapeUriPathWithoutReserved(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    .line 360
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/api/client/util/escape/CharEscapers;->escapeUriPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    .line 336
    :cond_e
    move-object/from16 v19, v0

    .line 338
    .end local v0    # "value":Ljava/lang/Object;
    .restart local v19    # "value":Ljava/lang/Object;
    :goto_8
    invoke-static/range {v19 .. v19}, Lcom/google/api/client/util/Types;->iterableOf(Ljava/lang/Object;)Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 339
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-static {v15, v0, v12, v8}, Lcom/google/api/client/http/UriTemplate;->getListPropertyValue(Ljava/lang/String;Ljava/util/Iterator;ZLcom/google/api/client/http/UriTemplate$CompositeOutput;)Ljava/lang/String;

    move-result-object v0

    .line 340
    .end local v19    # "value":Ljava/lang/Object;
    .local v0, "value":Ljava/lang/Object;
    nop

    .line 363
    :goto_9
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 364
    .end local v0    # "value":Ljava/lang/Object;
    .end local v11    # "template":Ljava/lang/String;
    .end local v12    # "containsExplodeModifier":Z
    .end local v13    # "varNameStartIndex":I
    .end local v14    # "varNameEndIndex":I
    .end local v15    # "varName":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    goto/16 :goto_1

    .line 307
    .end local v18    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v1, "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_f
    move-object/from16 v18, v1

    .line 365
    .end local v1    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "next":I
    .end local v6    # "close":I
    .end local v7    # "templates":Ljava/lang/String;
    .end local v8    # "compositeOutput":Lcom/google/api/client/http/UriTemplate$CompositeOutput;
    .end local v9    # "templateIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/String;>;"
    .end local v10    # "isFirstParameter":Z
    .restart local v18    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 288
    .end local v18    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v1    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_10
    move-object/from16 v18, v1

    .line 366
    .end local v1    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v18    # "variableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_a
    if-eqz p2, :cond_11

    .line 368
    invoke-interface/range {v18 .. v18}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/google/api/client/http/GenericUrl;->addQueryParams(Ljava/util/Set;Ljava/lang/StringBuilder;)V

    .line 370
    :cond_11
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static expand(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/String;
    .locals 3
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "uriTemplate"    # Ljava/lang/String;
    .param p2, "parameters"    # Ljava/lang/Object;
    .param p3, "addUnusedParamsAsQueryParams"    # Z

    .line 252
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 254
    new-instance v0, Lcom/google/api/client/http/GenericUrl;

    invoke-direct {v0, p0}, Lcom/google/api/client/http/GenericUrl;-><init>(Ljava/lang/String;)V

    .line 255
    .local v0, "url":Lcom/google/api/client/http/GenericUrl;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/api/client/http/GenericUrl;->setRawPath(Ljava/lang/String;)V

    .line 256
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/google/api/client/http/GenericUrl;->build()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 257
    .local v0, "pathUri":Ljava/lang/String;
    goto :goto_1

    .end local v0    # "pathUri":Ljava/lang/String;
    :cond_0
    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 260
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "pathUri":Ljava/lang/String;
    goto :goto_1

    .line 258
    .end local v0    # "pathUri":Ljava/lang/String;
    :cond_2
    :goto_0
    move-object v0, p1

    .line 262
    .restart local v0    # "pathUri":Ljava/lang/String;
    :goto_1
    invoke-static {v0, p2, p3}, Lcom/google/api/client/http/UriTemplate;->expand(Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static getCompositeOutput(Ljava/lang/String;)Lcom/google/api/client/http/UriTemplate$CompositeOutput;
    .locals 2
    .param p0, "propertyName"    # Ljava/lang/String;

    .line 202
    sget-object v0, Lcom/google/api/client/http/UriTemplate;->COMPOSITE_PREFIXES:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/client/http/UriTemplate$CompositeOutput;

    .line 203
    .local v0, "compositeOutput":Lcom/google/api/client/http/UriTemplate$CompositeOutput;
    if-nez v0, :cond_0

    sget-object v1, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->SIMPLE:Lcom/google/api/client/http/UriTemplate$CompositeOutput;

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method private static getListPropertyValue(Ljava/lang/String;Ljava/util/Iterator;ZLcom/google/api/client/http/UriTemplate$CompositeOutput;)Ljava/lang/String;
    .locals 4
    .param p0, "varName"    # Ljava/lang/String;
    .param p2, "containsExplodeModifier"    # Z
    .param p3, "compositeOutput"    # Lcom/google/api/client/http/UriTemplate$CompositeOutput;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Iterator<",
            "*>;Z",
            "Lcom/google/api/client/http/UriTemplate$CompositeOutput;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 388
    .local p1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 389
    const-string v0, ""

    return-object v0

    .line 391
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 393
    .local v0, "retBuf":Ljava/lang/StringBuilder;
    const-string v1, "="

    if-eqz p2, :cond_1

    .line 394
    invoke-virtual {p3}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getExplodeJoiner()Ljava/lang/String;

    move-result-object v2

    .local v2, "joiner":Ljava/lang/String;
    goto :goto_0

    .line 396
    .end local v2    # "joiner":Ljava/lang/String;
    :cond_1
    const-string v2, ","

    .line 397
    .restart local v2    # "joiner":Ljava/lang/String;
    invoke-virtual {p3}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->requiresVarAssignment()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 398
    invoke-static {p0}, Lcom/google/api/client/util/escape/CharEscapers;->escapeUriPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 403
    if-eqz p2, :cond_3

    invoke-virtual {p3}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->requiresVarAssignment()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 404
    invoke-static {p0}, Lcom/google/api/client/util/escape/CharEscapers;->escapeUriPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getEncodedValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 409
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 412
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getMap(Ljava/lang/Object;)Ljava/util/Map;
    .locals 5
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 216
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 217
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0}, Lcom/google/api/client/util/Data;->mapOf(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 218
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 219
    .local v3, "value":Ljava/lang/Object;
    if-eqz v3, :cond_0

    invoke-static {v3}, Lcom/google/api/client/util/Data;->isNull(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 220
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "value":Ljava/lang/Object;
    :cond_0
    goto :goto_0

    .line 223
    :cond_1
    return-object v0
.end method

.method private static getMapPropertyValue(Ljava/lang/String;Ljava/util/Map;ZLcom/google/api/client/http/UriTemplate$CompositeOutput;)Ljava/lang/String;
    .locals 8
    .param p0, "varName"    # Ljava/lang/String;
    .param p2, "containsExplodeModifier"    # Z
    .param p3, "compositeOutput"    # Lcom/google/api/client/http/UriTemplate$CompositeOutput;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z",
            "Lcom/google/api/client/http/UriTemplate$CompositeOutput;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 430
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 431
    const-string v0, ""

    return-object v0

    .line 433
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 436
    .local v0, "retBuf":Ljava/lang/StringBuilder;
    if-eqz p2, :cond_1

    .line 437
    invoke-virtual {p3}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getExplodeJoiner()Ljava/lang/String;

    move-result-object v1

    .line 438
    .local v1, "joiner":Ljava/lang/String;
    const-string v2, "="

    .local v2, "mapElementsJoiner":Ljava/lang/String;
    goto :goto_0

    .line 440
    .end local v1    # "joiner":Ljava/lang/String;
    .end local v2    # "mapElementsJoiner":Ljava/lang/String;
    :cond_1
    const-string v1, ","

    .line 441
    .restart local v1    # "joiner":Ljava/lang/String;
    const-string v2, ","

    .line 442
    .restart local v2    # "mapElementsJoiner":Ljava/lang/String;
    invoke-virtual {p3}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->requiresVarAssignment()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 443
    invoke-static {p0}, Lcom/google/api/client/util/escape/CharEscapers;->escapeUriPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    const-string v3, "="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 448
    .local v3, "mapIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 449
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 450
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p3, v5}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getEncodedValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 451
    .local v5, "encodedKey":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lcom/google/api/client/http/UriTemplate$CompositeOutput;->getEncodedValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 452
    .local v6, "encodedValue":Ljava/lang/String;
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 456
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "encodedKey":Ljava/lang/String;
    .end local v6    # "encodedValue":Ljava/lang/String;
    :cond_3
    goto :goto_1

    .line 459
    .end local v3    # "mapIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
