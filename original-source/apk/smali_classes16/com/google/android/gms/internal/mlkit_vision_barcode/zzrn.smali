.class public final enum Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;
.super Ljava/lang/Enum;
.source "com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1"

# interfaces
.implements Lcom/google/android/gms/internal/mlkit_vision_barcode/zzfc;


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzd:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zze:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzf:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzg:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzh:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzi:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzj:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzk:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field public static final enum zzn:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

.field private static final synthetic zzo:[Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;


# instance fields
.field private final zzp:I


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    const-string v1, "FORMAT_UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 2
    const-string v1, "FORMAT_CODE_128"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 3
    const-string v1, "FORMAT_CODE_39"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 4
    const-string v1, "FORMAT_CODE_93"

    const/4 v5, 0x3

    const/4 v6, 0x4

    invoke-direct {v0, v1, v5, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzd:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 5
    const-string v1, "FORMAT_CODABAR"

    const/16 v7, 0x8

    invoke-direct {v0, v1, v6, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zze:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 6
    const-string v1, "FORMAT_DATA_MATRIX"

    const/4 v8, 0x5

    const/16 v9, 0x10

    invoke-direct {v0, v1, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzf:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 7
    const-string v1, "FORMAT_EAN_13"

    const/4 v9, 0x6

    const/16 v10, 0x20

    invoke-direct {v0, v1, v9, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzg:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 8
    const-string v1, "FORMAT_EAN_8"

    const/4 v10, 0x7

    const/16 v11, 0x40

    invoke-direct {v0, v1, v10, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzh:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 9
    const-string v1, "FORMAT_ITF"

    const/16 v11, 0x80

    invoke-direct {v0, v1, v7, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzi:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 10
    const-string v1, "FORMAT_QR_CODE"

    const/16 v11, 0x9

    const/16 v12, 0x100

    invoke-direct {v0, v1, v11, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzj:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 11
    const-string v1, "FORMAT_UPC_A"

    const/16 v12, 0xa

    const/16 v13, 0x200

    invoke-direct {v0, v1, v12, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzk:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 12
    const-string v1, "FORMAT_UPC_E"

    const/16 v13, 0xb

    const/16 v14, 0x400

    invoke-direct {v0, v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 13
    const-string v1, "FORMAT_PDF417"

    const/16 v14, 0xc

    const/16 v15, 0x800

    invoke-direct {v0, v1, v14, v15}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    .line 14
    const-string v1, "FORMAT_AZTEC"

    const/16 v15, 0xd

    move/from16 v16, v2

    const/16 v2, 0x1000

    invoke-direct {v0, v1, v15, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzn:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    const/16 v0, 0xe

    new-array v0, v0, [Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v16

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzd:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v5

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zze:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v6

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzf:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v8

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzg:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v9

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzh:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v10

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzi:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v7

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzj:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v11

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzk:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v12

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v13

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v14

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzn:Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    aput-object v1, v0, v15

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzo:[Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzp:I

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzo:[Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;

    return-object v0
.end method


# virtual methods
.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzrn;->zzp:I

    return v0
.end method
