.class public final enum Lcom/coleta/ambientuus/domain/model/TipoPesagem;
.super Ljava/lang/Enum;
.source "TipoPesagem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/coleta/ambientuus/domain/model/TipoPesagem;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/coleta/ambientuus/domain/model/TipoPesagem;

.field public static final enum BLUETOOTH:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

.field public static final enum MANUAL:Lcom/coleta/ambientuus/domain/model/TipoPesagem;


# instance fields
.field private final valor:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    .locals 3

    .line 3
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    sget-object v1, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->MANUAL:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->BLUETOOTH:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 4
    new-instance v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    const-string v1, "MANUAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->MANUAL:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    .line 5
    new-instance v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    const-string v1, "BLUETOOTH"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->BLUETOOTH:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    .line 3
    invoke-static {}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->$values()[Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    move-result-object v0

    sput-object v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->$VALUES:[Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "valor"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 10
    iput-object p3, p0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->valor:Ljava/lang/String;

    .line 11
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    .locals 5
    .param p0, "valor"    # Ljava/lang/String;

    .line 18
    invoke-static {}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->values()[Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 19
    .local v3, "tipo":Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    invoke-virtual {v3}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 20
    return-object v3

    .line 18
    .end local v3    # "tipo":Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 23
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 3
    const-class v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    return-object v0
.end method

.method public static values()[Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    .locals 1

    .line 3
    sget-object v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->$VALUES:[Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-virtual {v0}, [Lcom/coleta/ambientuus/domain/model/TipoPesagem;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    return-object v0
.end method


# virtual methods
.method public getValor()Ljava/lang/String;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->valor:Ljava/lang/String;

    return-object v0
.end method
