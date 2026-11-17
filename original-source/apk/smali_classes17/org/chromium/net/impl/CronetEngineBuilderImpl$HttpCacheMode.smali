.class final enum Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;
.super Ljava/lang/Enum;
.source "CronetEngineBuilderImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/impl/CronetEngineBuilderImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "HttpCacheMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

.field public static final enum DISABLED:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

.field public static final enum DISK:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

.field public static final enum DISK_NO_HTTP:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

.field public static final enum MEMORY:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;


# instance fields
.field private final mContentCacheEnabled:Z

.field private final mType:I


# direct methods
.method private static synthetic $values()[Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;
    .locals 3

    .line 75
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    sget-object v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISABLED:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISK:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISK_NO_HTTP:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->MEMORY:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 77
    new-instance v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    const-string v1, "DISABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2, v2}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISABLED:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    .line 78
    new-instance v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    const-string v1, "DISK"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3, v3}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISK:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    .line 79
    new-instance v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    const-string v1, "DISK_NO_HTTP"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v3, v2}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISK_NO_HTTP:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    .line 80
    new-instance v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    const-string v1, "MEMORY"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v4, v3}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->MEMORY:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    .line 75
    invoke-static {}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->$values()[Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->$VALUES:[Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIZ)V
    .locals 0
    .param p3, "type"    # I
    .param p4, "contentCacheEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ)V"
        }
    .end annotation

    .line 85
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 86
    iput-boolean p4, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->mContentCacheEnabled:Z

    .line 87
    iput p3, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->mType:I

    .line 88
    return-void
.end method

.method static fromPublicBuilderCacheMode(I)Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;
    .locals 2
    .param p0, "cacheMode"    # I

    .line 116
    packed-switch p0, :pswitch_data_0

    .line 126
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown public builder cache mode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :pswitch_0
    sget-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISK:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    return-object v0

    .line 120
    :pswitch_1
    sget-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISK_NO_HTTP:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    return-object v0

    .line 124
    :pswitch_2
    sget-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->MEMORY:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    return-object v0

    .line 118
    :pswitch_3
    sget-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->DISABLED:Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 75
    const-class v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    return-object v0
.end method

.method public static values()[Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;
    .locals 1

    .line 75
    sget-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->$VALUES:[Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    invoke-virtual {v0}, [Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;

    return-object v0
.end method


# virtual methods
.method getType()I
    .locals 1

    .line 91
    iget v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->mType:I

    return v0
.end method

.method isContentCacheEnabled()Z
    .locals 1

    .line 95
    iget-boolean v0, p0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->mContentCacheEnabled:Z

    return v0
.end method

.method toPublicBuilderCacheMode()I
    .locals 2

    .line 100
    sget-object v0, Lorg/chromium/net/impl/CronetEngineBuilderImpl$1;->$SwitchMap$org$chromium$net$impl$CronetEngineBuilderImpl$HttpCacheMode:[I

    invoke-virtual {p0}, Lorg/chromium/net/impl/CronetEngineBuilderImpl$HttpCacheMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 110
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown internal builder cache mode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :pswitch_0
    const/4 v0, 0x1

    return v0

    .line 106
    :pswitch_1
    const/4 v0, 0x3

    return v0

    .line 104
    :pswitch_2
    const/4 v0, 0x2

    return v0

    .line 102
    :pswitch_3
    const/4 v0, 0x0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
