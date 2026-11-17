.class public final Lcom/google/photos/vision/barhopper/zzc;
.super Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;
.source "com.google.mlkit:barcode-scanning@@17.3.0"

# interfaces
.implements Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfn;


# static fields
.field private static final zzb:Lcom/google/photos/vision/barhopper/zzc;


# instance fields
.field private zzA:B

.field private zzd:I

.field private zze:I

.field private zzf:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

.field private zzg:Ljava/lang/String;

.field private zzh:Lcom/google/photos/vision/barhopper/zzad;

.field private zzi:I

.field private zzj:Lcom/google/photos/vision/barhopper/zzp;

.field private zzk:Lcom/google/photos/vision/barhopper/zzv;

.field private zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzco;

.field private zzm:Lcom/google/photos/vision/barhopper/zzah;

.field private zzn:Lcom/google/photos/vision/barhopper/zzao;

.field private zzo:Lcom/google/photos/vision/barhopper/zzak;

.field private zzp:Lcom/google/photos/vision/barhopper/zzz;

.field private zzq:Lcom/google/photos/vision/barhopper/zzn;

.field private zzr:Lcom/google/photos/vision/barhopper/zzr;

.field private zzs:Lcom/google/photos/vision/barhopper/zzj;

.field private zzt:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

.field private zzu:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzen;

.field private zzv:Ljava/lang/String;

.field private zzw:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

.field private zzx:Z

.field private zzy:D

