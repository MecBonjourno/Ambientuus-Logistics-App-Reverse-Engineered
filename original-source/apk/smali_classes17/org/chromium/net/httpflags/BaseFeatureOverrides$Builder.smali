.class public final Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "BaseFeatureOverrides.java"

# interfaces
.implements Lorg/chromium/net/httpflags/BaseFeatureOverridesOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/httpflags/BaseFeatureOverrides;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lorg/chromium/net/httpflags/BaseFeatureOverrides;",
        "Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;",
        ">;",
        "Lorg/chromium/net/httpflags/BaseFeatureOverridesOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1291
    invoke-static {}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->-$$Nest$sfgetDEFAULT_INSTANCE()Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 1292
    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/net/httpflags/BaseFeatureOverrides-IA;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearFeatureStates()Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;
    .locals 1

    .line 1316
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->copyOnWrite()V

    .line 1317
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    invoke-static {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->-$$Nest$mgetMutableFeatureStatesMap(Lorg/chromium/net/httpflags/BaseFeatureOverrides;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1318
    return-object p0
.end method

.method public containsFeatureStates(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 1311
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1312
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    invoke-virtual {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->getFeatureStatesMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getFeatureStates()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1341
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->getFeatureStatesMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getFeatureStatesCount()I
    .locals 1

    .line 1298
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    invoke-virtual {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->getFeatureStatesMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getFeatureStatesMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;",
            ">;"
        }
    .end annotation

    .line 1352
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    .line 1353
    invoke-virtual {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->getFeatureStatesMap()Ljava/util/Map;

    move-result-object v0

    .line 1352
    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getFeatureStatesOrDefault(Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;)Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;

    .line 1367
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1368
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    .line 1369
    invoke-virtual {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->getFeatureStatesMap()Ljava/util/Map;

    move-result-object v0

    .line 1370
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;

    goto :goto_0

    :cond_0
    move-object v1, p2

    :goto_0
    return-object v1
.end method

.method public getFeatureStatesOrThrow(Ljava/lang/String;)Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .line 1383
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1384
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    .line 1385
    invoke-virtual {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->getFeatureStatesMap()Ljava/util/Map;

    move-result-object v0

    .line 1386
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1389
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;

    return-object v1

    .line 1387
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method

.method public putAllFeatureStates(Ljava/util/Map;)Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;",
            ">;)",
            "Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;"
        }
    .end annotation

    .line 1416
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;>;"
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->copyOnWrite()V

    .line 1417
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    invoke-static {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->-$$Nest$mgetMutableFeatureStatesMap(Lorg/chromium/net/httpflags/BaseFeatureOverrides;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1418
    return-object p0
.end method

.method public putFeatureStates(Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;)Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;

    .line 1401
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1402
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1403
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->copyOnWrite()V

    .line 1404
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    invoke-static {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->-$$Nest$mgetMutableFeatureStatesMap(Lorg/chromium/net/httpflags/BaseFeatureOverrides;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1405
    return-object p0
.end method

.method public removeFeatureStates(Ljava/lang/String;)Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 1330
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1331
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->copyOnWrite()V

    .line 1332
    iget-object v0, p0, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    invoke-static {v0}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->-$$Nest$mgetMutableFeatureStatesMap(Lorg/chromium/net/httpflags/BaseFeatureOverrides;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1333
    return-object p0
.end method
