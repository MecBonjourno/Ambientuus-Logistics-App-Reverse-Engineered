.class public final enum Lorg/chromium/net/impl/CronetLogger$CronetSource;
.super Ljava/lang/Enum;
.source "CronetLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/impl/CronetLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CronetSource"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/chromium/net/impl/CronetLogger$CronetSource;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/chromium/net/impl/CronetLogger$CronetSource;

.field public static final enum CRONET_SOURCE_FALLBACK:Lorg/chromium/net/impl/CronetLogger$CronetSource;

.field public static final enum CRONET_SOURCE_PLATFORM:Lorg/chromium/net/impl/CronetLogger$CronetSource;

.field public static final enum CRONET_SOURCE_PLAY_SERVICES:Lorg/chromium/net/impl/CronetLogger$CronetSource;

.field public static final enum CRONET_SOURCE_STATICALLY_LINKED:Lorg/chromium/net/impl/CronetLogger$CronetSource;

.field public static final enum CRONET_SOURCE_UNSPECIFIED:Lorg/chromium/net/impl/CronetLogger$CronetSource;


# direct methods
.method private static synthetic $values()[Lorg/chromium/net/impl/CronetLogger$CronetSource;
    .locals 3

    .line 15
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/chromium/net/impl/CronetLogger$CronetSource;

    sget-object v1, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_UNSPECIFIED:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_STATICALLY_LINKED:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_PLAY_SERVICES:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_FALLBACK:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_PLATFORM:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 17
    new-instance v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const-string v1, "CRONET_SOURCE_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/impl/CronetLogger$CronetSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_UNSPECIFIED:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 19
    new-instance v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const-string v1, "CRONET_SOURCE_STATICALLY_LINKED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/impl/CronetLogger$CronetSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_STATICALLY_LINKED:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 21
    new-instance v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const-string v1, "CRONET_SOURCE_PLAY_SERVICES"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/impl/CronetLogger$CronetSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_PLAY_SERVICES:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 23
    new-instance v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const-string v1, "CRONET_SOURCE_FALLBACK"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/impl/CronetLogger$CronetSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_FALLBACK:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 25
    new-instance v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;

    const-string v1, "CRONET_SOURCE_PLATFORM"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/impl/CronetLogger$CronetSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_PLATFORM:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 15
    invoke-static {}, Lorg/chromium/net/impl/CronetLogger$CronetSource;->$values()[Lorg/chromium/net/impl/CronetLogger$CronetSource;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->$VALUES:[Lorg/chromium/net/impl/CronetLogger$CronetSource;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/chromium/net/impl/CronetLogger$CronetSource;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 15
    const-class v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;

    return-object v0
.end method

.method public static values()[Lorg/chromium/net/impl/CronetLogger$CronetSource;
    .locals 1

    .line 15
    sget-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->$VALUES:[Lorg/chromium/net/impl/CronetLogger$CronetSource;

    invoke-virtual {v0}, [Lorg/chromium/net/impl/CronetLogger$CronetSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/chromium/net/impl/CronetLogger$CronetSource;

    return-object v0
.end method
