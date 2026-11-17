.class public final Lorg/chromium/net/httpflags/FlagValue;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "FlagValue.java"

# interfaces
.implements Lorg/chromium/net/httpflags/FlagValueOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;,
        Lorg/chromium/net/httpflags/FlagValue$ConstrainedValueOrBuilder;,
        Lorg/chromium/net/httpflags/FlagValue$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lorg/chromium/net/httpflags/FlagValue;",
        "Lorg/chromium/net/httpflags/FlagValue$Builder;",
        ">;",
        "Lorg/chromium/net/httpflags/FlagValueOrBuilder;"
    }
.end annotation


# static fields
.field public static final CONSTRAINED_VALUES_FIELD_NUMBER:I = 0x8

.field private static final DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lorg/chromium/net/httpflags/FlagValue;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$maddAllConstrainedValues(Lorg/chromium/net/httpflags/FlagValue;Ljava/lang/Iterable;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/httpflags/FlagValue;->addAllConstrainedValues(Ljava/lang/Iterable;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$maddConstrainedValues(Lorg/chromium/net/httpflags/FlagValue;ILorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lorg/chromium/net/httpflags/FlagValue;->addConstrainedValues(ILorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$maddConstrainedValues(Lorg/chromium/net/httpflags/FlagValue;Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/httpflags/FlagValue;->addConstrainedValues(Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearConstrainedValues(Lorg/chromium/net/httpflags/FlagValue;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/net/httpflags/FlagValue;->clearConstrainedValues()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mremoveConstrainedValues(Lorg/chromium/net/httpflags/FlagValue;I)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/httpflags/FlagValue;->removeConstrainedValues(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetConstrainedValues(Lorg/chromium/net/httpflags/FlagValue;ILorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lorg/chromium/net/httpflags/FlagValue;->setConstrainedValues(ILorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetDEFAULT_INSTANCE()Lorg/chromium/net/httpflags/FlagValue;
    .locals 1

    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 1796
    new-instance v0, Lorg/chromium/net/httpflags/FlagValue;

    invoke-direct {v0}, Lorg/chromium/net/httpflags/FlagValue;-><init>()V

    .line 1799
    .local v0, "defaultInstance":Lorg/chromium/net/httpflags/FlagValue;
    sput-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    .line 1800
    const-class v1, Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 1802
    .end local v0    # "defaultInstance":Lorg/chromium/net/httpflags/FlagValue;
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 20
    invoke-static {}, Lorg/chromium/net/httpflags/FlagValue;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 21
    return-void
.end method

.method private addAllConstrainedValues(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;",
            ">;)V"
        }
    .end annotation

    .line 1436
    .local p1, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;>;"
    invoke-direct {p0}, Lorg/chromium/net/httpflags/FlagValue;->ensureConstrainedValuesIsMutable()V

    .line 1437
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 1439
    return-void
.end method

.method private addConstrainedValues(ILorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;

    .line 1421
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1422
    invoke-direct {p0}, Lorg/chromium/net/httpflags/FlagValue;->ensureConstrainedValuesIsMutable()V

    .line 1423
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    .line 1424
    return-void
.end method

.method private addConstrainedValues(Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V
    .locals 1
    .param p1, "value"    # Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;

    .line 1406
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1407
    invoke-direct {p0}, Lorg/chromium/net/httpflags/FlagValue;->ensureConstrainedValuesIsMutable()V

    .line 1408
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    .line 1409
    return-void
.end method

.method private clearConstrainedValues()V
    .locals 1

    .line 1450
    invoke-static {}, Lorg/chromium/net/httpflags/FlagValue;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1451
    return-void
.end method

.method private ensureConstrainedValuesIsMutable()V
    .locals 2

    .line 1374
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1375
    .local v0, "tmp":Lcom/google/protobuf/Internal$ProtobufList;, "Lcom/google/protobuf/Internal$ProtobufList<Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;>;"
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1376
    nop

    .line 1377
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 1379
    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lorg/chromium/net/httpflags/FlagValue;
    .locals 1

    .line 1805
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static newBuilder()Lorg/chromium/net/httpflags/FlagValue$Builder;
    .locals 1

    .line 1541
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-virtual {v0}, Lorg/chromium/net/httpflags/FlagValue;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue$Builder;

    return-object v0
.end method

.method public static newBuilder(Lorg/chromium/net/httpflags/FlagValue;)Lorg/chromium/net/httpflags/FlagValue$Builder;
    .locals 1
    .param p0, "prototype"    # Lorg/chromium/net/httpflags/FlagValue;

    .line 1544
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-virtual {v0, p0}, Lorg/chromium/net/httpflags/FlagValue;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue$Builder;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1518
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0}, Lorg/chromium/net/httpflags/FlagValue;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1524
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0, p1}, Lorg/chromium/net/httpflags/FlagValue;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1482
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1489
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1529
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1536
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1506
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1513
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1469
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "data"    # Ljava/nio/ByteBuffer;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1476
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom([B)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1494
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lorg/chromium/net/httpflags/FlagValue;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1501
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue;

    return-object v0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lorg/chromium/net/httpflags/FlagValue;",
            ">;"
        }
    .end annotation

    .line 1811
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-virtual {v0}, Lorg/chromium/net/httpflags/FlagValue;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeConstrainedValues(I)V
    .locals 1
    .param p1, "index"    # I

    .line 1462
    invoke-direct {p0}, Lorg/chromium/net/httpflags/FlagValue;->ensureConstrainedValuesIsMutable()V

    .line 1463
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    .line 1464
    return-void
.end method

.method private setConstrainedValues(ILorg/chromium/net/httpflags/FlagValue$ConstrainedValue;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;

    .line 1392
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1393
    invoke-direct {p0}, Lorg/chromium/net/httpflags/FlagValue;->ensureConstrainedValuesIsMutable()V

    .line 1394
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1395
    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "method"    # Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;
    .param p2, "arg0"    # Ljava/lang/Object;
    .param p3, "arg1"    # Ljava/lang/Object;

    .line 1747
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 1789
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 1786
    :pswitch_0
    return-object v2

    .line 1783
    :pswitch_1
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    return-object v0

    .line 1768
    :pswitch_2
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->PARSER:Lcom/google/protobuf/Parser;

    .line 1769
    .local v0, "parser":Lcom/google/protobuf/Parser;, "Lcom/google/protobuf/Parser<Lorg/chromium/net/httpflags/FlagValue;>;"
    if-nez v0, :cond_1

    .line 1770
    const-class v1, Lorg/chromium/net/httpflags/FlagValue;

    monitor-enter v1

    .line 1771
    :try_start_0
    sget-object v2, Lorg/chromium/net/httpflags/FlagValue;->PARSER:Lcom/google/protobuf/Parser;

    move-object v0, v2

    .line 1772
    if-nez v0, :cond_0

    .line 1773
    new-instance v2, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object v3, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-direct {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    move-object v0, v2

    .line 1776
    sput-object v0, Lorg/chromium/net/httpflags/FlagValue;->PARSER:Lcom/google/protobuf/Parser;

    .line 1778
    :cond_0
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 1780
    :cond_1
    :goto_0
    return-object v0

    .line 1765
    .end local v0    # "parser":Lcom/google/protobuf/Parser;, "Lcom/google/protobuf/Parser<Lorg/chromium/net/httpflags/FlagValue;>;"
    :pswitch_3
    sget-object v0, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    return-object v0

    .line 1755
    :pswitch_4
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "constrainedValues_"

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const-class v2, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;

    aput-object v2, v0, v1

    .line 1759
    .local v0, "objects":[Ljava/lang/Object;
    const-string v1, "\u0001\u0001\u0000\u0000\u0008\u0008\u0001\u0000\u0001\u0000\u0008\u001b"

    .line 1761
    .local v1, "info":Ljava/lang/String;
    sget-object v2, Lorg/chromium/net/httpflags/FlagValue;->DEFAULT_INSTANCE:Lorg/chromium/net/httpflags/FlagValue;

    invoke-static {v2, v1, v0}, Lorg/chromium/net/httpflags/FlagValue;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 1752
    .end local v0    # "objects":[Ljava/lang/Object;
    .end local v1    # "info":Ljava/lang/String;
    :pswitch_5
    new-instance v0, Lorg/chromium/net/httpflags/FlagValue$Builder;

    invoke-direct {v0, v2}, Lorg/chromium/net/httpflags/FlagValue$Builder;-><init>(Lorg/chromium/net/httpflags/FlagValue-IA;)V

    return-object v0

    .line 1749
    :pswitch_6
    new-instance v0, Lorg/chromium/net/httpflags/FlagValue;

    invoke-direct {v0}, Lorg/chromium/net/httpflags/FlagValue;-><init>()V

    return-object v0

    nop

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

.method public getConstrainedValues(I)Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;
    .locals 1
    .param p1, "index"    # I

    .line 1358
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;

    return-object v0
.end method

.method public getConstrainedValuesCount()I
    .locals 1

    .line 1345
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getConstrainedValuesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/chromium/net/httpflags/FlagValue$ConstrainedValue;",
            ">;"
        }
    .end annotation

    .line 1319
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getConstrainedValuesOrBuilder(I)Lorg/chromium/net/httpflags/FlagValue$ConstrainedValueOrBuilder;
    .locals 1
    .param p1, "index"    # I

    .line 1371
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/httpflags/FlagValue$ConstrainedValueOrBuilder;

    return-object v0
.end method

.method public getConstrainedValuesOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lorg/chromium/net/httpflags/FlagValue$ConstrainedValueOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1332
    iget-object v0, p0, Lorg/chromium/net/httpflags/FlagValue;->constrainedValues_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method
