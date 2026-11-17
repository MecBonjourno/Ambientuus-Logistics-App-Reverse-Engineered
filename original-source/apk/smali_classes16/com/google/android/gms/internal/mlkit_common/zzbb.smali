.class public final enum Lcom/google/android/gms/internal/mlkit_common/zzbb;
.super Ljava/lang/Enum;
.source "com.google.mlkit:common@@18.11.0"


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/mlkit_common/zzbb;

.field public static final enum zzb:Lcom/google/android/gms/internal/mlkit_common/zzbb;

.field public static final enum zzc:Lcom/google/android/gms/internal/mlkit_common/zzbb;

.field private static final synthetic zzd:[Lcom/google/android/gms/internal/mlkit_common/zzbb;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzbb;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/mlkit_common/zzbb;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzbb;->zza:Lcom/google/android/gms/internal/mlkit_common/zzbb;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzbb;

    .line 2
    const-string v1, "SIGNED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/google/android/gms/internal/mlkit_common/zzbb;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzbb;->zzb:Lcom/google/android/gms/internal/mlkit_common/zzbb;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzbb;

    .line 3
    const-string v1, "FIXED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/google/android/gms/internal/mlkit_common/zzbb;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzbb;->zzc:Lcom/google/android/gms/internal/mlkit_common/zzbb;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/google/android/gms/internal/mlkit_common/zzbb;

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzbb;->zza:Lcom/google/android/gms/internal/mlkit_common/zzbb;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzbb;->zzb:Lcom/google/android/gms/internal/mlkit_common/zzbb;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzbb;->zzc:Lcom/google/android/gms/internal/mlkit_common/zzbb;

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzbb;->zzd:[Lcom/google/android/gms/internal/mlkit_common/zzbb;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/mlkit_common/zzbb;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/mlkit_common/zzbb;->zzd:[Lcom/google/android/gms/internal/mlkit_common/zzbb;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/mlkit_common/zzbb;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/mlkit_common/zzbb;

    return-object v0
.end method