.field private zzz:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/photos/vision/barhopper/zzc;

    invoke-direct {v0}, Lcom/google/photos/vision/barhopper/zzc;-><init>()V

    sput-object v0, Lcom/google/photos/vision/barhopper/zzc;->zzb:Lcom/google/photos/vision/barhopper/zzc;

    .line 2
    const-class v1, Lcom/google/photos/vision/barhopper/zzc;

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzV(Ljava/lang/Class;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;-><init>()V

    const/4 v0, 0x2

    iput-byte v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzA:B

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    iput-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzf:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzg:Ljava/lang/String;

    .line 3
    invoke-static {}, Lcom/google/photos/vision/barhopper/zzc;->zzP()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    move-result-object v1

    iput-object v1, p0, Lcom/google/photos/vision/barhopper/zzc;->zzt:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    .line 4
    invoke-static {}, Lcom/google/photos/vision/barhopper/zzc;->zzO()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzen;

    move-result-object v1

    iput-object v1, p0, Lcom/google/photos/vision/barhopper/zzc;->zzu:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzen;

    iput-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzv:Ljava/lang/String;

    .line 5
    invoke-static {}, Lcom/google/photos/vision/barhopper/zzc;->zzP()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    move-result-object v0

    iput-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzw:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzx:Z

    sget-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    iput-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzz:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    return-void
.end method

.method static synthetic zzc()Lcom/google/photos/vision/barhopper/zzc;
    .locals 1

    sget-object v0, Lcom/google/photos/vision/barhopper/zzc;->zzb:Lcom/google/photos/vision/barhopper/zzc;

    return-object v0
.end method

.method static synthetic zzp(Lcom/google/photos/vision/barhopper/zzc;ILcom/google/photos/vision/barhopper/zzaf;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzt:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    .line 2
    invoke-interface {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->zzc()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzQ(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    move-result-object v0

    iput-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzt:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    :cond_0
    iget-object p0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzt:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    .line 4
    invoke-interface {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final zzA()I
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzi:I

    invoke-static {v0}, Lcom/google/photos/vision/barhopper/zzg;->zza(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public final zza()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzt:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    invoke-interface {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->size()I

    move-result v0

    return v0
.end method

.method public final zzb()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzco;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzco;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzco;->zzb()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzco;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzd()Lcom/google/photos/vision/barhopper/zzn;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzq:Lcom/google/photos/vision/barhopper/zzn;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/photos/vision/barhopper/zzn;->zzd()Lcom/google/photos/vision/barhopper/zzn;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zze()Lcom/google/photos/vision/barhopper/zzp;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzj:Lcom/google/photos/vision/barhopper/zzp;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/photos/vision/barhopper/zzp;->zzc()Lcom/google/photos/vision/barhopper/zzp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzf()Lcom/google/photos/vision/barhopper/zzr;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzr:Lcom/google/photos/vision/barhopper/zzr;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/photos/vision/barhopper/zzr;->zzb()Lcom/google/photos/vision/barhopper/zzr;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method protected final zzg(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 2
    add-int/lit8 p1, p1, -0x1

    const/4 p3, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    if-nez p2, :cond_0

    move v0, v1

    goto/16 :goto_0

    .line 1
    :pswitch_1
    sget-object p1, Lcom/google/photos/vision/barhopper/zzc;->zzb:Lcom/google/photos/vision/barhopper/zzc;

    return-object p1

    :pswitch_2
    new-instance p1, Lcom/google/photos/vision/barhopper/zzb;

    .line 3
    invoke-direct {p1, p3}, Lcom/google/photos/vision/barhopper/zzb;-><init>(Lcom/google/photos/vision/barhopper/zza;)V

    return-object p1

    :pswitch_3
    new-instance p1, Lcom/google/photos/vision/barhopper/zzc;

    .line 4
    invoke-direct {p1}, Lcom/google/photos/vision/barhopper/zzc;-><init>()V

    return-object p1

    .line 2
    :pswitch_4
    const/16 p1, 0x1b

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "zzd"

    aput-object p2, p1, v1

    const-string p2, "zze"

    aput-object p2, p1, v0

    sget-object p2, Lcom/google/photos/vision/barhopper/zzd;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;

    const/4 p3, 0x2

    aput-object p2, p1, p3

    const-string p2, "zzf"

    const/4 p3, 0x3

    aput-object p2, p1, p3

    const-string p2, "zzg"

    const/4 p3, 0x4

    aput-object p2, p1, p3

    const-string p2, "zzi"

    const/4 p3, 0x5

    aput-object p2, p1, p3

    sget-object p2, Lcom/google/photos/vision/barhopper/zzf;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;

    const/4 p3, 0x6

    aput-object p2, p1, p3

    const-string p2, "zzj"

    const/4 p3, 0x7

    aput-object p2, p1, p3

    const-string p2, "zzk"

    const/16 p3, 0x8

    aput-object p2, p1, p3

    const-string p2, "zzl"

    const/16 p3, 0x9

    aput-object p2, p1, p3

    const-string p2, "zzm"

    const/16 p3, 0xa

    aput-object p2, p1, p3

    const-string p2, "zzn"

    const/16 p3, 0xb

    aput-object p2, p1, p3

    const-string p2, "zzo"

    const/16 p3, 0xc

    aput-object p2, p1, p3

    const-string p2, "zzt"

    const/16 p3, 0xd

    aput-object p2, p1, p3

    const-class p2, Lcom/google/photos/vision/barhopper/zzaf;

    const/16 p3, 0xe

    aput-object p2, p1, p3

    const-string p3, "zzv"

    const/16 v0, 0xf

    aput-object p3, p1, v0

    const-string p3, "zzw"

    const/16 v0, 0x10

    aput-object p3, p1, v0

    const/16 p3, 0x11

    aput-object p2, p1, p3

    const-string p2, "zzz"

    const/16 p3, 0x12

    aput-object p2, p1, p3

    const-string p2, "zzp"

    const/16 p3, 0x13

    aput-object p2, p1, p3

    const-string p2, "zzq"

    const/16 p3, 0x14

    aput-object p2, p1, p3

    const-string p2, "zzr"

    const/16 p3, 0x15

    aput-object p2, p1, p3

    const-string p2, "zzu"

    const/16 p3, 0x16

    aput-object p2, p1, p3

    const-string p2, "zzs"

    const/16 p3, 0x17

    aput-object p2, p1, p3

    const-string p2, "zzx"

    const/16 p3, 0x18

    aput-object p2, p1, p3

    const-string p2, "zzy"

    const/16 p3, 0x19

    aput-object p2, p1, p3

    const-string p2, "zzh"

    const/16 p3, 0x1a

    aput-object p2, p1, p3

    sget-object p2, Lcom/google/photos/vision/barhopper/zzc;->zzb:Lcom/google/photos/vision/barhopper/zzc;

    const-string p3, "\u0004\u0016\u0000\u0001\u0001\u0017\u0016\u0000\u0003\u000b\u0001\u1d0c\u0000\u0002\u150a\u0001\u0003\u1508\u0002\u0004\u1d0c\u0004\u0005\u1409\u0005\u0006\u1009\u0006\u0007\u1009\u0007\u0008\u1409\u0008\t\u1409\t\n\u1409\n\u000b\u041b\u000c\u1008\u000f\r\u041b\u000e\u100a\u0012\u000f\u1409\u000b\u0010\u1009\u000c\u0011\u1009\r\u0012\u0016\u0013\u1009\u000e\u0014\u1007\u0010\u0015\u1000\u0011\u0017\u1009\u0003"

    invoke-static {p2, p3, p1}, Lcom/google/photos/vision/barhopper/zzc;->zzS(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :pswitch_5
    iget-byte p1, p0, Lcom/google/photos/vision/barhopper/zzc;->zzA:B

    .line 1
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    .line 2
    :cond_0
    :goto_0
    iput-byte v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzA:B

    return-object p3

    nop

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

.method public final zzh()Lcom/google/photos/vision/barhopper/zzv;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzk:Lcom/google/photos/vision/barhopper/zzv;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/photos/vision/barhopper/zzv;->zzb()Lcom/google/photos/vision/barhopper/zzv;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzi()Lcom/google/photos/vision/barhopper/zzz;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzp:Lcom/google/photos/vision/barhopper/zzz;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/photos/vision/barhopper/zzz;->zzd()Lcom/google/photos/vision/barhopper/zzz;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzj()Lcom/google/photos/vision/barhopper/zzah;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzm:Lcom/google/photos/vision/barhopper/zzah;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/photos/vision/barhopper/zzah;->zzb()Lcom/google/photos/vision/barhopper/zzah;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzk()Lcom/google/photos/vision/barhopper/zzak;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzo:Lcom/google/photos/vision/barhopper/zzak;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/photos/vision/barhopper/zzak;->zzb()Lcom/google/photos/vision/barhopper/zzak;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzl()Lcom/google/photos/vision/barhopper/zzao;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzn:Lcom/google/photos/vision/barhopper/zzao;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/photos/vision/barhopper/zzao;->zzb()Lcom/google/photos/vision/barhopper/zzao;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final zzm()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;
    .locals 1

    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzf:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    return-object v0
.end method

.method public final zzn()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzg:Ljava/lang/String;

    return-object v0
.end method

.method public final zzo()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzt:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    return-object v0
.end method

.method public final zzq()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzr()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzs()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit16 v0, v0, 0x2000

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzt()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzu()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit16 v0, v0, 0x800

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzv()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzw()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzx()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzy()Z
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zzd:I

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzz()I
    .locals 1

    iget v0, p0, Lcom/google/photos/vision/barhopper/zzc;->zze:I

    invoke-static {v0}, Lcom/google/photos/vision/barhopper/zze;->zza(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method
