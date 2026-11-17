.class public final Lcom/google/protobuf/UInt64Value;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "UInt64Value.java"

# interfaces
.implements Lcom/google/protobuf/UInt64ValueOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/UInt64Value$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/protobuf/UInt64Value;",
        "Lcom/google/protobuf/UInt64Value$Builder;",
        ">;",
        "Lcom/google/protobuf/UInt64ValueOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/protobuf/UInt64Value;",
            ">;"
        }
    .end annotation
.end field

.field public static final VALUE_FIELD_NUMBER:I = 0x1


# instance fields
.field private value_:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 220
    new-instance v0, Lcom/google/protobuf/UInt64Value;

    invoke-direct {v0}, Lcom/google/protobuf/UInt64Value;-><init>()V

    .line 223
    .local v0, "defaultInstance":Lcom/google/protobuf/UInt64Value;
    sput-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    .line 224
    const-class v1, Lcom/google/protobuf/UInt64Value;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 226
    .end local v0    # "defaultInstance":Lcom/google/protobuf/UInt64Value;
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 15
    return-void
.end method

.method static synthetic access$000()Lcom/google/protobuf/UInt64Value;
    .locals 1

    .line 9
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/protobuf/UInt64Value;J)V
    .locals 0
    .param p0, "x0"    # Lcom/google/protobuf/UInt64Value;
    .param p1, "x1"    # J

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/UInt64Value;->setValue(J)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/protobuf/UInt64Value;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/protobuf/UInt64Value;

    .line 9
    invoke-direct {p0}, Lcom/google/protobuf/UInt64Value;->clearValue()V

    return-void
.end method

.method private clearValue()V
    .locals 2

    .line 39
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/protobuf/UInt64Value;->value_:J

    .line 40
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/protobuf/UInt64Value;
    .locals 1

    .line 229
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/protobuf/UInt64Value$Builder;
    .locals 1

    .line 117
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-virtual {v0}, Lcom/google/protobuf/UInt64Value;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/protobuf/UInt64Value;)Lcom/google/protobuf/UInt64Value$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/google/protobuf/UInt64Value;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "prototype"
        }
    .end annotation

    .line 120
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-virtual {v0, p0}, Lcom/google/protobuf/UInt64Value;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value$Builder;

    return-object v0
.end method

.method public static of(J)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "value"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 233
    invoke-static {}, Lcom/google/protobuf/UInt64Value;->newBuilder()Lcom/google/protobuf/UInt64Value$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/google/protobuf/UInt64Value$Builder;->setValue(J)Lcom/google/protobuf/UInt64Value$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/UInt64Value$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0}, Lcom/google/protobuf/UInt64Value;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/UInt64Value;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 58
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 65
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 45
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "data"    # Ljava/nio/ByteBuffer;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 52
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 70
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/UInt64Value;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 77
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UInt64Value;

    return-object v0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/protobuf/UInt64Value;",
            ">;"
        }
    .end annotation

    .line 239
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-virtual {v0}, Lcom/google/protobuf/UInt64Value;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setValue(J)V
    .locals 0
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 32
    iput-wide p1, p0, Lcom/google/protobuf/UInt64Value;->value_:J

    .line 33
    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "method"    # Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;
    .param p2, "arg0"    # Ljava/lang/Object;
    .param p3, "arg1"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "method",
            "arg0",
            "arg1"
        }
    .end annotation

    .line 172
    sget-object v0, Lcom/google/protobuf/UInt64Value$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 213
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 210
    :pswitch_0
    return-object v2

    .line 207
    :pswitch_1
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    return-object v0

    .line 192
    :pswitch_2
    sget-object v0, Lcom/google/protobuf/UInt64Value;->PARSER:Lcom/google/protobuf/Parser;

    .line 193
    .local v0, "parser":Lcom/google/protobuf/Parser;, "Lcom/google/protobuf/Parser<Lcom/google/protobuf/UInt64Value;>;"
    if-nez v0, :cond_1

    .line 194
    const-class v1, Lcom/google/protobuf/UInt64Value;

    monitor-enter v1

    .line 195
    :try_start_0
    sget-object v2, Lcom/google/protobuf/UInt64Value;->PARSER:Lcom/google/protobuf/Parser;

    move-object v0, v2

    .line 196
    if-nez v0, :cond_0

    .line 197
    new-instance v2, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object v3, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-direct {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    move-object v0, v2

    .line 200
    sput-object v0, Lcom/google/protobuf/UInt64Value;->PARSER:Lcom/google/protobuf/Parser;

    .line 202
    :cond_0
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 204
    :cond_1
    :goto_0
    return-object v0

    .line 189
    .end local v0    # "parser":Lcom/google/protobuf/Parser;, "Lcom/google/protobuf/Parser<Lcom/google/protobuf/UInt64Value;>;"
    :pswitch_3
    sget-object v0, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    return-object v0

    .line 180
    :pswitch_4
    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "value_"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 183
    .local v0, "objects":[Ljava/lang/Object;
    const-string v1, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u0003"

    .line 185
    .local v1, "info":Ljava/lang/String;
    sget-object v2, Lcom/google/protobuf/UInt64Value;->DEFAULT_INSTANCE:Lcom/google/protobuf/UInt64Value;

    invoke-static {v2, v1, v0}, Lcom/google/protobuf/UInt64Value;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 177
    .end local v0    # "objects":[Ljava/lang/Object;
    .end local v1    # "info":Ljava/lang/String;
    :pswitch_5
    new-instance v0, Lcom/google/protobuf/UInt64Value$Builder;

    invoke-direct {v0, v2}, Lcom/google/protobuf/UInt64Value$Builder;-><init>(Lcom/google/protobuf/UInt64Value$1;)V

    return-object v0

    .line 174
    :pswitch_6
    new-instance v0, Lcom/google/protobuf/UInt64Value;

    invoke-direct {v0}, Lcom/google/protobuf/UInt64Value;-><init>()V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getValue()J
    .locals 2

    .line 24
    iget-wide v0, p0, Lcom/google/protobuf/UInt64Value;->value_:J

    return-wide v0
.end method
