.class public final enum Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;
.super Ljava/lang/Enum;
.source "ModoSincronizacao.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

.field public static final enum COMPLETO:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

.field public static final enum CONSULTA:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

.field public static final enum ENVIO:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

.field public static final enum POR_ROTA:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;


# direct methods
.method private static synthetic $values()[Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;
    .locals 3

    .line 3
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    sget-object v1, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->COMPLETO:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->POR_ROTA:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->ENVIO:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->CONSULTA:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 4
    new-instance v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const-string v1, "COMPLETO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->COMPLETO:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    .line 5
    new-instance v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const-string v1, "POR_ROTA"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->POR_ROTA:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    .line 6
    new-instance v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const-string v1, "ENVIO"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->ENVIO:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    .line 7
    new-instance v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    const-string v1, "CONSULTA"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->CONSULTA:Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    .line 3
    invoke-static {}, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->$values()[Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    move-result-object v0

    sput-object v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->$VALUES:[Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 3
    const-class v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    return-object v0
.end method

.method public static values()[Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;
    .locals 1

    .line 3
    sget-object v0, Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->$VALUES:[Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    invoke-virtual {v0}, [Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/coleta/ambientuus/domain/model/ModoSincronizacao;

    return-object v0
.end method
