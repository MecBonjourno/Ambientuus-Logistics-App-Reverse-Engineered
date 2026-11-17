.class public final enum Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;
.super Ljava/lang/Enum;
.source "com.google.android.gms:play-services-fido@@21.0.0"

# interfaces
.implements Lcom/google/android/gms/fido/fido2/api/common/Algorithm;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;",
        ">;",
        "Lcom/google/android/gms/fido/fido2/api/common/Algorithm;"
    }
.end annotation


# static fields
.field public static final enum LEGACY_RS1:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum PS256:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

.field public static final enum PS384:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

.field public static final enum PS512:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

.field public static final enum RS1:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

.field public static final enum RS256:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

.field public static final enum RS384:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

.field public static final enum RS512:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

.field private static final synthetic zza:[Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;


# instance fields
.field private final zzb:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    const/16 v1, -0x101

    const-string v2, "RS256"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->RS256:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    new-instance v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    .line 2
    const-string v1, "RS384"

    const/4 v2, 0x1

    const/16 v4, -0x102

    invoke-direct {v0, v1, v2, v4}, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->RS384:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    new-instance v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    .line 3
    const-string v1, "RS512"

    const/4 v4, 0x2

    const/16 v5, -0x103

    invoke-direct {v0, v1, v4, v5}, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->RS512:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    new-instance v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    .line 4
    const-string v1, "LEGACY_RS1"

    const/4 v5, 0x3

    const/16 v6, -0x106

    invoke-direct {v0, v1, v5, v6}, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->LEGACY_RS1:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    new-instance v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    .line 5
    const-string v1, "PS256"

    const/4 v6, 0x4

    const/16 v7, -0x25

    invoke-direct {v0, v1, v6, v7}, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->PS256:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    new-instance v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    .line 6
    const-string v1, "PS384"

    const/4 v7, 0x5

    const/16 v8, -0x26

    invoke-direct {v0, v1, v7, v8}, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->PS384:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    new-instance v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    .line 7
    const-string v1, "PS512"

    const/4 v8, 0x6

    const/16 v9, -0x27

    invoke-direct {v0, v1, v8, v9}, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->PS512:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    new-instance v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    .line 8
    const-string v1, "RS1"

    const/4 v9, 0x7

    const v10, -0xffff

    invoke-direct {v0, v1, v9, v10}, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->RS1:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    const/16 v0, 0x8

    new-array v0, v0, [Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    sget-object v1, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->RS256:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->RS384:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->RS512:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->LEGACY_RS1:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    aput-object v1, v0, v5

    sget-object v1, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->PS256:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    aput-object v1, v0, v6

    sget-object v1, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->PS384:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    aput-object v1, v0, v7

    sget-object v1, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->PS512:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    aput-object v1, v0, v8

    sget-object v1, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->RS1:Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    aput-object v1, v0, v9

    sput-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->zza:[Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->zzb:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 1
    const-class v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    .end local p0    # "name":Ljava/lang/String;
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    return-object p0
.end method

.method public static values()[Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->zza:[Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    invoke-virtual {v0}, [Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;

    return-object v0
.end method


# virtual methods
.method public getAlgoValue()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/fido/fido2/api/common/RSAAlgorithm;->zzb:I

    return v0
.end method
