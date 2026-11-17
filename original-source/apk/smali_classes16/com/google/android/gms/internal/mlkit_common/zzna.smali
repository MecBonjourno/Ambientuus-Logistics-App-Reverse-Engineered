.class public final enum Lcom/google/android/gms/internal/mlkit_common/zzna;
.super Ljava/lang/Enum;
.source "com.google.mlkit:common@@18.11.0"

# interfaces
.implements Lcom/google/android/gms/internal/mlkit_common/zzba;


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzb:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzc:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzd:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zze:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzf:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzg:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzh:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzi:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzj:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzk:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzl:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field public static final enum zzm:Lcom/google/android/gms/internal/mlkit_common/zzna;

.field private static final synthetic zzn:[Lcom/google/android/gms/internal/mlkit_common/zzna;


# instance fields
.field private final zzo:I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    const-string v1, "UNKNOWN_STATUS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zza:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 2
    const-string v1, "EXPLICITLY_REQUESTED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzb:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 3
    const-string v1, "IMPLICITLY_REQUESTED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzc:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 4
    const-string v1, "MODEL_INFO_RETRIEVAL_SUCCEEDED"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5, v5}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzd:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 5
    const-string v1, "MODEL_INFO_RETRIEVAL_FAILED"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6, v6}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zze:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 6
    const-string v1, "SCHEDULED"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7, v7}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzf:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 7
    const-string v1, "DOWNLOADING"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8, v8}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzg:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 8
    const-string v1, "SUCCEEDED"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9, v9}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzh:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 9
    const-string v1, "FAILED"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10, v10}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzi:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 10
    const-string v1, "LIVE"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11, v11}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzj:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 11
    const-string v1, "UPDATE_AVAILABLE"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12, v12}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzk:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 12
    const-string v1, "DOWNLOADED"

    const/16 v13, 0xb

    invoke-direct {v0, v1, v13, v13}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzl:Lcom/google/android/gms/internal/mlkit_common/zzna;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzna;

    .line 13
    const-string v1, "STARTED"

    const/16 v14, 0xc

    invoke-direct {v0, v1, v14, v14}, Lcom/google/android/gms/internal/mlkit_common/zzna;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzm:Lcom/google/android/gms/internal/mlkit_common/zzna;

    const/16 v0, 0xd

    new-array v0, v0, [Lcom/google/android/gms/internal/mlkit_common/zzna;

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zza:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzb:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzc:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzd:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v5

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zze:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v6

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzf:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v7

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzg:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v8

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzh:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v9

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzi:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v10

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzj:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v11

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzk:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v12

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzl:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v13

    sget-object v1, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzm:Lcom/google/android/gms/internal/mlkit_common/zzna;

    aput-object v1, v0, v14

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzn:[Lcom/google/android/gms/internal/mlkit_common/zzna;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzo:I

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/mlkit_common/zzna;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzn:[Lcom/google/android/gms/internal/mlkit_common/zzna;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/mlkit_common/zzna;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/mlkit_common/zzna;

    return-object v0
.end method


# virtual methods
.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/mlkit_common/zzna;->zzo:I

    return v0
.end method
