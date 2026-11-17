.class public final Lorg/chromium/net/httpflags/ResolvedFlags$Value;
.super Ljava/lang/Object;
.source "ResolvedFlags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/httpflags/ResolvedFlags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Value"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;
    }
.end annotation


# instance fields
.field private final mValue:Ljava/lang/Object;


# direct methods
.method static bridge synthetic -$$Nest$smresolve(Lorg/chromium/net/httpflags/FlagValue;Ljava/lang/String;[I)Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->resolve(Lorg/chromium/net/httpflags/FlagValue;Ljava/lang/String;[I)Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(F)V
    .locals 1
    .param p1, "value"    # F

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    .line 93
    return-void
.end method

.method public constructor <init>(J)V
    .locals 1
    .param p1, "value"    # J

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    .line 89
    return-void
.end method

.method public constructor <init>(Lcom/google/protobuf/ByteString;)V
    .locals 0
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p1, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    .line 101
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    .line 97
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    .line 85
    return-void
.end method

.method private checkType(Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;)V
    .locals 4
    .param p1, "requestedType"    # Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    .line 121
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->getType()Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    move-result-object v0

    .line 122
    .local v0, "actualType":Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;
    if-ne p1, v0, :cond_0

    .line 126
    return-void

    .line 123
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Attempted to access flag value as "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", but actual type is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static fromConstrainedValue(Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    .locals 4
    .param p0, "constrainedValue"    # Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;

    .line 62
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->getValueCase()Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue$ValueCase;

    move-result-object v0

    .line 63
    .local v0, "valueCase":Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue$ValueCase;
    sget-object v1, Lorg/chromium/net/httpflags/ResolvedFlags$1;->$SwitchMap$org$chromium$net$httpflags$FlagValue$ConstrainedValue$ValueCase:[I

    invoke-virtual {v0}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue$ValueCase;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 77
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Flag value uses unknown value type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :pswitch_0
    const/4 v1, 0x0

    return-object v1

    .line 73
    :pswitch_1
    new-instance v1, Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    invoke-virtual {p0}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->getBytesValue()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;-><init>(Lcom/google/protobuf/ByteString;)V

    return-object v1

    .line 71
    :pswitch_2
    new-instance v1, Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    invoke-virtual {p0}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->getStringValue()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 69
    :pswitch_3
    new-instance v1, Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    invoke-virtual {p0}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->getFloatValue()F

    move-result v2

    invoke-direct {v1, v2}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;-><init>(F)V

    return-object v1

    .line 67
    :pswitch_4
    new-instance v1, Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    invoke-virtual {p0}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->getIntValue()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;-><init>(J)V

    return-object v1

    .line 65
    :pswitch_5
    new-instance v1, Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    invoke-virtual {p0}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->getBoolValue()Z

    move-result v2

    invoke-direct {v1, v2}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;-><init>(Z)V

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static matchesVersion([I[I)Z
    .locals 5
    .param p0, "cronetVersion"    # [I
    .param p1, "minVersion"    # [I

    .line 49
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    array-length v2, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_4

    .line 50
    array-length v1, p0

    const/4 v3, 0x0

    if-ge v0, v1, :cond_0

    aget v1, p0, v0

    goto :goto_1

    :cond_0
    move v1, v3

    .line 51
    .local v1, "cronetComponent":I
    :goto_1
    array-length v4, p1

    if-ge v0, v4, :cond_1

    aget v4, p1, v0

    goto :goto_2

    :cond_1
    move v4, v3

    .line 52
    .local v4, "minComponent":I
    :goto_2
    if-le v1, v4, :cond_2

    .line 53
    return v2

    .line 54
    :cond_2
    if-ge v1, v4, :cond_3

    .line 55
    return v3

    .line 49
    .end local v1    # "cronetComponent":I
    .end local v4    # "minComponent":I
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 58
    .end local v0    # "i":I
    :cond_4
    return v2
.end method

.method private static resolve(Lorg/chromium/net/httpflags/FlagValue;Ljava/lang/String;[I)Lorg/chromium/net/httpflags/ResolvedFlags$Value;
    .locals 3
    .param p0, "flagValue"    # Lorg/chromium/net/httpflags/FlagValue;
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "cronetVersion"    # [I

    .line 36
    invoke-virtual {p0}, Lorg/chromium/net/httpflags/FlagValue;->getConstrainedValuesList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;

    .line 37
    .local v1, "constrainedValue":Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;
    invoke-virtual {v1}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->hasAppId()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->getAppId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 38
    :cond_1
    invoke-virtual {v1}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->hasMinVersion()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 40
    invoke-virtual {v1}, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;->getMinVersion()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/chromium/net/httpflags/ResolvedFlags;->-$$Nest$smparseVersionString(Ljava/lang/String;)[I

    move-result-object v2

    .line 39
    invoke-static {p2, v2}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->matchesVersion([I[I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 41
    goto :goto_0

    .line 43
    :cond_2
    invoke-static {v1}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->fromConstrainedValue(Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)Lorg/chromium/net/httpflags/ResolvedFlags$Value;

    move-result-object v0

    return-object v0

    .line 45
    .end local v1    # "constrainedValue":Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public getBoolValue()Z
    .locals 1

    .line 132
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->BOOL:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    invoke-direct {p0, v0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->checkType(Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;)V

    .line 133
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public getBytesValue()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 160
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->BYTES:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    invoke-direct {p0, v0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->checkType(Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;)V

    .line 161
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    check-cast v0, Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getFloatValue()F
    .locals 1

    .line 146
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->FLOAT:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    invoke-direct {p0, v0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->checkType(Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;)V

    .line 147
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public getIntValue()J
    .locals 2

    .line 139
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->INT:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    invoke-direct {p0, v0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->checkType(Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;)V

    .line 140
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getStringValue()Ljava/lang/String;
    .locals 1

    .line 153
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->STRING:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    invoke-direct {p0, v0}, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->checkType(Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;)V

    .line 154
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;
    .locals 4

    .line 104
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 105
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->BOOL:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    return-object v0

    .line 106
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 107
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->INT:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    return-object v0

    .line 108
    :cond_1
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Float;

    if-eqz v0, :cond_2

    .line 109
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->FLOAT:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    return-object v0

    .line 110
    :cond_2
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 111
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->STRING:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    return-object v0

    .line 112
    :cond_3
    iget-object v0, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    instance-of v0, v0, Lcom/google/protobuf/ByteString;

    if-eqz v0, :cond_4

    .line 113
    sget-object v0, Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;->BYTES:Lorg/chromium/net/httpflags/ResolvedFlags$Value$Type;

    return-object v0

    .line 115
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    iget-object v1, p0, Lorg/chromium/net/httpflags/ResolvedFlags$Value;->mValue:Ljava/lang/Object;

    .line 116
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected flag value type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
