.class public final enum Lcom/google/android/gms/internal/mlkit_vision_common/zzah;
.super Ljava/lang/Enum;
.source "com.google.mlkit:vision-common@@17.3.0"


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

.field public static final enum zzb:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

.field public static final enum zzc:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

.field private static final synthetic zzd:[Lcom/google/android/gms/internal/mlkit_vision_common/zzah;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->zza:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    .line 2
    const-string v1, "SIGNED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->zzb:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    .line 3
    const-string v1, "FIXED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->zzc:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->zza:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->zzb:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->zzc:Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->zzd:[Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/mlkit_vision_common/zzah;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->zzd:[Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/mlkit_vision_common/zzah;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/mlkit_vision_common/zzah;

    return-object v0
.end method
