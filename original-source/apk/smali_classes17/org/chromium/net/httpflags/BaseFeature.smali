.class public final Lorg/chromium/net/httpflags/BaseFeature;
.super Ljava/lang/Object;
.source "BaseFeature.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;
    }
.end annotation


# static fields
.field public static final FLAG_PREFIX:Ljava/lang/String; = "ChromiumBaseFeature_"

.field public static final PARAM_DELIMITER:Ljava/lang/String; = "_PARAM_"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static applyOverride(Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;Ljava/util/Map;)V
    .locals 3
    .param p0, "flagName"    # Ljava/lang/String;
    .param p1, "flagValue"    # Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/chromium/net/httpflags/ResolvedFlags$Value;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;",
            ">;)V"
        }
    .end annotation

    .line 91
    .local p2, "featureStateBuilders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;>;"
    invoke-static {p0}, Lorg/chromium/net/httpflags/BaseFeature;->parseFlagName(Ljava/lang/String;)Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;

    move-result-object v0

    .line 92
    .local v0, "parsedFlagName":Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;
    if-nez v0, :cond_0

    return-void

    .line 94
    :cond_0
    iget-object v1, v0, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;->featureName:Ljava/lang/String;

    .line 95
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;

    .line 96
    .local v1, "featureStateBuilder":Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;
    if-nez v1, :cond_1

    .line 97
    invoke-static {}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;->newBuilder()Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;

    move-result-object v1

    .line 98
    iget-object v2, v0, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;->featureName:Ljava/lang/String;

    invoke-interface {p2, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    :cond_1
    iget-object v2, v0, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;->paramName:Ljava/lang/String;

    if-nez v2, :cond_2

    .line 102
    invoke-static {p1, v1}, Lorg/chromium/net/httpflags/BaseFeature;->applyStateOverride(Lorg/chromium/net/httpflags/ResolvedFlags$Value;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;)V

    goto :goto_0

    .line 104
    :cond_2
    iget-object v2, v0, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;->paramName:Ljava/lang/String;

    invoke-static {v2, p1, v1}, Lorg/chromium/net/httpflags/BaseFeature;->applyParamOverride(Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;)V

    .line 106
    :goto_0
    return-void
.end method

.method private static applyParamOverride(Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;)V
    .locals 4
    .param p0, "paramName"    # Ljava/lang/String;
    .param p1, "value"    # Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    .param p2, "featureStateBuilder"    # Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;

    .line 143
    invoke-virtual {p1}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getType()Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    move-result-object v0

    .line 145
    .local v0, "valueType":Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;
    sget-object v1, Lorg/chromium/net/httpflags/BaseFeature$1;->$SwitchMap$org$chromium$net$httpflags$ResolvedFlags$Value$Type:[I

    invoke-virtual {v0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 168
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported HTTP flag value type for base::Feature param `"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "`: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 165
    :pswitch_0
    invoke-virtual {p1}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getBytesValue()Lcom/google/protobuf/ByteString;

    move-result-object v1

    .line 166
    .local v1, "rawValue":Lcom/google/protobuf/ByteString;
    goto :goto_1

    .line 162
    .end local v1    # "rawValue":Lcom/google/protobuf/ByteString;
    :pswitch_1
    invoke-virtual {p1}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getStringValue()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {v1, v2}, Lcom/google/protobuf/ByteString;->copyFrom(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcom/google/protobuf/ByteString;

    move-result-object v1

    .line 163
    .restart local v1    # "rawValue":Lcom/google/protobuf/ByteString;
    goto :goto_1

    .line 158
    .end local v1    # "rawValue":Lcom/google/protobuf/ByteString;
    :pswitch_2
    nop

    .line 159
    invoke-virtual {p1}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getFloatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 158
    invoke-static {v1, v2}, Lcom/google/protobuf/ByteString;->copyFrom(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcom/google/protobuf/ByteString;

    move-result-object v1

    .line 160
    .restart local v1    # "rawValue":Lcom/google/protobuf/ByteString;
    goto :goto_1

    .line 151
    .end local v1    # "rawValue":Lcom/google/protobuf/ByteString;
    :pswitch_3
    nop

    .line 152
    invoke-virtual {p1}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getIntValue()J

    move-result-wide v1

    const/16 v3, 0xa

    invoke-static {v1, v2, v3}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 151
    invoke-static {v1, v2}, Lcom/google/protobuf/ByteString;->copyFrom(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcom/google/protobuf/ByteString;

    move-result-object v1

    .line 153
    .restart local v1    # "rawValue":Lcom/google/protobuf/ByteString;
    goto :goto_1

    .line 148
    .end local v1    # "rawValue":Lcom/google/protobuf/ByteString;
    :pswitch_4
    invoke-virtual {p1}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getBoolValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "true"

    goto :goto_0

    :cond_0
    const-string v1, "false"

    :goto_0
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 147
    invoke-static {v1, v2}, Lcom/google/protobuf/ByteString;->copyFrom(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcom/google/protobuf/ByteString;

    move-result-object v1

    .line 149
    .restart local v1    # "rawValue":Lcom/google/protobuf/ByteString;
    nop

    .line 172
    :goto_1
    invoke-virtual {p2, p0, v1}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;->putParams(Ljava/lang/String;Lcom/google/protobuf/ByteString;)Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;

    .line 173
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static applyStateOverride(Lorg/chromium/net/httpflags/ResolvedFlags$Value;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;)V
    .locals 4
    .param p0, "value"    # Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    .param p1, "featureStateBuilder"    # Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;

    .line 133
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getType()Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    move-result-object v0

    .line 134
    .local v0, "valueType":Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;
    sget-object v1, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->BOOL:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    if-ne v0, v1, :cond_0

    .line 138
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getBoolValue()Z

    move-result v1

    invoke-virtual {p1, v1}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;->setEnabled(Z)Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;

    .line 139
    return-void

    .line 135
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HTTP flag has type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", but only boolean flags are supported as base::Feature overrides"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getOverrides(Lorg/chromium/net/httpflags/ResolvedFlags;)Lorg/chromium/net/httpflags/BaseFeatureOverrides;
    .locals 7
    .param p0, "flags"    # Lorg/chromium/net/httpflags/ResolvedFlags;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 70
    .local v0, "featureStateBuilders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;>;"
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/ResolvedFlags;->flags()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 72
    .local v2, "flag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;>;"
    :try_start_0
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    invoke-static {v3, v4, v0}, Lorg/chromium/net/httpflags/BaseFeature;->applyOverride(Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    nop

    .line 78
    .end local v2    # "flag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;>;"
    goto :goto_0

    .line 73
    .restart local v2    # "flag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;>;"
    :catch_0
    move-exception v1

    .line 74
    .local v1, "exception":Ljava/lang/RuntimeException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not parse HTTP flag `"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "` as a base::Feature override"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 80
    .end local v1    # "exception":Ljava/lang/RuntimeException;
    .end local v2    # "flag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/ResolvedFlags$Value;>;"
    :cond_0
    invoke-static {}, Lorg/chromium/net/httpflags/BaseFeatureOverrides;->newBuilder()Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;

    move-result-object v1

    .line 82
    .local v1, "builder":Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 83
    .local v3, "featureStateBuilder":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;>;"
    nop

    .line 84
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;

    invoke-virtual {v5}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v5

    check-cast v5, Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;

    .line 83
    invoke-virtual {v1, v4, v5}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->putFeatureStates(Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState;)Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;

    .line 85
    .end local v3    # "featureStateBuilder":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/chromium/net/httpflags/BaseFeatureOverrides$FeatureState$Builder;>;"
    goto :goto_1

    .line 86
    :cond_1
    invoke-virtual {v1}, Lorg/chromium/net/httpflags/BaseFeatureOverrides$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    check-cast v2, Lorg/chromium/net/httpflags/BaseFeatureOverrides;

    return-object v2
.end method

.method private static parseFlagName(Ljava/lang/String;)Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;
    .locals 5
    .param p0, "flagName"    # Ljava/lang/String;

    .line 115
    const-string v0, "ChromiumBaseFeature_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 116
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "flagNameWithoutPrefix":Ljava/lang/String;
    new-instance v1, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;

    invoke-direct {v1, v2}, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;-><init>(Lorg/chromium/net/httpflags/BaseFeature-IA;)V

    .line 120
    .local v1, "parsed":Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;
    const-string v2, "_PARAM_"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 121
    .local v3, "delimiterIndex":I
    if-gez v3, :cond_1

    .line 122
    iput-object v0, v1, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;->featureName:Ljava/lang/String;

    goto :goto_0

    .line 124
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;->featureName:Ljava/lang/String;

    .line 125
    nop

    .line 126
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lorg/chromium/net/httpflags/BaseFeature$ParsedFlagName;->paramName:Ljava/lang/String;

    .line 128
    :goto_0
    return-object v1
.end method
