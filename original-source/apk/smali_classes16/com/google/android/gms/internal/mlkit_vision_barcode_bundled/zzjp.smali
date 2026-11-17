.class public final Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;
.super Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;
.source "com.google.mlkit:barcode-scanning@@17.3.0"

# interfaces
.implements Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfn;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;


# instance fields
.field private zzd:I

.field private zze:I

.field private zzf:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjj;

.field private zzg:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzio;

.field private zzh:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzho;

.field private zzi:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zziz;

.field private zzj:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzii;

.field private zzk:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzht;

.field private zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjs;

.field private zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhw;

.field private zzn:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zziu;

.field private zzo:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzix;

.field private zzp:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzix;

.field private zzq:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzix;

.field private zzr:Z

.field private zzs:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzil;

.field private zzt:I

.field private zzu:Z

.field private zzv:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjn;

.field private zzw:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhq;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;

    invoke-direct {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;

    const-class v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzV(Ljava/lang/Class;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;->zzt:I

    return-void
.end method

.method static synthetic zzc()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;

    return-object v0
.end method


# virtual methods
.method protected final zzg(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 2
    add-int/lit8 p1, p1, -0x1

    const/4 p2, 0x0

    const/4 p3, 0x1

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    return-object p2

    .line 1
    :pswitch_1
    sget-object p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;

    return-object p1

    :pswitch_2
    new-instance p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjo;

    .line 3
    invoke-direct {p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjo;-><init>(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhi;)V

    return-object p1

    :pswitch_3
    new-instance p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;

    invoke-direct {p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;-><init>()V

    return-object p1

    .line 2
    :pswitch_4
    const/16 p1, 0x15

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "zzd"

    const/4 v0, 0x0

    aput-object p2, p1, v0

    const-string p2, "zze"

    aput-object p2, p1, p3

    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhx;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;

    const/4 p3, 0x2

    aput-object p2, p1, p3

    const-string p2, "zzf"

    const/4 p3, 0x3

    aput-object p2, p1, p3

    const-string p2, "zzg"

    const/4 p3, 0x4

    aput-object p2, p1, p3

    const-string p2, "zzh"

    const/4 p3, 0x5

    aput-object p2, p1, p3

    const-string p2, "zzi"

    const/4 p3, 0x6

    aput-object p2, p1, p3

    const-string p2, "zzo"

    const/4 p3, 0x7

    aput-object p2, p1, p3

    const-string p2, "zzp"

    const/16 p3, 0x8

    aput-object p2, p1, p3

    const-string p2, "zzq"

    const/16 p3, 0x9

    aput-object p2, p1, p3

    const-string p2, "zzr"

    const/16 p3, 0xa

    aput-object p2, p1, p3

    const-string p2, "zzj"

    const/16 p3, 0xb

    aput-object p2, p1, p3

    const-string p2, "zzs"

    const/16 p3, 0xc

    aput-object p2, p1, p3

    const-string p2, "zzk"

    const/16 p3, 0xd

    aput-object p2, p1, p3

    const-string p2, "zzl"

    const/16 p3, 0xe

    aput-object p2, p1, p3

    const-string p2, "zzt"

    const/16 p3, 0xf

    aput-object p2, p1, p3

    const-string p2, "zzm"

    const/16 p3, 0x10

    aput-object p2, p1, p3

    const-string p2, "zzu"

    const/16 p3, 0x11

    aput-object p2, p1, p3

    const-string p2, "zzv"

    const/16 p3, 0x12

    aput-object p2, p1, p3

    const-string p2, "zzn"

    const/16 p3, 0x13

    aput-object p2, p1, p3

    const-string p2, "zzw"

    const/16 p3, 0x14

    aput-object p2, p1, p3

    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;

    const-string p3, "\u0001\u0013\u0000\u0001\u0001\u0013\u0013\u0000\u0000\u0000\u0001\u180c\u0000\u0002\u1009\u0001\u0003\u1009\u0002\u0004\u1009\u0003\u0005\u1009\u0004\u0006\u1009\n\u0007\u1009\u000b\u0008\u1009\u000c\t\u1007\r\n\u1009\u0005\u000b\u1009\u000e\u000c\u1009\u0006\r\u1009\u0007\u000e\u1004\u000f\u000f\u1009\u0008\u0010\u1007\u0010\u0011\u1009\u0011\u0012\u1009\t\u0013\u1009\u0012"

    invoke-static {p2, p3, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzjp;->zzS(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1
    :pswitch_5
    invoke-static {p3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
