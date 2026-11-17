.class final Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;
.super Ljava/lang/Object;
.source "com.google.mlkit:barcode-scanning@@17.3.0"

# interfaces
.implements Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final zza:[I

.field private static final zzb:Lsun/misc/Unsafe;


# instance fields
.field private final zzc:[I

.field private final zzd:[Ljava/lang/Object;

.field private final zze:I

.field private final zzf:I

.field private final zzg:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

.field private final zzh:Z

.field private final zzi:[I

.field private final zzj:I

.field private final zzk:I

.field private final zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;

.field private final zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zza:[I

    invoke-static {}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzg()Lsun/misc/Unsafe;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    return-void
.end method

.method private constructor <init>([I[Ljava/lang/Object;IILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;Z[IIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfs;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzez;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfh;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    iput-object p2, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd:[Ljava/lang/Object;

    iput p3, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zze:I

    iput p4, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzf:I

    const/4 p1, 0x0

    if-eqz p13, :cond_0

    instance-of p2, p5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;

    if-eqz p2, :cond_0

    const/4 p1, 0x1

    :cond_0
    iput-boolean p1, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    iput-object p7, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzi:[I

    iput p8, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzj:I

    iput p9, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzk:I

    iput-object p12, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;

    iput-object p13, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;

    iput-object p5, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzg:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    return-void
.end method

.method private static zzA(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzL(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    return-void

    .line 1
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 2
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "Mutating immutable message: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final zzB(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 4

    .line 1
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v0

    const v1, 0xfffff

    and-int/2addr v0, v1

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    int-to-long v2, v0

    .line 3
    invoke-virtual {v1, p2, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 6
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object p2

    .line 7
    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 8
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzL(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 9
    invoke-virtual {p2, p1, v2, v3, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_0

    .line 10
    :cond_1
    invoke-interface {p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zze()Ljava/lang/Object;

    move-result-object v1

    .line 11
    invoke-interface {p2, v1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 12
    invoke-virtual {p2, p1, v2, v3, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 13
    :goto_0
    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    return-void

    .line 12
    :cond_2
    sget-object p3, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 14
    invoke-virtual {p3, p1, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p3

    .line 15
    invoke-static {p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzL(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 16
    invoke-interface {p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zze()Ljava/lang/Object;

    move-result-object v1

    .line 17
    invoke-interface {p2, v1, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p3, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 18
    invoke-virtual {p3, p1, v2, v3, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move-object p3, v1

    .line 19
    :cond_3
    invoke-interface {p2, p3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 3
    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 4
    aget p1, p1, p3

    .line 5
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Source subfield "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is present but null: "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final zzC(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    aget v0, v0, p3

    .line 2
    invoke-direct {p0, p2, v0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v1

    const v2, 0xfffff

    and-int/2addr v1, v2

    sget-object v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    int-to-long v3, v1

    .line 4
    invoke-virtual {v2, p2, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 7
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object p2

    .line 8
    invoke-direct {p0, p1, v0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-nez v2, :cond_2

    .line 9
    invoke-static {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzL(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 10
    invoke-virtual {p2, p1, v3, v4, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_0

    .line 11
    :cond_1
    invoke-interface {p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zze()Ljava/lang/Object;

    move-result-object v2

    .line 12
    invoke-interface {p2, v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 13
    invoke-virtual {p2, p1, v3, v4, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 14
    :goto_0
    invoke-direct {p0, p1, v0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzE(Ljava/lang/Object;II)V

    return-void

    .line 13
    :cond_2
    sget-object p3, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 15
    invoke-virtual {p3, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p3

    .line 16
    invoke-static {p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzL(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 17
    invoke-interface {p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zze()Ljava/lang/Object;

    move-result-object v0

    .line 18
    invoke-interface {p2, v0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p3, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 19
    invoke-virtual {p3, p1, v3, v4, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move-object p3, v0

    .line 20
    :cond_3
    invoke-interface {p2, p3, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 4
    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 5
    aget p1, p1, p3

    .line 6
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Source subfield "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is present but null: "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final zzD(Ljava/lang/Object;I)V
    .locals 4

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzp(I)I

    move-result p2

    const v0, 0xfffff

    and-int/2addr v0, p2

    int-to-long v0, v0

    const-wide/32 v2, 0xfffff

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    ushr-int/lit8 p2, p2, 0x14

    .line 2
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    const/4 v3, 0x1

    shl-int p2, v3, p2

    or-int/2addr p2, v2

    .line 3
    invoke-static {p1, v0, v1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzq(Ljava/lang/Object;JI)V

    return-void
.end method

.method private final zzE(Ljava/lang/Object;II)V
    .locals 2

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzp(I)I

    move-result p3

    const v0, 0xfffff

    and-int/2addr p3, v0

    int-to-long v0, p3

    .line 2
    invoke-static {p1, v0, v1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzq(Ljava/lang/Object;JI)V

    return-void
.end method

.method private final zzF(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v1

    const v2, 0xfffff

    and-int/2addr v1, v2

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    return-void
.end method

.method private final zzG(Ljava/lang/Object;IILjava/lang/Object;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v1

    const v2, 0xfffff

    and-int/2addr v1, v2

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2, p4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzE(Ljava/lang/Object;II)V

    return-void
.end method

.method private final zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result p1

    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result p2

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private final zzI(Ljava/lang/Object;I)Z
    .locals 7

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzp(I)I

    move-result v0

    const v1, 0xfffff

    and-int v2, v0, v1

    int-to-long v2, v2

    const-wide/32 v4, 0xfffff

    cmp-long v4, v2, v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-nez v4, :cond_14

    .line 2
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result p2

    and-int v0, p2, v1

    invoke-static {p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result p2

    int-to-long v0, v0

    const-wide/16 v2, 0x0

    packed-switch p2, :pswitch_data_0

    .line 16
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 25
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    .line 3
    :pswitch_0
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    return v6

    :cond_0
    return v5

    .line 4
    :pswitch_1
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long p1, p1, v2

    if-eqz p1, :cond_1

    return v6

    :cond_1
    return v5

    .line 5
    :pswitch_2
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_2

    return v6

    :cond_2
    return v5

    .line 6
    :pswitch_3
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long p1, p1, v2

    if-eqz p1, :cond_3

    return v6

    :cond_3
    return v5

    .line 7
    :pswitch_4
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_4

    return v6

    :cond_4
    return v5

    .line 8
    :pswitch_5
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_5

    return v6

    :cond_5
    return v5

    .line 9
    :pswitch_6
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_6

    return v6

    :cond_6
    return v5

    .line 10
    :pswitch_7
    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    return v6

    :cond_7
    return v5

    .line 11
    :pswitch_8
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_8

    return v6

    :cond_8
    return v5

    .line 12
    :pswitch_9
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    .line 13
    instance-of p2, p1, Ljava/lang/String;

    if-eqz p2, :cond_a

    .line 14
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_9

    return v6

    :cond_9
    return v5

    :cond_a
    instance-of p2, p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    if-eqz p2, :cond_c

    .line 15
    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_b

    return v6

    :cond_b
    return v5

    .line 26
    :cond_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 16
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    .line 17
    :pswitch_a
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzw(Ljava/lang/Object;J)Z

    move-result p1

    return p1

    .line 18
    :pswitch_b
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_d

    return v6

    :cond_d
    return v5

    .line 19
    :pswitch_c
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long p1, p1, v2

    if-eqz p1, :cond_e

    return v6

    :cond_e
    return v5

    .line 20
    :pswitch_d
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-eqz p1, :cond_f

    return v6

    :cond_f
    return v5

    .line 21
    :pswitch_e
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long p1, p1, v2

    if-eqz p1, :cond_10

    return v6

    :cond_10
    return v5

    .line 22
    :pswitch_f
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide p1

    cmp-long p1, p1, v2

    if-eqz p1, :cond_11

    return v6

    :cond_11
    return v5

    .line 23
    :pswitch_10
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzb(Ljava/lang/Object;J)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    if-eqz p1, :cond_12

    return v6

    :cond_12
    return v5

    .line 24
    :pswitch_11
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zza(Ljava/lang/Object;J)D

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    cmp-long p1, p1, v2

    if-eqz p1, :cond_13

    return v6

    :cond_13
    return v5

    :cond_14
    ushr-int/lit8 p2, v0, 0x14

    shl-int p2, v6, p2

    .line 26
    invoke-static {p1, v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result p1

    and-int/2addr p1, p2

    if-eqz p1, :cond_15

    return v6

    .line 25
    :cond_15
    return v5

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final zzJ(Ljava/lang/Object;IIII)Z
    .locals 1

    .line 1
    const v0, 0xfffff

    if-ne p3, v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result p1

    return p1

    :cond_0
    and-int p1, p4, p5

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private static zzK(Ljava/lang/Object;ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)Z
    .locals 2

    .line 1
    const v0, 0xfffff

    and-int/2addr p1, v0

    int-to-long v0, p1

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    .line 2
    invoke-interface {p2, p0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzk(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static zzL(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    instance-of v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    if-eqz v0, :cond_1

    check-cast p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzY()Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private final zzM(Ljava/lang/Object;II)Z
    .locals 2

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzp(I)I

    move-result p3

    const v0, 0xfffff

    and-int/2addr p3, v0

    int-to-long v0, p3

    .line 2
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result p1

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private static zzN(Ljava/lang/Object;J)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method private static final zzO(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Ljava/lang/String;

    invoke-interface {p2, p0, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzG(ILjava/lang/String;)V

    return-void

    .line 3
    :cond_0
    check-cast p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    invoke-interface {p2, p0, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzd(ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;)V

    return-void
.end method

.method static zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;
    .locals 2

    .line 1
    check-cast p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    invoke-static {}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;->zzc()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;->zzf()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    move-result-object v0

    .line 2
    iput-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    :cond_0
    return-object v0
.end method

.method static zzl(Ljava/lang/Class;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfj;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfs;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzez;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfh;)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;
    .locals 32

    .line 1
    move-object/from16 v0, p1

    instance-of v1, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfw;

    if-eqz v1, :cond_37

    check-cast v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfw;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfw;->zzd()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 3
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const v5, 0xd800

    if-lt v4, v5, :cond_0

    const/4 v4, 0x1

    :goto_0
    add-int/lit8 v7, v4, 0x1

    .line 4
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_1

    move v4, v7

    goto :goto_0

    .line 73
    :cond_0
    const/4 v7, 0x1

    .line 4
    :cond_1
    add-int/lit8 v4, v7, 0x1

    .line 5
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v5, :cond_3

    and-int/lit16 v7, v7, 0x1fff

    const/16 v9, 0xd

    :goto_1
    add-int/lit8 v10, v4, 0x1

    .line 6
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_2

    and-int/lit16 v4, v4, 0x1fff

    shl-int/2addr v4, v9

    or-int/2addr v7, v4

    add-int/lit8 v9, v9, 0xd

    move v4, v10

    goto :goto_1

    :cond_2
    shl-int/2addr v4, v9

    or-int/2addr v7, v4

    move v4, v10

    goto :goto_2

    .line 23
    :cond_3
    nop

    .line 6
    :goto_2
    if-nez v7, :cond_4

    sget-object v7, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zza:[I

    move v9, v3

    move v10, v9

    move v11, v10

    move v12, v11

    move v13, v12

    move/from16 v17, v13

    move-object/from16 v16, v7

    move/from16 v7, v17

    goto/16 :goto_13

    .line 71
    :cond_4
    add-int/lit8 v7, v4, 0x1

    .line 7
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_6

    and-int/lit16 v4, v4, 0x1fff

    const/16 v9, 0xd

    :goto_3
    add-int/lit8 v10, v7, 0x1

    .line 8
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v5, :cond_5

    and-int/lit16 v7, v7, 0x1fff

    shl-int/2addr v7, v9

    or-int/2addr v4, v7

    add-int/lit8 v9, v9, 0xd

    move v7, v10

    goto :goto_3

    :cond_5
    shl-int/2addr v7, v9

    or-int/2addr v4, v7

    move v7, v10

    goto :goto_4

    .line 23
    :cond_6
    nop

    .line 8
    :goto_4
    add-int/lit8 v9, v7, 0x1

    .line 9
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v5, :cond_8

    and-int/lit16 v7, v7, 0x1fff

    const/16 v10, 0xd

    :goto_5
    add-int/lit8 v11, v9, 0x1

    .line 10
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v5, :cond_7

    and-int/lit16 v9, v9, 0x1fff

    shl-int/2addr v9, v10

    or-int/2addr v7, v9

    add-int/lit8 v10, v10, 0xd

    move v9, v11

    goto :goto_5

    :cond_7
    shl-int/2addr v9, v10

    or-int/2addr v7, v9

    move v9, v11

    goto :goto_6

    .line 23
    :cond_8
    nop

    .line 10
    :goto_6
    add-int/lit8 v10, v9, 0x1

    .line 11
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v5, :cond_a

    and-int/lit16 v9, v9, 0x1fff

    const/16 v11, 0xd

    :goto_7
    add-int/lit8 v12, v10, 0x1

    .line 12
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-lt v10, v5, :cond_9

    and-int/lit16 v10, v10, 0x1fff

    shl-int/2addr v10, v11

    or-int/2addr v9, v10

    add-int/lit8 v11, v11, 0xd

    move v10, v12

    goto :goto_7

    :cond_9
    shl-int/2addr v10, v11

    or-int/2addr v9, v10

    move v10, v12

    goto :goto_8

    .line 23
    :cond_a
    nop

    .line 12
    :goto_8
    add-int/lit8 v11, v10, 0x1

    .line 13
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-lt v10, v5, :cond_c

    and-int/lit16 v10, v10, 0x1fff

    const/16 v12, 0xd

    :goto_9
    add-int/lit8 v13, v11, 0x1

    .line 14
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-lt v11, v5, :cond_b

    and-int/lit16 v11, v11, 0x1fff

    shl-int/2addr v11, v12

    or-int/2addr v10, v11

    add-int/lit8 v12, v12, 0xd

    move v11, v13

    goto :goto_9

    :cond_b
    shl-int/2addr v11, v12

    or-int/2addr v10, v11

    move v11, v13

    goto :goto_a

    .line 23
    :cond_c
    nop

    .line 14
    :goto_a
    add-int/lit8 v12, v11, 0x1

    .line 15
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-lt v11, v5, :cond_e

    and-int/lit16 v11, v11, 0x1fff

    const/16 v13, 0xd

    :goto_b
    add-int/lit8 v14, v12, 0x1

    .line 16
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v5, :cond_d

    and-int/lit16 v12, v12, 0x1fff

    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    add-int/lit8 v13, v13, 0xd

    move v12, v14

    goto :goto_b

    :cond_d
    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    move v12, v14

    goto :goto_c

    .line 23
    :cond_e
    nop

    .line 16
    :goto_c
    add-int/lit8 v13, v12, 0x1

    .line 17
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v5, :cond_10

    and-int/lit16 v12, v12, 0x1fff

    const/16 v14, 0xd

    :goto_d
    add-int/lit8 v15, v13, 0x1

    .line 18
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v5, :cond_f

    and-int/lit16 v13, v13, 0x1fff

    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    add-int/lit8 v14, v14, 0xd

    move v13, v15

    goto :goto_d

    :cond_f
    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    move v13, v15

    goto :goto_e

    .line 23
    :cond_10
    nop

    .line 18
    :goto_e
    add-int/lit8 v14, v13, 0x1

    .line 19
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v5, :cond_12

    and-int/lit16 v13, v13, 0x1fff

    const/16 v15, 0xd

    :goto_f
    add-int/lit8 v16, v14, 0x1

    .line 20
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v5, :cond_11

    and-int/lit16 v14, v14, 0x1fff

    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    add-int/lit8 v15, v15, 0xd

    move/from16 v14, v16

    goto :goto_f

    :cond_11
    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    move/from16 v14, v16

    goto :goto_10

    .line 23
    :cond_12
    nop

    .line 20
    :goto_10
    add-int/lit8 v15, v14, 0x1

    .line 21
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v5, :cond_14

    and-int/lit16 v14, v14, 0x1fff

    const/16 v16, 0xd

    :goto_11
    add-int/lit8 v17, v15, 0x1

    .line 22
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-lt v15, v5, :cond_13

    and-int/lit16 v15, v15, 0x1fff

    shl-int v15, v15, v16

    or-int/2addr v14, v15

    add-int/lit8 v16, v16, 0xd

    move/from16 v15, v17

    goto :goto_11

    :cond_13
    shl-int v15, v15, v16

    or-int/2addr v14, v15

    move/from16 v15, v17

    goto :goto_12

    .line 23
    :cond_14
    nop

    .line 22
    :goto_12
    add-int v16, v14, v12

    add-int v13, v16, v13

    add-int v16, v4, v4

    add-int v16, v16, v7

    .line 23
    new-array v7, v13, [I

    move v13, v12

    move v12, v9

    move v9, v13

    move v13, v10

    move/from16 v17, v14

    move/from16 v10, v16

    move-object/from16 v16, v7

    move v7, v4

    move v4, v15

    .line 6
    :goto_13
    sget-object v14, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 24
    invoke-virtual {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfw;->zze()[Ljava/lang/Object;

    move-result-object v15

    .line 25
    invoke-virtual {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfw;->zza()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    add-int v18, v17, v9

    add-int v9, v11, v11

    mul-int/lit8 v11, v11, 0x3

    .line 26
    new-array v11, v11, [I

    .line 27
    new-array v9, v9, [Ljava/lang/Object;

    move/from16 v21, v17

    move/from16 v22, v18

    const/16 v19, 0x0

    const/16 v20, 0x0

    :goto_14
    if-ge v4, v2, :cond_36

    add-int/lit8 v23, v4, 0x1

    .line 28
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_16

    and-int/lit16 v4, v4, 0x1fff

    move/from16 v8, v23

    const/16 v23, 0xd

    :goto_15
    add-int/lit8 v24, v8, 0x1

    .line 29
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v5, :cond_15

    and-int/lit16 v8, v8, 0x1fff

    shl-int v8, v8, v23

    or-int/2addr v4, v8

    add-int/lit8 v23, v23, 0xd

    move/from16 v8, v24

    goto :goto_15

    :cond_15
    shl-int v8, v8, v23

    or-int/2addr v4, v8

    move/from16 v8, v24

    goto :goto_16

    .line 57
    :cond_16
    move/from16 v8, v23

    .line 29
    :goto_16
    add-int/lit8 v23, v8, 0x1

    .line 30
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v5, :cond_18

    and-int/lit16 v8, v8, 0x1fff

    move/from16 v6, v23

    const/16 v23, 0xd

    :goto_17
    add-int/lit8 v25, v6, 0x1

    .line 31
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v5, :cond_17

    and-int/lit16 v6, v6, 0x1fff

    shl-int v6, v6, v23

    or-int/2addr v8, v6

    add-int/lit8 v23, v23, 0xd

    move/from16 v6, v25

    goto :goto_17

    :cond_17
    shl-int v6, v6, v23

    or-int/2addr v8, v6

    move/from16 v6, v25

    goto :goto_18

    .line 57
    :cond_18
    move/from16 v6, v23

    .line 31
    :goto_18
    and-int/lit16 v5, v8, 0x400

    if-eqz v5, :cond_19

    add-int/lit8 v5, v19, 0x1

    .line 32
    aput v20, v16, v19

    move/from16 v19, v5

    :cond_19
    and-int/lit16 v5, v8, 0xff

    move-object/from16 v25, v0

    and-int/lit16 v0, v8, 0x800

    move/from16 v26, v0

    const/16 v0, 0x33

    if-lt v5, v0, :cond_23

    add-int/lit8 v0, v6, 0x1

    .line 33
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    move/from16 v27, v0

    const v0, 0xd800

    if-lt v6, v0, :cond_1b

    and-int/lit16 v6, v6, 0x1fff

    move/from16 v30, v27

    move/from16 v27, v6

    move/from16 v6, v30

    const/16 v30, 0xd

    :goto_19
    add-int/lit8 v31, v6, 0x1

    .line 34
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v0, :cond_1a

    and-int/lit16 v0, v6, 0x1fff

    shl-int v0, v0, v30

    or-int v27, v27, v0

    add-int/lit8 v30, v30, 0xd

    move/from16 v6, v31

    const v0, 0xd800

    goto :goto_19

    :cond_1a
    shl-int v0, v6, v30

    or-int v6, v27, v0

    move/from16 v0, v31

    goto :goto_1a

    .line 37
    :cond_1b
    move/from16 v0, v27

    .line 34
    :goto_1a
    move/from16 v27, v0

    add-int/lit8 v0, v5, -0x33

    move/from16 v30, v2

    const/16 v2, 0x9

    if-eq v0, v2, :cond_20

    const/16 v2, 0x11

    if-ne v0, v2, :cond_1c

    goto :goto_1d

    .line 42
    :cond_1c
    const/16 v2, 0xc

    if-ne v0, v2, :cond_1f

    .line 36
    invoke-virtual/range {v25 .. v25}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfw;->zzc()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1e

    if-eqz v26, :cond_1d

    goto :goto_1b

    .line 37
    :cond_1d
    const/4 v0, 0x0

    goto :goto_1e

    .line 36
    :cond_1e
    :goto_1b
    add-int/lit8 v0, v10, 0x1

    div-int/lit8 v2, v20, 0x3

    add-int/2addr v2, v2

    const/16 v24, 0x1

    add-int/lit8 v2, v2, 0x1

    .line 37
    aget-object v10, v15, v10

    aput-object v10, v9, v2

    move v10, v0

    goto :goto_1c

    :cond_1f
    nop

    :goto_1c
    move/from16 v0, v26

    goto :goto_1e

    .line 34
    :cond_20
    :goto_1d
    add-int/lit8 v0, v10, 0x1

    div-int/lit8 v2, v20, 0x3

    add-int/2addr v2, v2

    const/16 v24, 0x1

    add-int/lit8 v2, v2, 0x1

    .line 35
    aget-object v10, v15, v10

    aput-object v10, v9, v2

    move v10, v0

    move/from16 v0, v26

    :goto_1e
    add-int/2addr v6, v6

    .line 38
    aget-object v2, v15, v6

    .line 39
    move/from16 v26, v0

    instance-of v0, v2, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_21

    .line 40
    check-cast v2, Ljava/lang/reflect/Field;

    goto :goto_1f

    .line 41
    :cond_21
    check-cast v2, Ljava/lang/String;

    invoke-static {v3, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzz(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 42
    aput-object v2, v15, v6

    .line 43
    :goto_1f
    move/from16 v28, v6

    move v0, v7

    invoke-virtual {v14, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v6

    long-to-int v2, v6

    add-int/lit8 v6, v28, 0x1

    .line 44
    aget-object v7, v15, v6

    .line 45
    move/from16 v31, v0

    instance-of v0, v7, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_22

    .line 46
    check-cast v7, Ljava/lang/reflect/Field;

    goto :goto_20

    .line 47
    :cond_22
    check-cast v7, Ljava/lang/String;

    invoke-static {v3, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzz(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 48
    aput-object v7, v15, v6

    .line 49
    :goto_20
    invoke-virtual {v14, v7}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v6

    long-to-int v0, v6

    move-object/from16 v23, v1

    move-object v7, v9

    move/from16 v9, v27

    const/4 v6, 0x0

    const/16 v24, 0x1

    const v28, 0xd800

    move v1, v0

    move/from16 v0, v26

    goto/16 :goto_2d

    .line 37
    :cond_23
    move/from16 v30, v2

    move/from16 v31, v7

    add-int/lit8 v0, v10, 0x1

    .line 50
    aget-object v2, v15, v10

    check-cast v2, Ljava/lang/String;

    invoke-static {v3, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzz(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/16 v7, 0x31

    const/16 v10, 0x9

    if-eq v5, v10, :cond_2d

    const/16 v10, 0x11

    if-ne v5, v10, :cond_24

    const/16 v24, 0x1

    goto/16 :goto_26

    .line 65
    :cond_24
    const/16 v10, 0x1b

    if-eq v5, v10, :cond_2c

    if-ne v5, v7, :cond_25

    add-int/lit8 v10, v0, 0x1

    goto :goto_25

    .line 52
    :cond_25
    const/16 v10, 0xc

    if-eq v5, v10, :cond_29

    const/16 v10, 0x1e

    if-eq v5, v10, :cond_29

    const/16 v10, 0x2c

    if-ne v5, v10, :cond_26

    goto :goto_22

    .line 54
    :cond_26
    const/16 v10, 0x32

    if-ne v5, v10, :cond_28

    add-int/lit8 v10, v0, 0x1

    add-int/lit8 v27, v21, 0x1

    .line 55
    aput v20, v16, v21

    div-int/lit8 v21, v20, 0x3

    .line 56
    aget-object v0, v15, v0

    add-int v21, v21, v21

    aput-object v0, v9, v21

    if-eqz v26, :cond_27

    add-int/lit8 v21, v21, 0x1

    add-int/lit8 v0, v10, 0x1

    .line 57
    aget-object v10, v15, v10

    aput-object v10, v9, v21

    move v10, v0

    move/from16 v0, v26

    move/from16 v21, v27

    goto :goto_21

    :cond_27
    move/from16 v21, v27

    const/4 v0, 0x0

    :goto_21
    const/16 v24, 0x1

    goto :goto_28

    :cond_28
    const/16 v24, 0x1

    goto :goto_27

    .line 53
    :cond_29
    :goto_22
    invoke-virtual/range {v25 .. v25}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfw;->zzc()I

    move-result v10

    const/4 v7, 0x1

    if-eq v10, v7, :cond_2b

    if-eqz v26, :cond_2a

    goto :goto_23

    .line 54
    :cond_2a
    move v10, v0

    const/4 v0, 0x0

    goto :goto_24

    .line 53
    :cond_2b
    :goto_23
    add-int/lit8 v7, v0, 0x1

    div-int/lit8 v10, v20, 0x3

    add-int/2addr v10, v10

    const/16 v24, 0x1

    add-int/lit8 v10, v10, 0x1

    .line 54
    aget-object v0, v15, v0

    aput-object v0, v9, v10

    move v10, v7

    move/from16 v0, v26

    :goto_24
    const/16 v24, 0x1

    goto :goto_28

    .line 57
    :cond_2c
    add-int/lit8 v10, v0, 0x1

    .line 65
    :goto_25
    div-int/lit8 v7, v20, 0x3

    add-int/2addr v7, v7

    const/16 v24, 0x1

    add-int/lit8 v7, v7, 0x1

    .line 52
    aget-object v0, v15, v0

    aput-object v0, v9, v7

    move/from16 v0, v26

    goto :goto_28

    .line 50
    :cond_2d
    const/16 v24, 0x1

    :goto_26
    div-int/lit8 v7, v20, 0x3

    add-int/2addr v7, v7

    add-int/lit8 v7, v7, 0x1

    .line 51
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v10

    aput-object v10, v9, v7

    .line 58
    :goto_27
    move v10, v0

    move/from16 v0, v26

    :goto_28
    move-object v7, v9

    move/from16 v26, v10

    invoke-virtual {v14, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v9

    long-to-int v2, v9

    and-int/lit16 v9, v8, 0x1000

    const v10, 0xfffff

    if-eqz v9, :cond_31

    const/16 v9, 0x11

    if-gt v5, v9, :cond_31

    add-int/lit8 v9, v6, 0x1

    .line 59
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const v10, 0xd800

    if-lt v6, v10, :cond_2f

    and-int/lit16 v6, v6, 0x1fff

    const/16 v23, 0xd

    :goto_29
    add-int/lit8 v28, v9, 0x1

    .line 60
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v10, :cond_2e

    and-int/lit16 v9, v9, 0x1fff

    shl-int v9, v9, v23

    or-int/2addr v6, v9

    add-int/lit8 v23, v23, 0xd

    move/from16 v9, v28

    goto :goto_29

    :cond_2e
    shl-int v9, v9, v23

    or-int/2addr v6, v9

    move/from16 v9, v28

    goto :goto_2a

    .line 65
    :cond_2f
    nop

    .line 60
    :goto_2a
    add-int v23, v31, v31

    div-int/lit8 v28, v6, 0x20

    add-int v23, v23, v28

    .line 61
    aget-object v10, v15, v23

    .line 62
    move/from16 v29, v0

    instance-of v0, v10, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_30

    .line 63
    check-cast v10, Ljava/lang/reflect/Field;

    goto :goto_2b

    .line 64
    :cond_30
    check-cast v10, Ljava/lang/String;

    invoke-static {v3, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzz(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 65
    aput-object v10, v15, v23

    .line 66
    :goto_2b
    move-object/from16 v23, v1

    invoke-virtual {v14, v10}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v0

    long-to-int v0, v0

    rem-int/lit8 v6, v6, 0x20

    const v28, 0xd800

    goto :goto_2c

    .line 65
    :cond_31
    move/from16 v29, v0

    move-object/from16 v23, v1

    const v28, 0xd800

    move v9, v6

    move v0, v10

    const/4 v6, 0x0

    .line 66
    :goto_2c
    const/16 v1, 0x12

    if-lt v5, v1, :cond_32

    const/16 v1, 0x31

    if-gt v5, v1, :cond_32

    add-int/lit8 v1, v22, 0x1

    .line 67
    aput v2, v16, v22

    move/from16 v22, v1

    move/from16 v10, v26

    move v1, v0

    move/from16 v0, v29

    goto :goto_2d

    :cond_32
    nop

    .line 49
    move v1, v0

    move/from16 v10, v26

    move/from16 v0, v29

    :goto_2d
    add-int/lit8 v26, v20, 0x1

    .line 68
    aput v4, v11, v20

    add-int/lit8 v4, v26, 0x1

    move/from16 v20, v0

    and-int/lit16 v0, v8, 0x200

    if-eqz v0, :cond_33

    const/high16 v0, 0x20000000

    goto :goto_2e

    .line 70
    :cond_33
    const/4 v0, 0x0

    .line 68
    :goto_2e
    and-int/lit16 v8, v8, 0x100

    if-eqz v8, :cond_34

    const/high16 v8, 0x10000000

    goto :goto_2f

    .line 70
    :cond_34
    const/4 v8, 0x0

    .line 68
    :goto_2f
    if-eqz v20, :cond_35

    const/high16 v20, -0x80000000

    goto :goto_30

    .line 70
    :cond_35
    const/16 v20, 0x0

    .line 68
    :goto_30
    shl-int/lit8 v5, v5, 0x14

    or-int/2addr v0, v8

    or-int v0, v0, v20

    or-int/2addr v0, v5

    or-int/2addr v0, v2

    .line 69
    aput v0, v11, v26

    add-int/lit8 v20, v4, 0x1

    shl-int/lit8 v0, v6, 0x14

    or-int/2addr v0, v1

    .line 70
    aput v0, v11, v4

    move v4, v9

    move-object/from16 v1, v23

    move-object/from16 v0, v25

    move/from16 v5, v28

    move/from16 v2, v30

    move-object v9, v7

    move/from16 v7, v31

    goto/16 :goto_14

    .line 57
    :cond_36
    move-object/from16 v25, v0

    move-object v7, v9

    new-instance v9, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;

    .line 71
    invoke-virtual/range {v25 .. v25}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfw;->zza()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    move-result-object v14

    const/4 v15, 0x0

    move-object/from16 v19, p2

    move-object/from16 v20, p3

    move-object/from16 v21, p4

    move-object/from16 v22, p5

    move-object/from16 v23, p6

    move-object v10, v11

    move-object v11, v7

    invoke-direct/range {v9 .. v23}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;-><init>([I[Ljava/lang/Object;IILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;Z[IIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfs;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzez;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfh;)V

    return-object v9

    .line 72
    :cond_37
    check-cast v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgp;

    .line 73
    const/4 v0, 0x0

    throw v0
.end method

.method private static zzm(Ljava/lang/Object;J)D
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    return-wide p0
.end method

.method private static zzn(Ljava/lang/Object;J)F
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0
.end method

.method private static zzo(Ljava/lang/Object;J)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method private final zzp(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    add-int/lit8 p1, p1, 0x2

    aget p1, v0, p1

    return p1
.end method

.method private final zzq(II)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    const/4 v1, -0x1

    add-int/2addr v0, v1

    :goto_0
    if-gt p2, v0, :cond_2

    add-int v2, v0, p2

    ushr-int/lit8 v2, v2, 0x1

    mul-int/lit8 v3, v2, 0x3

    iget-object v4, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    aget v4, v4, v3

    if-ne p1, v4, :cond_0

    return v3

    :cond_0
    if-ge p1, v4, :cond_1

    add-int/lit8 v0, v2, -0x1

    goto :goto_0

    :cond_1
    add-int/lit8 p2, v2, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method private static zzr(I)I
    .locals 0

    ushr-int/lit8 p0, p0, 0x14

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method private final zzs(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    add-int/lit8 p1, p1, 0x1

    aget p1, v0, p1

    return p1
.end method

.method private static zzt(Ljava/lang/Object;J)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method private final zzu(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;
    .locals 1

    .line 1
    div-int/lit8 p1, p1, 0x3

    add-int/2addr p1, p1

    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd:[Ljava/lang/Object;

    add-int/lit8 p1, p1, 0x1

    aget-object p1, v0, p1

    check-cast p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;

    return-object p1
.end method

.method private final zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd:[Ljava/lang/Object;

    div-int/lit8 p1, p1, 0x3

    add-int/2addr p1, p1

    aget-object v1, v0, p1

    check-cast v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    if-eqz v1, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v1, p1, 0x1

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfu;->zza()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfu;

    move-result-object v2

    aget-object v0, v0, v1

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfu;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd:[Ljava/lang/Object;

    .line 3
    aput-object v0, v1, p1

    return-object v0
.end method

.method private final zzw(I)Ljava/lang/Object;
    .locals 1

    .line 1
    div-int/lit8 p1, p1, 0x3

    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd:[Ljava/lang/Object;

    add-int/2addr p1, p1

    aget-object p1, v0, p1

    return-object p1
.end method

.method private final zzx(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v0

    .line 2
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v1

    const v2, 0xfffff

    and-int/2addr v1, v2

    .line 3
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result p2

    if-nez p2, :cond_0

    .line 4
    invoke-interface {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zze()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    int-to-long v1, v1

    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 5
    invoke-virtual {p2, p1, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzL(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    return-object p1

    .line 7
    :cond_1
    invoke-interface {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zze()Ljava/lang/Object;

    move-result-object p2

    if-eqz p1, :cond_2

    .line 8
    invoke-interface {v0, p2, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    return-object p2
.end method

.method private final zzy(Ljava/lang/Object;II)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result p2

    if-nez p2, :cond_0

    .line 3
    invoke-interface {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zze()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    sget-object p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 4
    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result p3

    const v1, 0xfffff

    and-int/2addr p3, v1

    int-to-long v1, p3

    invoke-virtual {p2, p1, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzL(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    return-object p1

    .line 6
    :cond_1
    invoke-interface {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zze()Ljava/lang/Object;

    move-result-object p2

    if-eqz p1, :cond_2

    .line 7
    invoke-interface {v0, p2, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    return-object p2
.end method

.method private static zzz(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 2
    :catch_0
    move-exception v0

    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    .line 6
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 4
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    .line 6
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Field "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " for "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " not found. Known fields are "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)I
    .locals 17

    .line 1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-object v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    const/4 v7, 0x0

    const v8, 0xfffff

    move v2, v7

    move v4, v2

    move v9, v4

    move v3, v8

    :goto_0
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    array-length v5, v5

    if-ge v2, v5, :cond_2b

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v5

    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result v10

    iget-object v11, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    add-int/lit8 v12, v2, 0x2

    .line 2
    aget v13, v11, v2

    .line 3
    aget v11, v11, v12

    and-int v12, v11, v8

    const/16 v14, 0x11

    const/4 v15, 0x1

    if-gt v10, v14, :cond_2

    if-eq v12, v3, :cond_1

    if-ne v12, v8, :cond_0

    move v3, v7

    goto :goto_1

    .line 280
    :cond_0
    int-to-long v3, v12

    .line 4
    invoke-virtual {v6, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    .line 3
    :goto_1
    move v4, v3

    move v3, v12

    :cond_1
    ushr-int/lit8 v11, v11, 0x14

    shl-int v11, v15, v11

    goto :goto_2

    .line 4
    :cond_2
    move v11, v7

    .line 3
    :goto_2
    and-int/2addr v5, v8

    .line 5
    sget-object v12, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdy;->zzJ:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdy;

    .line 6
    invoke-virtual {v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdy;->zza()I

    move-result v12

    if-lt v10, v12, :cond_3

    sget-object v12, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdy;->zzW:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdy;

    .line 5
    invoke-virtual {v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdy;->zza()I

    :cond_3
    move v14, v9

    int-to-long v8, v5

    const/16 v16, 0x3f

    packed-switch v10, :pswitch_data_0

    goto/16 :goto_17

    .line 7
    :pswitch_0
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 8
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    .line 9
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v8

    .line 10
    invoke-static {v13, v5, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzw(ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 11
    :pswitch_1
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 12
    invoke-static {v1, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v8

    add-long v10, v8, v8

    shr-long v8, v8, v16

    .line 13
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    xor-long/2addr v8, v10

    .line 14
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v8

    add-int/2addr v5, v8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 15
    :pswitch_2
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 16
    invoke-static {v1, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v8

    add-int v9, v8, v8

    shr-int/lit8 v8, v8, 0x1f

    .line 17
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    xor-int/2addr v8, v9

    .line 18
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    add-int/2addr v5, v8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 19
    :pswitch_3
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 20
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 21
    :pswitch_4
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 22
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x4

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 23
    :pswitch_5
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 24
    invoke-static {v1, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v8

    int-to-long v8, v8

    .line 25
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    .line 26
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v8

    add-int/2addr v5, v8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 27
    :pswitch_6
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 28
    invoke-static {v1, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v8

    .line 29
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    .line 30
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    add-int/2addr v5, v8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 31
    :pswitch_7
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 32
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    .line 33
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    .line 34
    invoke-virtual {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzd()I

    move-result v8

    .line 35
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v9, v8

    add-int/2addr v5, v9

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 36
    :pswitch_8
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 37
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 38
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v8

    invoke-static {v13, v5, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzh(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 39
    :pswitch_9
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 40
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v8

    instance-of v9, v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    if-eqz v9, :cond_4

    .line 41
    check-cast v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    .line 42
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    .line 43
    invoke-virtual {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzd()I

    move-result v8

    .line 44
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v9, v8

    add-int/2addr v5, v9

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 45
    :cond_4
    check-cast v8, Ljava/lang/String;

    .line 46
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    .line 47
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzz(Ljava/lang/String;)I

    move-result v8

    add-int/2addr v5, v8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 48
    :pswitch_a
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 49
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/2addr v5, v15

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 50
    :pswitch_b
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 51
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x4

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 52
    :pswitch_c
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 53
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 54
    :pswitch_d
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 55
    invoke-static {v1, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v8

    int-to-long v8, v8

    .line 56
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    .line 57
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v8

    add-int/2addr v5, v8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 58
    :pswitch_e
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 59
    invoke-static {v1, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 60
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    .line 61
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v8

    add-int/2addr v5, v8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 62
    :pswitch_f
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 63
    invoke-static {v1, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 64
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    .line 65
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v8

    add-int/2addr v5, v8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 66
    :pswitch_10
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 67
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x4

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 68
    :pswitch_11
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v5, v13, 0x3

    .line 69
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x8

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 70
    :pswitch_12
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzw(I)Ljava/lang/Object;

    move-result-object v8

    .line 71
    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;

    .line 72
    check-cast v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzff;

    .line 73
    invoke-virtual {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_2a

    .line 74
    invoke-virtual {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_5

    goto/16 :goto_17

    :cond_5
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 291
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 292
    const/4 v1, 0x0

    throw v1

    .line 75
    :pswitch_13
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 76
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v8

    .line 77
    sget v9, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 78
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_6

    move v11, v7

    goto :goto_4

    :cond_6
    move v10, v7

    move v11, v10

    :goto_3
    if-ge v10, v9, :cond_7

    .line 79
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    invoke-static {v13, v15, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzw(ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)I

    move-result v15

    add-int/2addr v11, v15

    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 78
    :cond_7
    :goto_4
    add-int v9, v14, v11

    goto/16 :goto_18

    .line 80
    :pswitch_14
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 81
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzj(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 82
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 83
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 84
    :pswitch_15
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 85
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzi(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 86
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 87
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 88
    :pswitch_16
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 89
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zze(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 90
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 91
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 92
    :pswitch_17
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 93
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzc(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 94
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 95
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 96
    :pswitch_18
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 97
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 98
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 99
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 100
    :pswitch_19
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 101
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzk(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 102
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 103
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 104
    :pswitch_1a
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 105
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 106
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 107
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 108
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 109
    :pswitch_1b
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 110
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzc(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 111
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 112
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 113
    :pswitch_1c
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 114
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zze(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 115
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 116
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 117
    :pswitch_1d
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 118
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzf(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 119
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 120
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 121
    :pswitch_1e
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 122
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzl(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 123
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 124
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 125
    :pswitch_1f
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 126
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzg(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 127
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 128
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 129
    :pswitch_20
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 130
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzc(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 131
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 132
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 133
    :pswitch_21
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 134
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zze(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_2a

    shl-int/lit8 v8, v13, 0x3

    .line 135
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    .line 136
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v14, v8

    goto/16 :goto_18

    .line 137
    :pswitch_22
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 138
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 139
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_8

    move v5, v7

    goto :goto_5

    :cond_8
    shl-int/lit8 v9, v13, 0x3

    .line 140
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzj(Ljava/util/List;)I

    move-result v5

    .line 141
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    mul-int/2addr v8, v9

    add-int/2addr v5, v8

    .line 139
    :goto_5
    add-int v9, v14, v5

    goto/16 :goto_18

    .line 142
    :pswitch_23
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 143
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 144
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_9

    move v5, v7

    goto :goto_6

    :cond_9
    shl-int/lit8 v9, v13, 0x3

    .line 145
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzi(Ljava/util/List;)I

    move-result v5

    .line 146
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    mul-int/2addr v8, v9

    add-int/2addr v5, v8

    .line 144
    :goto_6
    add-int v9, v14, v5

    goto/16 :goto_18

    .line 147
    :pswitch_24
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 148
    invoke-static {v13, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzd(ILjava/util/List;Z)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 149
    :pswitch_25
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 150
    invoke-static {v13, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzb(ILjava/util/List;Z)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 151
    :pswitch_26
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 152
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 153
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_a

    move v5, v7

    goto :goto_7

    :cond_a
    shl-int/lit8 v9, v13, 0x3

    .line 154
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza(Ljava/util/List;)I

    move-result v5

    .line 155
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    mul-int/2addr v8, v9

    add-int/2addr v5, v8

    .line 153
    :goto_7
    add-int v9, v14, v5

    goto/16 :goto_18

    .line 156
    :pswitch_27
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 157
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 158
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_b

    move v5, v7

    goto :goto_8

    :cond_b
    shl-int/lit8 v9, v13, 0x3

    .line 159
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzk(Ljava/util/List;)I

    move-result v5

    .line 160
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    mul-int/2addr v8, v9

    add-int/2addr v5, v8

    .line 158
    :goto_8
    add-int v9, v14, v5

    goto/16 :goto_18

    .line 161
    :pswitch_28
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 162
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 163
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_c

    move v8, v7

    goto :goto_a

    :cond_c
    shl-int/lit8 v9, v13, 0x3

    .line 164
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    mul-int/2addr v8, v9

    move v9, v7

    .line 165
    :goto_9
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_d

    .line 166
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    .line 167
    invoke-virtual {v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzd()I

    move-result v10

    .line 168
    invoke-static {v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v11

    add-int/2addr v11, v10

    add-int/2addr v8, v11

    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 163
    :cond_d
    :goto_a
    add-int v9, v14, v8

    goto/16 :goto_18

    .line 169
    :pswitch_29
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v8

    .line 170
    sget v9, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 171
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_e

    move v10, v7

    goto :goto_d

    :cond_e
    shl-int/lit8 v10, v13, 0x3

    .line 172
    invoke-static {v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v10

    mul-int/2addr v10, v9

    move v11, v7

    :goto_b
    if-ge v11, v9, :cond_10

    .line 173
    invoke-interface {v5, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    instance-of v15, v13, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzex;

    if-eqz v15, :cond_f

    .line 174
    check-cast v13, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzex;

    .line 175
    invoke-virtual {v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzex;->zza()I

    move-result v13

    .line 176
    invoke-static {v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v15

    add-int/2addr v15, v13

    add-int/2addr v10, v15

    goto :goto_c

    .line 177
    :cond_f
    check-cast v13, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    invoke-static {v13, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzy(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)I

    move-result v13

    add-int/2addr v10, v13

    .line 176
    :goto_c
    add-int/lit8 v11, v11, 0x1

    goto :goto_b

    .line 171
    :cond_10
    :goto_d
    add-int v9, v14, v10

    goto/16 :goto_18

    .line 178
    :pswitch_2a
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 179
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_11

    move v9, v7

    goto :goto_12

    :cond_11
    shl-int/lit8 v9, v13, 0x3

    .line 180
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    mul-int/2addr v9, v8

    instance-of v10, v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzey;

    if-eqz v10, :cond_13

    .line 186
    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzey;

    move v10, v7

    :goto_e
    if-ge v10, v8, :cond_15

    .line 187
    invoke-interface {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzey;->zza()Ljava/lang/Object;

    move-result-object v11

    instance-of v13, v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    if-eqz v13, :cond_12

    .line 188
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    .line 189
    invoke-virtual {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzd()I

    move-result v11

    .line 190
    invoke-static {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v13

    add-int/2addr v13, v11

    add-int/2addr v9, v13

    goto :goto_f

    .line 191
    :cond_12
    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzz(Ljava/lang/String;)I

    move-result v11

    add-int/2addr v9, v11

    .line 190
    :goto_f
    add-int/lit8 v10, v10, 0x1

    goto :goto_e

    .line 191
    :cond_13
    move v10, v7

    :goto_10
    if-ge v10, v8, :cond_15

    .line 181
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    instance-of v13, v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    if-eqz v13, :cond_14

    .line 182
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    .line 183
    invoke-virtual {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzd()I

    move-result v11

    .line 184
    invoke-static {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v13

    add-int/2addr v13, v11

    add-int/2addr v9, v13

    goto :goto_11

    .line 185
    :cond_14
    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzz(Ljava/lang/String;)I

    move-result v11

    add-int/2addr v9, v11

    .line 184
    :goto_11
    add-int/lit8 v10, v10, 0x1

    goto :goto_10

    .line 179
    :cond_15
    :goto_12
    add-int/2addr v9, v14

    goto/16 :goto_18

    .line 192
    :pswitch_2b
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 193
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 194
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_16

    move v5, v7

    goto :goto_13

    :cond_16
    shl-int/lit8 v8, v13, 0x3

    .line 195
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    add-int/2addr v8, v15

    mul-int/2addr v5, v8

    .line 194
    :goto_13
    add-int v9, v14, v5

    goto/16 :goto_18

    .line 196
    :pswitch_2c
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 197
    invoke-static {v13, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzb(ILjava/util/List;Z)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 198
    :pswitch_2d
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 199
    invoke-static {v13, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzd(ILjava/util/List;Z)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 200
    :pswitch_2e
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 201
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 202
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_17

    move v5, v7

    goto :goto_14

    :cond_17
    shl-int/lit8 v9, v13, 0x3

    .line 203
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzf(Ljava/util/List;)I

    move-result v5

    .line 204
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    mul-int/2addr v8, v9

    add-int/2addr v5, v8

    .line 202
    :goto_14
    add-int v9, v14, v5

    goto/16 :goto_18

    .line 205
    :pswitch_2f
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 206
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 207
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_18

    move v5, v7

    goto :goto_15

    :cond_18
    shl-int/lit8 v9, v13, 0x3

    .line 208
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzl(Ljava/util/List;)I

    move-result v5

    .line 209
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v9

    mul-int/2addr v8, v9

    add-int/2addr v5, v8

    .line 207
    :goto_15
    add-int v9, v14, v5

    goto/16 :goto_18

    .line 210
    :pswitch_30
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 211
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 212
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_19

    move v9, v7

    goto :goto_16

    :cond_19
    shl-int/lit8 v8, v13, 0x3

    .line 213
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzg(Ljava/util/List;)I

    move-result v9

    .line 214
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    .line 215
    invoke-static {v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    mul-int/2addr v5, v8

    add-int/2addr v9, v5

    .line 212
    :goto_16
    add-int/2addr v9, v14

    goto/16 :goto_18

    .line 216
    :pswitch_31
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 217
    invoke-static {v13, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzb(ILjava/util/List;Z)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 218
    :pswitch_32
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 219
    invoke-static {v13, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzd(ILjava/util/List;Z)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 220
    :pswitch_33
    move v5, v11

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 221
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    .line 222
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v8

    .line 223
    invoke-static {v13, v5, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzw(ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 224
    :pswitch_34
    move v5, v11

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 225
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    add-long v10, v8, v8

    shr-long v8, v8, v16

    .line 226
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    xor-long/2addr v8, v10

    .line 227
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v5

    add-int/2addr v0, v5

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 224
    :cond_1a
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 228
    :pswitch_35
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1b

    shl-int/lit8 v0, v13, 0x3

    .line 229
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    add-int v8, v5, v5

    shr-int/lit8 v5, v5, 0x1f

    .line 230
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    xor-int/2addr v5, v8

    .line 231
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/2addr v0, v5

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 228
    :cond_1b
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 232
    :pswitch_36
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1c

    shl-int/lit8 v0, v13, 0x3

    .line 233
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x8

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 232
    :cond_1c
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 234
    :pswitch_37
    move v5, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v0, v13, 0x3

    .line 235
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 234
    :cond_1d
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 236
    :pswitch_38
    move v5, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1e

    shl-int/lit8 v0, v13, 0x3

    .line 237
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    int-to-long v8, v5

    .line 238
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    .line 239
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v5

    add-int/2addr v0, v5

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 236
    :cond_1e
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 240
    :pswitch_39
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1f

    shl-int/lit8 v0, v13, 0x3

    .line 241
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    .line 242
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    .line 243
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v5

    add-int/2addr v0, v5

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 240
    :cond_1f
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 244
    :pswitch_3a
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_20

    shl-int/lit8 v0, v13, 0x3

    .line 245
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    .line 246
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    .line 247
    invoke-virtual {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzd()I

    move-result v5

    .line 248
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    add-int/2addr v8, v5

    add-int/2addr v0, v8

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 244
    :cond_20
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 249
    :pswitch_3b
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 250
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 251
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v8

    invoke-static {v13, v5, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzh(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)I

    move-result v5

    add-int v9, v14, v5

    goto/16 :goto_18

    .line 252
    :pswitch_3c
    move v5, v11

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_22

    shl-int/lit8 v0, v13, 0x3

    .line 253
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    instance-of v8, v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    if-eqz v8, :cond_21

    .line 254
    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    .line 255
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    .line 256
    invoke-virtual {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzd()I

    move-result v5

    .line 257
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v8

    add-int/2addr v8, v5

    add-int/2addr v0, v8

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 258
    :cond_21
    check-cast v5, Ljava/lang/String;

    .line 259
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    .line 260
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzz(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v0, v5

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 252
    :cond_22
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 261
    :pswitch_3d
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_23

    shl-int/lit8 v0, v13, 0x3

    .line 262
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    add-int/2addr v0, v15

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 261
    :cond_23
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 263
    :pswitch_3e
    move v5, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_24

    shl-int/lit8 v0, v13, 0x3

    .line 264
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 263
    :cond_24
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 265
    :pswitch_3f
    move v5, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_25

    shl-int/lit8 v0, v13, 0x3

    .line 266
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x8

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 265
    :cond_25
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 267
    :pswitch_40
    move v5, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_26

    shl-int/lit8 v0, v13, 0x3

    .line 268
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    int-to-long v8, v5

    .line 269
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    .line 270
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v5

    add-int/2addr v0, v5

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_18

    .line 267
    :cond_26
    move-object/from16 v0, p0

    goto/16 :goto_17

    .line 271
    :pswitch_41
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_27

    shl-int/lit8 v0, v13, 0x3

    .line 272
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 273
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    .line 274
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v5

    add-int/2addr v0, v5

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto :goto_18

    .line 271
    :cond_27
    move-object/from16 v0, p0

    goto :goto_17

    .line 275
    :pswitch_42
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_28

    shl-int/lit8 v0, v13, 0x3

    .line 276
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 277
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    .line 278
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzB(J)I

    move-result v5

    add-int/2addr v0, v5

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto :goto_18

    .line 275
    :cond_28
    move-object/from16 v0, p0

    goto :goto_17

    .line 279
    :pswitch_43
    move v5, v11

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_29

    shl-int/lit8 v0, v13, 0x3

    .line 280
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto :goto_18

    .line 279
    :cond_29
    move-object/from16 v0, p0

    goto :goto_17

    .line 281
    :pswitch_44
    move v5, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2a

    shl-int/lit8 v1, v13, 0x3

    .line 282
    invoke-static {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdn;->zzA(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x8

    add-int v9, v14, v1

    goto :goto_18

    .line 171
    :cond_2a
    :goto_17
    move v9, v14

    :goto_18
    add-int/lit8 v2, v2, 0x3

    move-object/from16 v1, p1

    const v8, 0xfffff

    goto/16 :goto_0

    .line 283
    :cond_2b
    move v14, v9

    move-object/from16 v1, p1

    check-cast v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    iget-object v1, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    .line 284
    move-object v2, v1

    check-cast v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    .line 285
    invoke-virtual {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;->zza()I

    move-result v1

    add-int v9, v14, v1

    iget-boolean v1, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    if-eqz v1, :cond_2e

    .line 286
    move-object/from16 v1, p1

    check-cast v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;

    iget-object v1, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;

    iget-object v2, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;->zzc()I

    move-result v2

    move v3, v7

    :goto_19
    if-ge v7, v2, :cond_2c

    iget-object v4, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;

    .line 287
    invoke-virtual {v4, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;->zzg(I)Ljava/util/Map$Entry;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgi;

    .line 288
    invoke-virtual {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgi;->zza()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdw;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zza(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdw;Ljava/lang/Object;)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v7, v7, 0x1

    goto :goto_19

    :cond_2c
    iget-object v1, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;

    .line 289
    invoke-virtual {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;->zzd()Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 290
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdw;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zza(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdw;Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v3, v2

    goto :goto_1a

    :cond_2d
    add-int/2addr v9, v3

    return v9

    .line 292
    :cond_2e
    return v9

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzb(Ljava/lang/Object;)I
    .locals 8

    .line 1
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    array-length v2, v2

    if-ge v0, v2, :cond_3

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    const v4, 0xfffff

    and-int/2addr v4, v2

    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result v2

    .line 2
    aget v3, v3, v0

    int-to-long v4, v4

    const/16 v6, 0x25

    const/16 v7, 0x20

    packed-switch v2, :pswitch_data_0

    goto/16 :goto_3

    .line 3
    :pswitch_0
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 4
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 5
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 6
    :pswitch_1
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 7
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 8
    :pswitch_2
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 9
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 10
    :pswitch_3
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 11
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 12
    :pswitch_4
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 13
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 14
    :pswitch_5
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 15
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 16
    :pswitch_6
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 17
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 18
    :pswitch_7
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 19
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 20
    :pswitch_8
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 21
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 22
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 23
    :pswitch_9
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 24
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 25
    :pswitch_a
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 26
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzN(Ljava/lang/Object;J)Z

    move-result v2

    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zza(Z)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 27
    :pswitch_b
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 28
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 29
    :pswitch_c
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 30
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 31
    :pswitch_d
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 32
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 33
    :pswitch_e
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 34
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 35
    :pswitch_f
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 36
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 37
    :pswitch_10
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 38
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzn(Ljava/lang/Object;J)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    .line 39
    :pswitch_11
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    mul-int/lit8 v1, v1, 0x35

    .line 40
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzm(Ljava/lang/Object;J)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_12
    mul-int/lit8 v1, v1, 0x35

    .line 41
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_13
    mul-int/lit8 v1, v1, 0x35

    .line 42
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_14
    mul-int/lit8 v1, v1, 0x35

    .line 43
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 44
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v6

    goto :goto_1

    :cond_0
    nop

    :goto_1
    add-int/2addr v1, v6

    goto/16 :goto_3

    :pswitch_15
    mul-int/lit8 v1, v1, 0x35

    .line 45
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_16
    mul-int/lit8 v1, v1, 0x35

    .line 46
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_17
    mul-int/lit8 v1, v1, 0x35

    .line 47
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_18
    mul-int/lit8 v1, v1, 0x35

    .line 48
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_19
    mul-int/lit8 v1, v1, 0x35

    .line 49
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_1a
    mul-int/lit8 v1, v1, 0x35

    .line 50
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_1b
    mul-int/lit8 v1, v1, 0x35

    .line 51
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_3

    :pswitch_1c
    mul-int/lit8 v1, v1, 0x35

    .line 52
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 53
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v6

    goto :goto_2

    :cond_1
    nop

    :goto_2
    add-int/2addr v1, v6

    goto/16 :goto_3

    :pswitch_1d
    mul-int/lit8 v1, v1, 0x35

    .line 54
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_3

    :pswitch_1e
    mul-int/lit8 v1, v1, 0x35

    .line 55
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzw(Ljava/lang/Object;J)Z

    move-result v2

    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zza(Z)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_3

    :pswitch_1f
    mul-int/lit8 v1, v1, 0x35

    .line 56
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_3

    :pswitch_20
    mul-int/lit8 v1, v1, 0x35

    .line 57
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto :goto_3

    :pswitch_21
    mul-int/lit8 v1, v1, 0x35

    .line 58
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_3

    :pswitch_22
    mul-int/lit8 v1, v1, 0x35

    .line 59
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto :goto_3

    :pswitch_23
    mul-int/lit8 v1, v1, 0x35

    .line 60
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    goto :goto_3

    :pswitch_24
    mul-int/lit8 v1, v1, 0x35

    .line 61
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzb(Ljava/lang/Object;J)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_3

    :pswitch_25
    mul-int/lit8 v1, v1, 0x35

    .line 62
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zza(Ljava/lang/Object;J)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 63
    sget-object v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zzb:[B

    ushr-long v4, v2, v7

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v1, v2

    .line 5
    :cond_2
    :goto_3
    add-int/lit8 v0, v0, 0x3

    goto/16 :goto_0

    .line 63
    :cond_3
    mul-int/lit8 v1, v1, 0x35

    .line 64
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    iget-object v0, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    .line 65
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    if-eqz v0, :cond_4

    mul-int/lit8 v1, v1, 0x35

    .line 66
    check-cast p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;

    iget-object p1, p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;

    iget-object p1, p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;

    .line 67
    invoke-virtual {p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;->hashCode()I

    move-result p1

    add-int/2addr v1, p1

    :cond_4
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method final zzc(Ljava/lang/Object;[BIIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I
    .locals 36
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v7, p2

    move/from16 v8, p4

    move-object/from16 v10, p6

    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzA(Ljava/lang/Object;)V

    sget-object v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    const/4 v11, 0x0

    move/from16 v3, p3

    move v5, v11

    move v6, v5

    move v15, v6

    const/4 v4, -0x1

    const v14, 0xfffff

    :goto_0
    const/16 v16, 0x0

    if-ge v3, v8, :cond_92

    add-int/lit8 v6, v3, 0x1

    .line 2
    aget-byte v3, v7, v3

    if-gez v3, :cond_0

    .line 3
    invoke-static {v3, v7, v6, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzk(I[BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v6

    iget v3, v10, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    move/from16 v35, v6

    move v6, v3

    move/from16 v3, v35

    goto :goto_1

    .line 4
    :cond_0
    move/from16 v35, v6

    move v6, v3

    move/from16 v3, v35

    .line 3
    :goto_1
    const v17, 0xfffff

    ushr-int/lit8 v13, v6, 0x3

    const/4 v12, 0x3

    if-le v13, v4, :cond_2

    div-int/2addr v5, v12

    iget v4, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zze:I

    if-lt v13, v4, :cond_1

    iget v4, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzf:I

    if-gt v13, v4, :cond_1

    .line 5
    invoke-direct {v0, v13, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzq(II)I

    move-result v4

    goto :goto_2

    .line 256
    :cond_1
    const/4 v4, -0x1

    .line 5
    :goto_2
    goto :goto_3

    .line 256
    :cond_2
    iget v4, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zze:I

    if-lt v13, v4, :cond_3

    iget v4, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzf:I

    if-gt v13, v4, :cond_3

    .line 4
    invoke-direct {v0, v13, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzq(II)I

    move-result v4

    goto :goto_3

    :cond_3
    const/4 v4, -0x1

    .line 5
    :goto_3
    const/4 v5, -0x1

    if-ne v4, v5, :cond_4

    move-object/from16 v24, v1

    move/from16 v18, v5

    move v8, v6

    move-object v6, v7

    move v12, v11

    move/from16 v20, v12

    move v9, v13

    move/from16 v23, v15

    move-object v15, v10

    move-object v10, v2

    goto/16 :goto_39

    .line 263
    :cond_4
    and-int/lit8 v5, v6, 0x7

    iget-object v12, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    add-int/lit8 v19, v4, 0x1

    .line 6
    aget v11, v12, v19

    move/from16 v19, v4

    invoke-static {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result v4

    move/from16 v21, v6

    and-int v6, v11, v17

    int-to-long v8, v6

    const/high16 v22, 0x20000000

    const-string v6, "Protocol message had invalid UTF-8."

    move-wide/from16 v24, v8

    const-string v8, ""

    const-wide/16 v26, 0x0

    const-string v9, "CodedInputStream encountered an embedded string or message which claimed to have negative size."

    move-object/from16 v28, v12

    const/16 v12, 0x11

    const/16 v30, 0x1

    if-gt v4, v12, :cond_25

    add-int/lit8 v12, v19, 0x2

    .line 7
    aget v12, v28, v12

    ushr-int/lit8 v23, v12, 0x14

    shl-int v23, v30, v23

    and-int v12, v12, v17

    if-eq v12, v14, :cond_7

    move/from16 v31, v13

    move/from16 v13, v17

    if-eq v14, v13, :cond_5

    int-to-long v13, v14

    .line 8
    invoke-virtual {v1, v2, v13, v14, v15}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_5
    const v13, 0xfffff

    if-ne v12, v13, :cond_6

    const/4 v15, 0x0

    goto :goto_4

    .line 53
    :cond_6
    int-to-long v13, v12

    .line 9
    invoke-virtual {v1, v2, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v13

    move v15, v13

    .line 8
    :goto_4
    move v14, v12

    goto :goto_5

    .line 7
    :cond_7
    move/from16 v31, v13

    .line 8
    :goto_5
    packed-switch v4, :pswitch_data_0

    move-object v4, v10

    move-object v10, v7

    move-object v7, v4

    move-object v11, v2

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    const/16 v20, 0x0

    move/from16 v19, v14

    move/from16 v21, v15

    move-object v14, v1

    const/4 v1, 0x3

    if-ne v5, v1, :cond_24

    or-int v15, v21, v23

    .line 10
    invoke-direct {v0, v11, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzx(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    shl-int/lit8 v2, v31, 0x3

    or-int/lit8 v6, v2, 0x4

    .line 11
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v2

    .line 12
    move/from16 v5, p4

    move-object v3, v10

    invoke-static/range {v1 .. v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzn(Ljava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;[BIIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    .line 13
    invoke-direct {v0, v11, v12, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzF(Ljava/lang/Object;ILjava/lang/Object;)V

    move-object/from16 v7, p2

    move/from16 v8, p4

    move-object/from16 v10, p6

    move v3, v2

    move-object v2, v11

    move v5, v12

    move v6, v13

    move-object v1, v14

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    goto/16 :goto_0

    .line 55
    :pswitch_0
    if-nez v5, :cond_8

    or-int v15, v15, v23

    .line 14
    invoke-static {v7, v3, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v8

    iget-wide v3, v10, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 15
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzc(J)J

    move-result-wide v5

    .line 16
    move/from16 v12, v19

    move/from16 v13, v21

    move-wide/from16 v3, v24

    const/16 v18, -0x1

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move v3, v8

    move v5, v12

    move v6, v13

    move/from16 v4, v31

    const/4 v11, 0x0

    move/from16 v8, p4

    goto/16 :goto_0

    .line 55
    :cond_8
    move-object v9, v2

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    move-object v11, v9

    move/from16 v19, v14

    move/from16 v21, v15

    const/16 v20, 0x0

    move-object v14, v1

    goto/16 :goto_d

    .line 16
    :pswitch_1
    move-object v9, v2

    move v2, v15

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    move/from16 v19, v14

    move-wide/from16 v14, v24

    if-nez v5, :cond_9

    or-int v2, v2, v23

    .line 17
    invoke-static {v7, v3, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v3

    iget v4, v10, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    .line 18
    invoke-static {v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzb(I)I

    move-result v4

    .line 19
    invoke-virtual {v1, v9, v14, v15, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move/from16 v8, p4

    move v15, v2

    move-object v2, v9

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v4, v31

    const/4 v11, 0x0

    goto/16 :goto_0

    .line 16
    :cond_9
    move-object v14, v1

    move/from16 v21, v2

    move-object v11, v9

    const/16 v20, 0x0

    goto/16 :goto_d

    .line 19
    :pswitch_2
    move-object v9, v2

    move v2, v15

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    move/from16 v19, v14

    move-wide/from16 v14, v24

    if-nez v5, :cond_c

    .line 20
    invoke-static {v7, v3, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v3

    iget v4, v10, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    .line 21
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzu(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;

    move-result-object v5

    const/high16 v6, -0x80000000

    and-int/2addr v6, v11

    if-eqz v6, :cond_b

    if-eqz v5, :cond_b

    .line 22
    invoke-interface {v5, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;->zza(I)Z

    move-result v5

    if-eqz v5, :cond_a

    goto :goto_6

    .line 24
    :cond_a
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    move-result-object v5

    int-to-long v14, v4

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v5, v13, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;->zzj(ILjava/lang/Object;)V

    move/from16 v8, p4

    move v15, v2

    move-object v2, v9

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v4, v31

    const/4 v11, 0x0

    goto/16 :goto_0

    .line 22
    :cond_b
    :goto_6
    or-int v2, v2, v23

    .line 23
    invoke-virtual {v1, v9, v14, v15, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move/from16 v8, p4

    move v15, v2

    move-object v2, v9

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v4, v31

    const/4 v11, 0x0

    goto/16 :goto_0

    .line 19
    :cond_c
    move-object v14, v1

    move/from16 v21, v2

    move-object v11, v9

    const/16 v20, 0x0

    goto/16 :goto_d

    .line 24
    :pswitch_3
    move-object v9, v2

    move v2, v15

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    move/from16 v19, v14

    move-wide/from16 v14, v24

    const/4 v4, 0x2

    if-ne v5, v4, :cond_d

    or-int v2, v2, v23

    .line 25
    invoke-static {v7, v3, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v3

    iget-object v4, v10, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzc:Ljava/lang/Object;

    .line 26
    invoke-virtual {v1, v9, v14, v15, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move/from16 v8, p4

    move v15, v2

    move-object v2, v9

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v4, v31

    const/4 v11, 0x0

    goto/16 :goto_0

    .line 24
    :cond_d
    move-object v14, v1

    move/from16 v21, v2

    move-object v11, v9

    const/16 v20, 0x0

    goto/16 :goto_d

    .line 26
    :pswitch_4
    move-object v9, v2

    move v2, v15

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    move/from16 v19, v14

    const/4 v4, 0x2

    if-ne v5, v4, :cond_e

    or-int v15, v2, v23

    .line 27
    move-object v2, v1

    invoke-direct {v0, v9, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzx(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 28
    move-object v4, v2

    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v2

    .line 29
    move-object v5, v4

    move v4, v3

    move-object v3, v7

    move-object v7, v5

    move/from16 v5, p4

    move-object v6, v10

    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzo(Ljava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    .line 30
    move-object v10, v3

    move-object v3, v1

    move-object v1, v6

    invoke-direct {v0, v9, v12, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzF(Ljava/lang/Object;ILjava/lang/Object;)V

    move-object v3, v10

    move-object v10, v1

    move-object v1, v7

    move-object v7, v3

    move/from16 v8, p4

    move v3, v2

    move-object v2, v9

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v4, v31

    const/4 v11, 0x0

    goto/16 :goto_0

    .line 26
    :cond_e
    move-object v4, v7

    move-object v7, v1

    move-object v1, v10

    move-object v10, v4

    move v4, v3

    move/from16 v21, v2

    move-object v14, v7

    move-object v11, v9

    const/16 v20, 0x0

    goto/16 :goto_d

    .line 30
    :pswitch_5
    move-object v4, v7

    move-object v7, v1

    move-object v1, v10

    move-object v10, v4

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    move-object v3, v2

    move/from16 v19, v14

    move v2, v15

    move-wide/from16 v14, v24

    move/from16 v21, v2

    const/4 v2, 0x2

    if-ne v5, v2, :cond_1b

    and-int v2, v11, v22

    if-eqz v2, :cond_1a

    .line 32
    invoke-static {v10, v4, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v4, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ltz v4, :cond_19

    .line 272
    or-int v5, v21, v23

    if-nez v4, :cond_f

    iput-object v8, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzc:Ljava/lang/Object;

    move/from16 v16, v5

    goto/16 :goto_a

    .line 43
    :cond_f
    or-int v8, v2, v4

    array-length v9, v10

    sub-int v11, v9, v2

    sub-int/2addr v11, v4

    .line 33
    sget v16, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhe;->zza:I

    or-int/2addr v8, v11

    if-ltz v8, :cond_18

    .line 273
    add-int v8, v2, v4

    new-array v4, v4, [C

    const/4 v9, 0x0

    :goto_7
    if-ge v2, v8, :cond_10

    .line 34
    aget-byte v11, v10, v2

    invoke-static {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzha;->zzd(B)Z

    move-result v16

    if-eqz v16, :cond_10

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v16, v9, 0x1

    int-to-char v11, v11

    .line 35
    aput-char v11, v4, v9

    move/from16 v9, v16

    goto :goto_7

    :cond_10
    :goto_8
    if-ge v2, v8, :cond_17

    add-int/lit8 v11, v2, 0x1

    .line 36
    aget-byte v2, v10, v2

    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzha;->zzd(B)Z

    move-result v16

    if-eqz v16, :cond_11

    add-int/lit8 v16, v9, 0x1

    int-to-char v2, v2

    .line 40
    aput-char v2, v4, v9

    move v2, v11

    move/from16 v9, v16

    :goto_9
    if-ge v2, v8, :cond_10

    .line 41
    aget-byte v11, v10, v2

    invoke-static {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzha;->zzd(B)Z

    move-result v16

    if-eqz v16, :cond_10

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v16, v9, 0x1

    int-to-char v11, v11

    .line 42
    aput-char v11, v4, v9

    move/from16 v9, v16

    goto :goto_9

    :cond_11
    move/from16 v16, v5

    const/16 v5, -0x20

    if-ge v2, v5, :cond_13

    if-ge v11, v8, :cond_12

    .line 279
    add-int/lit8 v5, v9, 0x1

    add-int/lit8 v21, v11, 0x1

    .line 39
    aget-byte v11, v10, v11

    invoke-static {v2, v11, v4, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzha;->zzc(BB[CI)V

    move v9, v5

    move/from16 v5, v16

    move/from16 v2, v21

    goto :goto_8

    .line 42
    :cond_12
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 278
    invoke-direct {v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 279
    throw v1

    .line 39
    :cond_13
    const/16 v5, -0x10

    if-ge v2, v5, :cond_15

    add-int/lit8 v5, v8, -0x1

    if-ge v11, v5, :cond_14

    .line 277
    add-int/lit8 v5, v9, 0x1

    add-int/lit8 v21, v11, 0x1

    .line 38
    aget-byte v11, v10, v11

    add-int/lit8 v22, v21, 0x1

    move/from16 p3, v5

    aget-byte v5, v10, v21

    invoke-static {v2, v11, v5, v4, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzha;->zzb(BBB[CI)V

    move/from16 v9, p3

    move/from16 v5, v16

    move/from16 v2, v22

    goto :goto_8

    .line 39
    :cond_14
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 276
    invoke-direct {v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 277
    throw v1

    .line 38
    :cond_15
    add-int/lit8 v5, v8, -0x2

    if-ge v11, v5, :cond_16

    .line 275
    add-int/lit8 v5, v11, 0x1

    .line 37
    aget-byte v22, v10, v11

    add-int/lit8 v11, v5, 0x1

    aget-byte v23, v10, v5

    add-int/lit8 v5, v11, 0x1

    aget-byte v24, v10, v11

    move/from16 v21, v2

    move-object/from16 v25, v4

    move/from16 v26, v9

    invoke-static/range {v21 .. v26}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzha;->zza(BBBB[CI)V

    move-object/from16 v2, v25

    add-int/lit8 v9, v9, 0x2

    move-object v4, v2

    move v2, v5

    move/from16 v5, v16

    goto/16 :goto_8

    .line 38
    :cond_16
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 274
    invoke-direct {v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 275
    throw v1

    .line 37
    :cond_17
    move-object v2, v4

    move/from16 v16, v5

    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v5, v9}, Ljava/lang/String;-><init>([CII)V

    iput-object v4, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzc:Ljava/lang/Object;

    move v2, v8

    .line 272
    :goto_a
    const/16 v20, 0x0

    goto :goto_b

    .line 33
    :cond_18
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 273
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v20, 0x0

    aput-object v3, v5, v20

    aput-object v2, v5, v30

    const/16 v29, 0x2

    aput-object v4, v5, v29

    const-string v2, "buffer length=%d, index=%d, size=%d"

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 32
    :cond_19
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 271
    invoke-direct {v1, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 272
    throw v1

    .line 37
    :cond_1a
    const/16 v20, 0x0

    or-int v2, v21, v23

    .line 31
    invoke-static {v10, v4, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzh([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v4

    move/from16 v16, v2

    move v2, v4

    .line 272
    :goto_b
    iget-object v4, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzc:Ljava/lang/Object;

    .line 43
    invoke-virtual {v7, v3, v14, v15, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move-object v4, v10

    move-object v10, v1

    move-object v1, v7

    move-object v7, v4

    move-object v4, v3

    move v3, v2

    move-object v2, v4

    move/from16 v8, p4

    move v5, v12

    move v6, v13

    move/from16 v15, v16

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    goto/16 :goto_0

    .line 30
    :cond_1b
    const/16 v20, 0x0

    move-object v11, v3

    move v3, v4

    move-object v14, v7

    goto/16 :goto_d

    .line 31
    :pswitch_6
    move-object v4, v7

    move-object v7, v1

    move-object v1, v10

    move-object v10, v4

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    const/16 v20, 0x0

    move-object v3, v2

    move/from16 v19, v14

    move/from16 v21, v15

    move-wide/from16 v14, v24

    if-nez v5, :cond_1d

    or-int v2, v21, v23

    .line 44
    invoke-static {v10, v4, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v4

    iget-wide v5, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    cmp-long v5, v5, v26

    if-eqz v5, :cond_1c

    move/from16 v5, v30

    goto :goto_c

    .line 45
    :cond_1c
    move/from16 v5, v20

    :goto_c
    invoke-static {v3, v14, v15, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzm(Ljava/lang/Object;JZ)V

    move-object v5, v10

    move-object v10, v1

    move-object v1, v7

    move-object v7, v5

    move/from16 v8, p4

    move v15, v2

    move-object v2, v3

    move v3, v4

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    goto/16 :goto_0

    .line 31
    :cond_1d
    move-object v11, v3

    move v3, v4

    move-object v14, v7

    goto/16 :goto_d

    .line 45
    :pswitch_7
    move-object v4, v7

    move-object v7, v1

    move-object v1, v10

    move-object v10, v4

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    const/16 v20, 0x0

    move-object v3, v2

    move/from16 v19, v14

    move/from16 v21, v15

    move-wide/from16 v14, v24

    const/4 v2, 0x5

    if-ne v5, v2, :cond_1e

    add-int/lit8 v2, v4, 0x4

    or-int v5, v21, v23

    .line 46
    invoke-static {v10, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v4

    invoke-virtual {v7, v3, v14, v15, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move-object v4, v10

    move-object v10, v1

    move-object v1, v7

    move-object v7, v4

    move-object v4, v3

    move v3, v2

    move-object v2, v4

    move/from16 v8, p4

    move v15, v5

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    goto/16 :goto_0

    .line 45
    :cond_1e
    move-object v11, v3

    move v3, v4

    move-object v14, v7

    goto/16 :goto_d

    .line 46
    :pswitch_8
    move-object v4, v7

    move-object v7, v1

    move-object v1, v10

    move-object v10, v4

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    const/16 v20, 0x0

    move-object v3, v2

    move/from16 v19, v14

    move/from16 v21, v15

    move-wide/from16 v14, v24

    move/from16 v2, v30

    if-ne v5, v2, :cond_1f

    add-int/lit8 v8, v4, 0x8

    or-int v9, v21, v23

    .line 47
    invoke-static {v10, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v5

    move-object v2, v7

    move-object v7, v1

    move-object v1, v2

    move-object v2, v3

    move-wide v3, v14

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object v3, v10

    move-object v10, v7

    move-object v7, v3

    move v3, v8

    move v15, v9

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    move/from16 v8, p4

    goto/16 :goto_0

    .line 46
    :cond_1f
    move-object v2, v7

    move-object v7, v1

    move-object v1, v2

    move-object v2, v3

    move-object v14, v1

    move-object v11, v2

    move v3, v4

    goto/16 :goto_d

    .line 47
    :pswitch_9
    move-object v4, v10

    move-object v10, v7

    move-object v7, v4

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    const/16 v20, 0x0

    move/from16 v19, v14

    move/from16 v21, v15

    move-wide/from16 v14, v24

    if-nez v5, :cond_20

    or-int v3, v21, v23

    .line 48
    invoke-static {v10, v4, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v4

    iget v5, v7, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    .line 49
    invoke-virtual {v1, v2, v14, v15, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move-object v5, v10

    move-object v10, v7

    move-object v7, v5

    move/from16 v8, p4

    move v15, v3

    move v3, v4

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    goto/16 :goto_0

    .line 47
    :cond_20
    move-object v14, v1

    move-object v11, v2

    move v3, v4

    goto/16 :goto_d

    .line 49
    :pswitch_a
    move-object v4, v10

    move-object v10, v7

    move-object v7, v4

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    const/16 v20, 0x0

    move/from16 v19, v14

    move/from16 v21, v15

    move-wide/from16 v14, v24

    if-nez v5, :cond_21

    or-int v8, v21, v23

    .line 50
    invoke-static {v10, v4, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v9

    iget-wide v5, v7, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 51
    move-wide v3, v14

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object v3, v10

    move-object v10, v7

    move-object v7, v3

    move v15, v8

    move v3, v9

    move v5, v12

    move v6, v13

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    move/from16 v8, p4

    goto/16 :goto_0

    .line 49
    :cond_21
    move-object v14, v1

    move-object v11, v2

    move v3, v4

    goto/16 :goto_d

    .line 51
    :pswitch_b
    move-object v4, v10

    move-object v10, v7

    move-object v7, v4

    move-object v11, v2

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    const/16 v20, 0x0

    move/from16 v19, v14

    move/from16 v21, v15

    move-object v14, v1

    move-wide/from16 v1, v24

    const/4 v3, 0x5

    if-ne v5, v3, :cond_22

    add-int/lit8 v3, v4, 0x4

    or-int v15, v21, v23

    .line 52
    invoke-static {v10, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v4

    .line 53
    invoke-static {v11, v1, v2, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzp(Ljava/lang/Object;JF)V

    move-object v1, v10

    move-object v10, v7

    move-object v7, v1

    move/from16 v8, p4

    move-object v2, v11

    move v5, v12

    move v6, v13

    move-object v1, v14

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    goto/16 :goto_0

    .line 51
    :cond_22
    move v3, v4

    goto :goto_d

    .line 13
    :pswitch_c
    move-object v4, v10

    move-object v10, v7

    move-object v7, v4

    move-object v11, v2

    move v4, v3

    move/from16 v12, v19

    move/from16 v13, v21

    const/16 v18, -0x1

    const/16 v20, 0x0

    move/from16 v19, v14

    move/from16 v21, v15

    move-object v14, v1

    move-wide/from16 v1, v24

    const/4 v3, 0x1

    if-ne v5, v3, :cond_23

    add-int/lit8 v3, v4, 0x8

    or-int v15, v21, v23

    .line 54
    invoke-static {v10, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v4

    .line 55
    invoke-static {v11, v1, v2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzo(Ljava/lang/Object;JD)V

    move-object v1, v10

    move-object v10, v7

    move-object v7, v1

    move/from16 v8, p4

    move-object v2, v11

    move v5, v12

    move v6, v13

    move-object v1, v14

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v4, v31

    goto/16 :goto_0

    .line 13
    :cond_23
    move v3, v4

    goto :goto_d

    .line 8
    :cond_24
    move v3, v4

    .line 5
    :goto_d
    move-object/from16 v6, p2

    move-object/from16 v15, p6

    move-object v10, v11

    move v8, v13

    move-object/from16 v24, v14

    move/from16 v14, v19

    move/from16 v23, v21

    move/from16 v9, v31

    goto/16 :goto_39

    .line 9
    :cond_25
    move-object v7, v1

    move-object v10, v2

    move/from16 v31, v13

    move/from16 v12, v19

    move/from16 v13, v21

    move-wide/from16 v1, v24

    const/16 v18, -0x1

    const/16 v20, 0x0

    move/from16 v19, v3

    const/16 v3, 0x1b

    const/16 v21, 0xa

    if-ne v4, v3, :cond_29

    const/4 v4, 0x2

    if-ne v5, v4, :cond_28

    .line 56
    invoke-virtual {v7, v10, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    .line 57
    invoke-interface {v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->zzc()Z

    move-result v4

    if-nez v4, :cond_27

    .line 58
    invoke-interface {v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->size()I

    move-result v4

    if-nez v4, :cond_26

    move/from16 v4, v21

    goto :goto_e

    .line 62
    :cond_26
    add-int v21, v4, v4

    move/from16 v4, v21

    .line 59
    :goto_e
    invoke-interface {v3, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->zzd(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    move-result-object v3

    .line 60
    invoke-virtual {v7, v10, v1, v2, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move-object v6, v3

    goto :goto_f

    .line 62
    :cond_27
    move-object v6, v3

    .line 61
    :goto_f
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v1

    .line 62
    move-object/from16 v3, p2

    move/from16 v5, p4

    move v2, v13

    move/from16 v4, v19

    move-object v13, v7

    move-object/from16 v7, p6

    invoke-static/range {v1 .. v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzf(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;I[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    move-object v7, v3

    move v3, v2

    move/from16 v8, p4

    move v6, v3

    move-object v2, v10

    move v5, v12

    move/from16 v11, v20

    move/from16 v4, v31

    move-object/from16 v10, p6

    move v3, v1

    move-object v1, v13

    goto/16 :goto_0

    .line 9
    :cond_28
    move v3, v13

    move/from16 v4, v19

    move-object v13, v7

    move-object/from16 v7, p2

    move-object/from16 v6, p6

    move v8, v3

    move-object/from16 v24, v13

    move/from16 v19, v14

    move/from16 v23, v15

    move/from16 v9, v31

    move v15, v4

    goto/16 :goto_31

    .line 62
    :cond_29
    move-object/from16 v24, v7

    move v3, v13

    move/from16 v23, v15

    move/from16 v15, v19

    move-object/from16 v7, p2

    move-object v13, v6

    move/from16 v19, v14

    move/from16 v14, p4

    move-object/from16 v6, p6

    move-object/from16 v25, v13

    const/16 v13, 0x31

    if-gt v4, v13, :cond_75

    move-object v13, v8

    move-object/from16 v32, v9

    int-to-long v8, v11

    sget-object v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 63
    invoke-virtual {v11, v10, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    .line 64
    invoke-interface {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->zzc()Z

    move-result v22

    if-nez v22, :cond_2b

    .line 65
    invoke-interface {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->size()I

    move-result v22

    if-nez v22, :cond_2a

    move-wide/from16 v33, v8

    move/from16 v8, v21

    goto :goto_10

    .line 198
    :cond_2a
    add-int v21, v22, v22

    move-wide/from16 v33, v8

    move/from16 v8, v21

    .line 66
    :goto_10
    invoke-interface {v11, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->zzd(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    move-result-object v11

    sget-object v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 67
    invoke-virtual {v8, v10, v1, v2, v11}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_11

    .line 198
    :cond_2b
    move-wide/from16 v33, v8

    .line 67
    :goto_11
    const-string v1, "While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length."

    packed-switch v4, :pswitch_data_1

    move v8, v3

    move-object v2, v7

    move v4, v14

    move v3, v15

    move/from16 v9, v31

    const/4 v1, 0x3

    if-ne v5, v1, :cond_73

    and-int/lit8 v1, v8, -0x8

    or-int/lit8 v5, v1, 0x4

    .line 68
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v1

    .line 69
    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzd(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;[BIIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v7

    move v15, v3

    iget-object v3, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzc:Ljava/lang/Object;

    .line 70
    invoke-interface {v11, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2e

    .line 210
    :pswitch_d
    const/4 v4, 0x2

    if-ne v5, v4, :cond_2e

    .line 74
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 75
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;

    .line 76
    invoke-static {v7, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v4, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    add-int/2addr v4, v2

    :goto_12
    if-ge v2, v4, :cond_2c

    .line 77
    invoke-static {v7, v2, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget-wide v8, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 78
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzc(J)J

    move-result-wide v8

    invoke-virtual {v11, v8, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    goto :goto_12

    :cond_2c
    if-ne v2, v4, :cond_2d

    move v8, v3

    move/from16 v9, v31

    move v3, v2

    goto/16 :goto_30

    .line 315
    :cond_2d
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 280
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 281
    throw v2

    .line 78
    :cond_2e
    if-nez v5, :cond_2f

    .line 79
    sget v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 80
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;

    .line 81
    invoke-static {v7, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget-wide v4, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 82
    invoke-static {v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzc(J)J

    move-result-wide v4

    invoke-virtual {v11, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    :goto_13
    if-ge v1, v14, :cond_33

    .line 83
    invoke-static {v7, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v4, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v3, v4, :cond_33

    .line 84
    invoke-static {v7, v2, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget-wide v4, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    invoke-static {v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzc(J)J

    move-result-wide v4

    .line 85
    invoke-virtual {v11, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    goto :goto_13

    :cond_2f
    move v8, v3

    move/from16 v9, v31

    goto/16 :goto_2f

    :pswitch_e
    const/4 v4, 0x2

    if-ne v5, v4, :cond_32

    .line 86
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 87
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;

    .line 88
    invoke-static {v7, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v4, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    add-int/2addr v4, v2

    :goto_14
    if-ge v2, v4, :cond_30

    .line 89
    invoke-static {v7, v2, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    .line 90
    invoke-static {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzb(I)I

    move-result v5

    invoke-virtual {v11, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;->zzg(I)V

    goto :goto_14

    :cond_30
    if-ne v2, v4, :cond_31

    move v8, v3

    move/from16 v9, v31

    move v3, v2

    goto/16 :goto_30

    .line 281
    :cond_31
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 282
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 283
    throw v2

    .line 90
    :cond_32
    if-nez v5, :cond_34

    .line 91
    sget v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 92
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;

    .line 93
    invoke-static {v7, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget v2, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    .line 94
    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzb(I)I

    move-result v2

    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;->zzg(I)V

    :goto_15
    if-ge v1, v14, :cond_33

    .line 95
    invoke-static {v7, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v4, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v3, v4, :cond_33

    .line 96
    invoke-static {v7, v2, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget v2, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzb(I)I

    move-result v2

    .line 97
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;->zzg(I)V

    goto :goto_15

    .line 73
    :cond_33
    move v8, v3

    move/from16 v9, v31

    goto/16 :goto_2d

    .line 97
    :cond_34
    move v8, v3

    move/from16 v9, v31

    goto/16 :goto_2f

    :pswitch_f
    const/4 v4, 0x2

    if-ne v5, v4, :cond_35

    .line 98
    invoke-static {v7, v15, v11, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzg([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    move v13, v3

    move-object v2, v7

    move v4, v14

    move v3, v15

    goto :goto_16

    .line 113
    :cond_35
    if-nez v5, :cond_3d

    .line 99
    move v1, v3

    move-object v2, v7

    move-object v5, v11

    move v4, v14

    move v3, v15

    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzl(I[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v7

    move v13, v1

    move v1, v7

    .line 100
    :goto_16
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzu(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;

    move-result-object v5

    iget-object v7, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;

    .line 101
    sget v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    if-eqz v5, :cond_3b

    .line 102
    instance-of v8, v11, Ljava/util/RandomAccess;

    if-eqz v8, :cond_39

    .line 103
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v8

    move-object/from16 v15, v16

    move/from16 v9, v20

    move v14, v9

    :goto_17
    if-ge v9, v8, :cond_38

    .line 104
    invoke-interface {v11, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Integer;

    move/from16 p3, v1

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 105
    invoke-interface {v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;->zza(I)Z

    move-result v21

    if-eqz v21, :cond_37

    if-eq v9, v14, :cond_36

    .line 106
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v11, v14, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_36
    add-int/lit8 v14, v14, 0x1

    move/from16 v21, v9

    move/from16 v9, v31

    goto :goto_18

    .line 107
    :cond_37
    move/from16 v21, v9

    move/from16 v9, v31

    invoke-static {v10, v9, v1, v15, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzn(Ljava/lang/Object;IILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;)Ljava/lang/Object;

    move-result-object v15

    .line 106
    :goto_18
    add-int/lit8 v1, v21, 0x1

    move/from16 v31, v9

    move v9, v1

    move/from16 v1, p3

    goto :goto_17

    .line 107
    :cond_38
    move/from16 p3, v1

    move/from16 v9, v31

    if-eq v14, v8, :cond_3c

    .line 108
    invoke-interface {v11, v14, v8}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    goto :goto_1a

    .line 109
    :cond_39
    move/from16 p3, v1

    move/from16 v9, v31

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object/from16 v8, v16

    :cond_3a
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_3c

    .line 110
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 111
    invoke-interface {v5, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;->zza(I)Z

    move-result v14

    if-nez v14, :cond_3a

    .line 112
    invoke-static {v10, v9, v11, v8, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzn(Ljava/lang/Object;IILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;)Ljava/lang/Object;

    move-result-object v8

    .line 113
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_19

    .line 101
    :cond_3b
    move/from16 p3, v1

    move/from16 v9, v31

    .line 73
    :cond_3c
    :goto_1a
    move v15, v3

    move v8, v13

    move/from16 v3, p3

    goto/16 :goto_30

    .line 99
    :cond_3d
    move v13, v3

    move-object v2, v7

    move v4, v14

    move v3, v15

    move/from16 v9, v31

    move v8, v13

    goto/16 :goto_2f

    :pswitch_10
    move v13, v3

    move-object v2, v7

    move v4, v14

    move v3, v15

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_45

    .line 114
    invoke-static {v2, v3, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ltz v7, :cond_44

    .line 285
    array-length v8, v2

    sub-int/2addr v8, v5

    if-gt v7, v8, :cond_43

    .line 287
    if-nez v7, :cond_3e

    .line 115
    sget-object v7, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    invoke-interface {v11, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    .line 116
    :cond_3e
    invoke-static {v2, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzr([BII)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    move-result-object v8

    invoke-interface {v11, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    add-int/2addr v5, v7

    .line 115
    :goto_1b
    if-ge v5, v4, :cond_42

    .line 117
    invoke-static {v2, v5, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v7

    iget v8, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v13, v8, :cond_42

    .line 118
    invoke-static {v2, v7, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ltz v7, :cond_41

    .line 289
    array-length v8, v2

    sub-int/2addr v8, v5

    if-gt v7, v8, :cond_40

    .line 291
    if-nez v7, :cond_3f

    sget-object v7, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    .line 119
    invoke-interface {v11, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    .line 120
    :cond_3f
    invoke-static {v2, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;->zzr([BII)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    move-result-object v8

    invoke-interface {v11, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    add-int/2addr v5, v7

    goto :goto_1b

    .line 289
    :cond_40
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 290
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 291
    throw v2

    .line 118
    :cond_41
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 288
    move-object/from16 v2, v32

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 289
    throw v1

    .line 73
    :cond_42
    move v15, v3

    move v3, v5

    move v8, v13

    goto/16 :goto_30

    .line 285
    :cond_43
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 286
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 287
    throw v2

    .line 114
    :cond_44
    move-object/from16 v2, v32

    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 284
    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 285
    throw v1

    .line 116
    :cond_45
    move v15, v3

    move v8, v13

    goto/16 :goto_2f

    :pswitch_11
    move v13, v3

    move-object v2, v7

    move v4, v14

    move v3, v15

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_46

    .line 121
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v1

    .line 122
    move v5, v4

    move-object v7, v6

    move-object v6, v11

    move v4, v3

    move-object v3, v2

    move v2, v13

    invoke-static/range {v1 .. v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzf(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;I[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    move v15, v4

    move v4, v5

    move v3, v1

    move v8, v2

    move-object v6, v7

    goto/16 :goto_30

    :cond_46
    move v15, v3

    move v8, v13

    move-object v3, v2

    goto/16 :goto_2f

    :pswitch_12
    move v8, v3

    move-object v3, v7

    move v4, v14

    move/from16 v9, v31

    move-object/from16 v2, v32

    const/4 v7, 0x2

    if-ne v5, v7, :cond_52

    const-wide/32 v21, 0x20000000

    and-long v21, v33, v21

    cmp-long v1, v21, v26

    if-nez v1, :cond_4b

    .line 123
    invoke-static {v3, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ltz v5, :cond_4a

    .line 293
    if-nez v5, :cond_47

    .line 124
    invoke-interface {v11, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 131
    :cond_47
    new-instance v7, Ljava/lang/String;

    .line 125
    sget-object v14, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zza:Ljava/nio/charset/Charset;

    invoke-direct {v7, v3, v1, v5, v14}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 126
    invoke-interface {v11, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    add-int/2addr v1, v5

    .line 124
    :goto_1c
    if-ge v1, v4, :cond_70

    .line 127
    invoke-static {v3, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v7, :cond_70

    .line 128
    invoke-static {v3, v5, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ltz v5, :cond_49

    .line 295
    if-nez v5, :cond_48

    .line 129
    invoke-interface {v11, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_48
    new-instance v7, Ljava/lang/String;

    .line 130
    sget-object v14, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zza:Ljava/nio/charset/Charset;

    invoke-direct {v7, v3, v1, v5, v14}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 131
    invoke-interface {v11, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    add-int/2addr v1, v5

    goto :goto_1c

    .line 128
    :cond_49
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 294
    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 295
    throw v1

    .line 123
    :cond_4a
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 292
    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 293
    throw v1

    .line 132
    :cond_4b
    invoke-static {v3, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ltz v5, :cond_51

    .line 297
    if-nez v5, :cond_4c

    .line 133
    invoke-interface {v11, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 142
    :cond_4c
    add-int v7, v1, v5

    .line 134
    invoke-static {v3, v1, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhe;->zzg([BII)Z

    move-result v14

    if-eqz v14, :cond_50

    .line 299
    new-instance v14, Ljava/lang/String;

    .line 135
    move/from16 p3, v7

    sget-object v7, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zza:Ljava/nio/charset/Charset;

    invoke-direct {v14, v3, v1, v5, v7}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 136
    invoke-interface {v11, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    move/from16 v1, p3

    .line 133
    :goto_1d
    if-ge v1, v4, :cond_70

    .line 137
    invoke-static {v3, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v7, :cond_70

    .line 138
    invoke-static {v3, v5, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ltz v5, :cond_4f

    .line 301
    if-nez v5, :cond_4d

    .line 139
    invoke-interface {v11, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    :cond_4d
    add-int v7, v1, v5

    .line 140
    invoke-static {v3, v1, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhe;->zzg([BII)Z

    move-result v14

    if-eqz v14, :cond_4e

    .line 303
    new-instance v14, Ljava/lang/String;

    .line 141
    move/from16 p3, v7

    sget-object v7, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zza:Ljava/nio/charset/Charset;

    invoke-direct {v14, v3, v1, v5, v7}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 142
    invoke-interface {v11, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    move/from16 v1, p3

    goto :goto_1d

    .line 140
    :cond_4e
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 302
    move-object/from16 v7, v25

    invoke-direct {v1, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 303
    throw v1

    .line 138
    :cond_4f
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 300
    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 301
    throw v1

    .line 134
    :cond_50
    move-object/from16 v7, v25

    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 298
    invoke-direct {v1, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 299
    throw v1

    .line 132
    :cond_51
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 296
    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 297
    throw v1

    .line 136
    :cond_52
    goto/16 :goto_2f

    :pswitch_13
    move v8, v3

    move-object v3, v7

    move v4, v14

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_56

    .line 143
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 144
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcw;

    .line 145
    invoke-static {v3, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    add-int/2addr v5, v2

    :goto_1e
    if-ge v2, v5, :cond_54

    .line 146
    invoke-static {v3, v2, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget-wide v13, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    cmp-long v7, v13, v26

    if-eqz v7, :cond_53

    const/4 v7, 0x1

    goto :goto_1f

    .line 147
    :cond_53
    move/from16 v7, v20

    :goto_1f
    invoke-virtual {v11, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcw;->zze(Z)V

    goto :goto_1e

    :cond_54
    if-ne v2, v5, :cond_55

    move v3, v2

    goto/16 :goto_30

    .line 283
    :cond_55
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 304
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 305
    throw v2

    .line 147
    :cond_56
    if-nez v5, :cond_59

    .line 148
    sget v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 149
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcw;

    .line 150
    invoke-static {v3, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget-wide v13, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    cmp-long v2, v13, v26

    if-eqz v2, :cond_57

    const/4 v2, 0x1

    goto :goto_20

    .line 154
    :cond_57
    move/from16 v2, v20

    .line 151
    :goto_20
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcw;->zze(Z)V

    :goto_21
    if-ge v1, v4, :cond_70

    .line 152
    invoke-static {v3, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v5, :cond_70

    .line 153
    invoke-static {v3, v2, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget-wide v13, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    cmp-long v2, v13, v26

    if-eqz v2, :cond_58

    const/4 v2, 0x1

    goto :goto_22

    .line 154
    :cond_58
    move/from16 v2, v20

    :goto_22
    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcw;->zze(Z)V

    goto :goto_21

    :cond_59
    goto/16 :goto_2f

    :pswitch_14
    move v8, v3

    move-object v3, v7

    move v4, v14

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_5c

    .line 155
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 156
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;

    .line 157
    invoke-static {v3, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    add-int/2addr v5, v2

    :goto_23
    if-ge v2, v5, :cond_5a

    .line 158
    invoke-static {v3, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v7

    invoke-virtual {v11, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;->zzg(I)V

    add-int/lit8 v2, v2, 0x4

    goto :goto_23

    :cond_5a
    if-ne v2, v5, :cond_5b

    move v3, v2

    goto/16 :goto_30

    .line 305
    :cond_5b
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 306
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 307
    throw v2

    .line 158
    :cond_5c
    const/4 v2, 0x5

    if-ne v5, v2, :cond_5d

    add-int/lit8 v1, v15, 0x4

    .line 159
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 160
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;

    .line 161
    invoke-static {v3, v15}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v2

    invoke-virtual {v11, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;->zzg(I)V

    :goto_24
    if-ge v1, v4, :cond_70

    .line 162
    invoke-static {v3, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v5, :cond_70

    .line 163
    invoke-static {v3, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v1

    invoke-virtual {v11, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzei;->zzg(I)V

    add-int/lit8 v1, v2, 0x4

    goto :goto_24

    :cond_5d
    goto/16 :goto_2f

    :pswitch_15
    move v8, v3

    move-object v3, v7

    move v4, v14

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_60

    .line 164
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 165
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;

    .line 166
    invoke-static {v3, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    add-int/2addr v5, v2

    :goto_25
    if-ge v2, v5, :cond_5e

    .line 167
    invoke-static {v3, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v13

    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    add-int/lit8 v2, v2, 0x8

    goto :goto_25

    :cond_5e
    if-ne v2, v5, :cond_5f

    move v3, v2

    goto/16 :goto_30

    .line 307
    :cond_5f
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 308
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 309
    throw v2

    .line 167
    :cond_60
    const/4 v2, 0x1

    if-ne v5, v2, :cond_61

    add-int/lit8 v1, v15, 0x8

    .line 168
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 169
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;

    .line 170
    invoke-static {v3, v15}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v13

    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    :goto_26
    if-ge v1, v4, :cond_70

    .line 171
    invoke-static {v3, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    iget v5, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v5, :cond_70

    .line 172
    invoke-static {v3, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v13

    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    add-int/lit8 v1, v2, 0x8

    goto :goto_26

    :cond_61
    goto/16 :goto_2f

    :pswitch_16
    move v8, v3

    move-object v3, v7

    move v4, v14

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_62

    .line 173
    invoke-static {v3, v15, v11, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzg([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    move v3, v1

    goto/16 :goto_30

    :cond_62
    if-nez v5, :cond_63

    .line 174
    move-object v2, v3

    move v1, v8

    move-object v5, v11

    move v3, v15

    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzl(I[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    move v3, v5

    goto/16 :goto_30

    :cond_63
    move-object v2, v3

    move v3, v15

    goto/16 :goto_2f

    :pswitch_17
    move v8, v3

    move-object v2, v7

    move v4, v14

    move v3, v15

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_66

    .line 175
    sget v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 176
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;

    .line 177
    invoke-static {v2, v3, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    add-int/2addr v7, v5

    :goto_27
    if-ge v5, v7, :cond_64

    .line 178
    invoke-static {v2, v5, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget-wide v13, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 179
    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    goto :goto_27

    :cond_64
    if-ne v5, v7, :cond_65

    move v15, v3

    move v3, v5

    goto/16 :goto_30

    .line 309
    :cond_65
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 310
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 311
    throw v2

    .line 179
    :cond_66
    if-nez v5, :cond_67

    .line 180
    sget v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 181
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;

    .line 182
    invoke-static {v2, v3, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget-wide v13, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 183
    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    :goto_28
    if-ge v1, v4, :cond_6f

    .line 184
    invoke-static {v2, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v7, :cond_6f

    .line 185
    invoke-static {v2, v5, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v1

    iget-wide v13, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 186
    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfb;->zzf(J)V

    goto :goto_28

    :cond_67
    move v15, v3

    goto/16 :goto_2f

    :pswitch_18
    move v8, v3

    move-object v2, v7

    move v4, v14

    move v3, v15

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_6a

    .line 187
    sget v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 188
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdz;

    .line 189
    invoke-static {v2, v3, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    add-int/2addr v7, v5

    :goto_29
    if-ge v5, v7, :cond_68

    .line 190
    invoke-static {v2, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v13

    .line 191
    invoke-virtual {v11, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdz;->zzh(F)V

    add-int/lit8 v5, v5, 0x4

    goto :goto_29

    :cond_68
    if-ne v5, v7, :cond_69

    move v15, v3

    move v3, v5

    goto/16 :goto_30

    .line 311
    :cond_69
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 312
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 313
    throw v2

    .line 191
    :cond_6a
    const/4 v1, 0x5

    if-ne v5, v1, :cond_6b

    add-int/lit8 v1, v3, 0x4

    .line 192
    sget v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 193
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdz;

    .line 194
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v5

    .line 195
    invoke-virtual {v11, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdz;->zzh(F)V

    :goto_2a
    if-ge v1, v4, :cond_6f

    .line 196
    invoke-static {v2, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v7, :cond_6f

    .line 197
    invoke-static {v2, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    .line 198
    invoke-virtual {v11, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdz;->zzh(F)V

    add-int/lit8 v1, v5, 0x4

    goto :goto_2a

    :cond_6b
    move v15, v3

    goto/16 :goto_2f

    .line 73
    :pswitch_19
    move v8, v3

    move-object v2, v7

    move v4, v14

    move v3, v15

    move/from16 v9, v31

    const/4 v7, 0x2

    if-ne v5, v7, :cond_6e

    .line 199
    sget v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 200
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdp;

    .line 201
    invoke-static {v2, v3, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    add-int/2addr v7, v5

    :goto_2b
    if-ge v5, v7, :cond_6c

    .line 202
    invoke-static {v2, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v13

    .line 203
    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdp;->zzf(D)V

    add-int/lit8 v5, v5, 0x8

    goto :goto_2b

    :cond_6c
    if-ne v5, v7, :cond_6d

    move v15, v3

    move v3, v5

    goto :goto_30

    .line 325
    :cond_6d
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 314
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 315
    throw v2

    .line 203
    :cond_6e
    const/4 v1, 0x1

    if-ne v5, v1, :cond_71

    add-int/lit8 v1, v3, 0x8

    .line 204
    sget v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 205
    check-cast v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdp;

    .line 206
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v13

    .line 207
    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdp;->zzf(D)V

    :goto_2c
    if-ge v1, v4, :cond_6f

    .line 208
    invoke-static {v2, v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v7, :cond_6f

    .line 209
    invoke-static {v2, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v13

    .line 210
    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdp;->zzf(D)V

    add-int/lit8 v1, v5, 0x8

    goto :goto_2c

    .line 73
    :cond_6f
    move v15, v3

    :cond_70
    :goto_2d
    move v3, v1

    goto :goto_30

    .line 210
    :cond_71
    move v15, v3

    goto :goto_2f

    .line 70
    :goto_2e
    if-ge v7, v4, :cond_72

    .line 71
    invoke-static {v2, v7, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v3

    iget v13, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-ne v8, v13, :cond_72

    .line 72
    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzd(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;[BIIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v7

    iget-object v2, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzc:Ljava/lang/Object;

    .line 73
    invoke-interface {v11, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->add(Ljava/lang/Object;)Z

    move-object/from16 v2, p2

    move/from16 v4, p4

    goto :goto_2e

    :cond_72
    move v3, v7

    goto :goto_30

    :cond_73
    move v15, v3

    :goto_2f
    move v3, v15

    :goto_30
    if-eq v3, v15, :cond_74

    move-object/from16 v7, p2

    move v4, v9

    move-object v2, v10

    move v5, v12

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v15, v23

    move-object/from16 v1, v24

    move-object v10, v6

    move v6, v8

    move/from16 v8, p4

    goto/16 :goto_0

    :cond_74
    move-object v15, v6

    move/from16 v14, v19

    move-object/from16 v6, p2

    goto/16 :goto_39

    .line 198
    :cond_75
    move-object v13, v8

    move-object/from16 v7, v25

    move/from16 v9, v31

    move v8, v3

    const/16 v3, 0x32

    if-ne v4, v3, :cond_78

    const/4 v7, 0x2

    if-ne v5, v7, :cond_77

    sget-object v3, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 316
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzw(I)Ljava/lang/Object;

    move-result-object v4

    .line 317
    invoke-virtual {v3, v10, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 318
    move-object v6, v5

    check-cast v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;

    invoke-virtual {v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;->zze()Z

    move-result v6

    if-nez v6, :cond_76

    invoke-static {}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;->zza()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;

    move-result-object v6

    .line 319
    invoke-virtual {v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;->zzb()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;

    move-result-object v6

    .line 320
    invoke-static {v6, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfh;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    invoke-virtual {v3, v10, v1, v2, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 322
    :cond_76
    check-cast v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzff;

    .line 323
    throw v16

    .line 5
    :cond_77
    :goto_31
    move v3, v15

    move/from16 v14, v19

    move-object v15, v6

    move-object/from16 v6, p2

    goto/16 :goto_39

    .line 323
    :cond_78
    add-int/lit8 v3, v12, 0x2

    sget-object v14, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 211
    aget v3, v28, v3

    const v17, 0xfffff

    and-int v3, v3, v17

    move/from16 v21, v4

    int-to-long v3, v3

    packed-switch v21, :pswitch_data_2

    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    goto/16 :goto_37

    .line 259
    :pswitch_1a
    const/4 v1, 0x3

    if-ne v5, v1, :cond_79

    and-int/lit8 v1, v8, -0x8

    or-int/lit8 v1, v1, 0x4

    .line 212
    move v6, v1

    invoke-direct {v0, v10, v9, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzy(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v1

    .line 213
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v2

    .line 214
    move-object/from16 v3, p2

    move/from16 v5, p4

    move-object/from16 v7, p6

    move v4, v15

    invoke-static/range {v1 .. v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzn(Ljava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;[BIIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    .line 215
    move-object v6, v7

    move-object v7, v3

    invoke-direct {v0, v10, v9, v12, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzG(Ljava/lang/Object;IILjava/lang/Object;)V

    move v3, v2

    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_38

    :cond_79
    move-object/from16 v7, p2

    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_37

    :pswitch_1b
    move-object/from16 v7, p2

    if-nez v5, :cond_7a

    .line 216
    invoke-static {v7, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    move/from16 v21, v12

    iget-wide v11, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 217
    invoke-static {v11, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzc(J)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v14, v10, v1, v2, v11}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 218
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_38

    :cond_7a
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_37

    :pswitch_1c
    move-object/from16 v7, p2

    move/from16 v21, v12

    if-nez v5, :cond_7b

    .line 219
    invoke-static {v7, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v11, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    .line 220
    invoke-static {v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdj;->zzb(I)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v14, v10, v1, v2, v11}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 221
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_38

    :cond_7b
    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_37

    :pswitch_1d
    move-object/from16 v7, p2

    move/from16 v21, v12

    if-nez v5, :cond_7e

    .line 222
    invoke-static {v7, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v11, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    .line 223
    move/from16 v12, v21

    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzu(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;

    move-result-object v13

    if-eqz v13, :cond_7d

    .line 224
    invoke-interface {v13, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;->zza(I)Z

    move-result v13

    if-eqz v13, :cond_7c

    goto :goto_32

    .line 227
    :cond_7c
    invoke-static {v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    move-result-object v1

    int-to-long v2, v11

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v8, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;->zzj(ILjava/lang/Object;)V

    goto :goto_33

    .line 225
    :cond_7d
    :goto_32
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v14, v10, v1, v2, v11}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 226
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 211
    :goto_33
    move v3, v5

    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_38

    .line 227
    :cond_7e
    move/from16 v12, v21

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_37

    :pswitch_1e
    move-object/from16 v7, p2

    const/4 v11, 0x2

    if-ne v5, v11, :cond_7f

    .line 228
    invoke-static {v7, v15, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget-object v11, v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzc:Ljava/lang/Object;

    .line 229
    invoke-virtual {v14, v10, v1, v2, v11}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 230
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_38

    :cond_7f
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object v6, v7

    goto/16 :goto_37

    :pswitch_1f
    move-object/from16 v7, p2

    const/4 v4, 0x2

    if-ne v5, v4, :cond_80

    .line 231
    invoke-direct {v0, v10, v9, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzy(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v1

    .line 232
    invoke-direct {v0, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v2

    .line 233
    move/from16 v5, p4

    move-object v3, v7

    move v4, v15

    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzo(Ljava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v2

    .line 234
    move-object v15, v6

    move-object v6, v3

    invoke-direct {v0, v10, v9, v12, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzG(Ljava/lang/Object;IILjava/lang/Object;)V

    move v3, v2

    move v11, v4

    move/from16 v21, v12

    goto/16 :goto_38

    :cond_80
    move v4, v15

    move-object v15, v6

    move-object v6, v7

    move v11, v4

    move/from16 v21, v12

    goto/16 :goto_37

    :pswitch_20
    move/from16 p3, v11

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    move/from16 v21, v12

    const/4 v12, 0x2

    if-ne v5, v12, :cond_84

    .line 235
    invoke-static {v6, v11, v15}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v12, v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    if-nez v12, :cond_81

    .line 236
    invoke-virtual {v14, v10, v1, v2, v13}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_35

    .line 240
    :cond_81
    and-int v13, p3, v22

    move/from16 p3, v13

    add-int v13, v5, v12

    if-eqz p3, :cond_83

    .line 237
    invoke-static {v6, v5, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhe;->zzg([BII)Z

    move-result v22

    if-eqz v22, :cond_82

    goto :goto_34

    .line 4
    :cond_82
    new-instance v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 324
    invoke-direct {v1, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 325
    throw v1

    .line 237
    :cond_83
    :goto_34
    new-instance v7, Ljava/lang/String;

    .line 238
    move/from16 p3, v13

    sget-object v13, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzep;->zza:Ljava/nio/charset/Charset;

    invoke-direct {v7, v6, v5, v12, v13}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 239
    invoke-virtual {v14, v10, v1, v2, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move/from16 v5, p3

    .line 240
    :goto_35
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    goto/16 :goto_38

    .line 239
    :cond_84
    goto/16 :goto_37

    :pswitch_21
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    if-nez v5, :cond_86

    .line 241
    invoke-static {v6, v11, v15}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget-wide v12, v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    cmp-long v7, v12, v26

    if-eqz v7, :cond_85

    const/4 v12, 0x1

    goto :goto_36

    .line 243
    :cond_85
    move/from16 v12, v20

    .line 242
    :goto_36
    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v14, v10, v1, v2, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 243
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    goto/16 :goto_38

    :cond_86
    goto/16 :goto_37

    :pswitch_22
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    const/4 v7, 0x5

    if-ne v5, v7, :cond_87

    add-int/lit8 v5, v11, 0x4

    .line 244
    invoke-static {v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v14, v10, v1, v2, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 245
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    goto/16 :goto_38

    :cond_87
    goto/16 :goto_37

    :pswitch_23
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    const/4 v7, 0x1

    if-ne v5, v7, :cond_88

    add-int/lit8 v5, v11, 0x8

    .line 246
    invoke-static {v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v14, v10, v1, v2, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 247
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    goto/16 :goto_38

    :cond_88
    goto/16 :goto_37

    :pswitch_24
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    if-nez v5, :cond_89

    .line 248
    invoke-static {v6, v11, v15}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzj([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget v7, v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zza:I

    .line 249
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v14, v10, v1, v2, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 250
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    goto/16 :goto_38

    :cond_89
    goto/16 :goto_37

    :pswitch_25
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    if-nez v5, :cond_8a

    .line 251
    invoke-static {v6, v11, v15}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzm([BILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v5

    iget-wide v12, v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzb:J

    .line 252
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v14, v10, v1, v2, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 253
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    goto :goto_38

    :cond_8a
    goto :goto_37

    :pswitch_26
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    const/4 v7, 0x5

    if-ne v5, v7, :cond_8b

    add-int/lit8 v5, v11, 0x4

    .line 254
    invoke-static {v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzc([BI)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v7

    .line 255
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v14, v10, v1, v2, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 256
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    goto :goto_38

    :cond_8b
    goto :goto_37

    .line 211
    :pswitch_27
    move/from16 v21, v12

    move v11, v15

    move-object v15, v6

    move-object/from16 v6, p2

    const/4 v7, 0x1

    if-ne v5, v7, :cond_8c

    add-int/lit8 v5, v11, 0x8

    .line 257
    invoke-static {v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzq([BI)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v12

    .line 258
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v14, v10, v1, v2, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 259
    invoke-virtual {v14, v10, v3, v4, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move v3, v5

    goto :goto_38

    :cond_8c
    nop

    .line 211
    :goto_37
    move v3, v11

    :goto_38
    if-eq v3, v11, :cond_8d

    move-object v7, v6

    move v6, v8

    move v4, v9

    move-object v2, v10

    move-object v10, v15

    move/from16 v14, v19

    move/from16 v11, v20

    move/from16 v5, v21

    move/from16 v15, v23

    move-object/from16 v1, v24

    move/from16 v8, p4

    goto/16 :goto_0

    :cond_8d
    move/from16 v14, v19

    move/from16 v12, v21

    .line 5
    :goto_39
    move/from16 v11, p5

    if-ne v8, v11, :cond_8e

    if-eqz v11, :cond_8e

    move/from16 v4, p4

    move v6, v8

    move/from16 v15, v23

    goto/16 :goto_3c

    .line 342
    :cond_8e
    iget-boolean v1, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    if-eqz v1, :cond_91

    iget-object v1, v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzd:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzds;

    .line 260
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzds;->zzb:I

    .line 261
    sget v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfu;->zza:I

    sget-object v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzds;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzds;

    if-eq v1, v2, :cond_90

    iget-object v1, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzg:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    iget-object v7, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;

    iget-object v2, v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;->zzd:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzds;

    .line 264
    sget v4, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zza:I

    .line 265
    invoke-virtual {v2, v1, v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzds;->zzb(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzef;

    move-result-object v1

    if-nez v1, :cond_8f

    .line 266
    invoke-static {v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    move-result-object v5

    .line 267
    move/from16 v4, p4

    move-object v2, v6

    move v1, v8

    move-object v6, v15

    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzi(I[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v3

    goto :goto_3b

    .line 268
    :cond_8f
    move v13, v8

    move-object v5, v10

    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;

    .line 269
    invoke-virtual {v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;->zzc()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;

    .line 270
    move-object/from16 v2, p2

    move/from16 v4, p4

    move-object/from16 v8, p6

    move-object v6, v1

    move v1, v13

    invoke-static/range {v1 .. v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzb(I[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzef;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v3

    goto :goto_3b

    .line 261
    :cond_90
    move v1, v8

    goto :goto_3a

    .line 342
    :cond_91
    move v1, v8

    .line 262
    :goto_3a
    invoke-static {v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    move-result-object v5

    .line 263
    move-object/from16 v2, p2

    move/from16 v4, p4

    move-object/from16 v6, p6

    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcv;->zzi(I[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    move-result v3

    .line 267
    :goto_3b
    move-object/from16 v7, p2

    move v6, v1

    move v8, v4

    move v4, v9

    move-object v2, v10

    move v5, v12

    move/from16 v11, v20

    move/from16 v15, v23

    move-object/from16 v1, v24

    move-object/from16 v10, p6

    goto/16 :goto_0

    .line 1
    :cond_92
    move/from16 v11, p5

    move-object/from16 v24, v1

    move-object v10, v2

    move v4, v8

    move/from16 v19, v14

    move/from16 v23, v15

    .line 5
    :goto_3c
    const v13, 0xfffff

    if-eq v14, v13, :cond_93

    int-to-long v1, v14

    .line 326
    move-object/from16 v7, v24

    invoke-virtual {v7, v10, v1, v2, v15}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_93
    iget v1, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzj:I

    :goto_3d
    iget v2, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzk:I

    if-ge v1, v2, :cond_96

    iget-object v2, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzi:[I

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 327
    aget v2, v2, v1

    .line 328
    aget v5, v5, v2

    .line 329
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v5

    const v17, 0xfffff

    and-int v5, v5, v17

    int-to-long v7, v5

    .line 330
    invoke-static {v10, v7, v8}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_94

    goto :goto_3e

    .line 331
    :cond_94
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzu(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzel;

    move-result-object v7

    if-nez v7, :cond_95

    .line 332
    :goto_3e
    move-object/from16 v2, v16

    check-cast v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    add-int/lit8 v1, v1, 0x1

    goto :goto_3d

    .line 333
    :cond_95
    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;

    .line 334
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzw(I)Ljava/lang/Object;

    move-result-object v1

    .line 335
    check-cast v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzff;

    .line 336
    throw v16

    :cond_96
    nop

    .line 338
    const-string v1, "Failed to parse the message."

    if-nez v11, :cond_98

    if-ne v3, v4, :cond_97

    goto :goto_3f

    :cond_97
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 339
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 340
    throw v2

    :cond_98
    if-gt v3, v4, :cond_99

    if-ne v6, v11, :cond_99

    :goto_3f
    return v3

    :cond_99
    new-instance v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;

    .line 341
    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzer;-><init>(Ljava/lang/String;)V

    .line 342
    throw v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x12
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_16
        :pswitch_f
        :pswitch_14
        :pswitch_15
        :pswitch_e
        :pswitch_d
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_16
        :pswitch_f
        :pswitch_14
        :pswitch_15
        :pswitch_e
        :pswitch_d
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x33
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_24
        :pswitch_1d
        :pswitch_22
        :pswitch_23
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
    .end packed-switch
.end method

.method public final zze()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzg:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfm;

    check-cast v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzK()Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    move-result-object v0

    return-object v0
.end method

.method public final zzf(Ljava/lang/Object;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzL(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    .line 3
    const v2, 0x7fffffff

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzW(I)V

    iput v1, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zza:I

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzU()V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_3

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v2

    const v3, 0xfffff

    and-int/2addr v3, v2

    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result v2

    int-to-long v3, v3

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 7
    :pswitch_1
    iget-object v2, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 8
    aget v2, v2, v1

    .line 9
    invoke-direct {p0, p1, v2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 10
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v2

    sget-object v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    invoke-virtual {v5, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzf(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_2
    sget-object v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 11
    invoke-virtual {v2, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    sget-object v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 12
    move-object v6, v2

    check-cast v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;

    invoke-virtual {v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;->zzc()V

    .line 13
    invoke-virtual {v5, p1, v3, v4, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_1

    .line 6
    :pswitch_3
    invoke-static {p1, v3, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    .line 7
    invoke-interface {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->zzb()V

    goto :goto_1

    .line 14
    :pswitch_4
    invoke-direct {p0, p1, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 15
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v2

    sget-object v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    invoke-virtual {v5, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzf(Ljava/lang/Object;)V

    .line 5
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x3

    goto :goto_0

    .line 15
    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;

    .line 16
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;->zza(Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;->zza(Ljava/lang/Object;)V

    return-void

    .line 1
    :cond_4
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final zzg(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 8

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzA(Ljava/lang/Object;)V

    if-eqz p2, :cond_6

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    array-length v1, v1

    if-ge v0, v1, :cond_4

    .line 2
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v1

    const v2, 0xfffff

    and-int/2addr v2, v1

    iget-object v3, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    invoke-static {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result v1

    .line 3
    aget v3, v3, v0

    int-to-long v4, v2

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_2

    .line 12
    :pswitch_0
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzC(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 13
    :pswitch_1
    invoke-direct {p0, p2, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 14
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 15
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzE(Ljava/lang/Object;II)V

    goto/16 :goto_2

    .line 16
    :pswitch_2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzC(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 17
    :pswitch_3
    invoke-direct {p0, p2, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 18
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 19
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzE(Ljava/lang/Object;II)V

    goto/16 :goto_2

    .line 20
    :pswitch_4
    sget v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    .line 21
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 22
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfh;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 23
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_2

    .line 4
    :pswitch_5
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    .line 5
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    .line 6
    invoke-interface {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->size()I

    move-result v3

    .line 7
    invoke-interface {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->size()I

    move-result v6

    if-lez v3, :cond_1

    if-lez v6, :cond_1

    .line 8
    invoke-interface {v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->zzc()Z

    move-result v7

    if-nez v7, :cond_0

    add-int/2addr v6, v3

    .line 9
    invoke-interface {v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->zzd(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;

    move-result-object v1

    .line 10
    :cond_0
    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeo;->addAll(Ljava/util/Collection;)Z

    :cond_1
    if-gtz v3, :cond_2

    goto :goto_1

    :cond_2
    move-object v2, v1

    .line 11
    :goto_1
    invoke-static {p1, v4, v5, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_2

    .line 24
    :pswitch_6
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzB(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 25
    :pswitch_7
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 26
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v1

    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzr(Ljava/lang/Object;JJ)V

    .line 27
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 28
    :pswitch_8
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 29
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzq(Ljava/lang/Object;JI)V

    .line 30
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 31
    :pswitch_9
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 32
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v1

    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzr(Ljava/lang/Object;JJ)V

    .line 33
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 34
    :pswitch_a
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 35
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzq(Ljava/lang/Object;JI)V

    .line 36
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 37
    :pswitch_b
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 38
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzq(Ljava/lang/Object;JI)V

    .line 39
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 40
    :pswitch_c
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 41
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzq(Ljava/lang/Object;JI)V

    .line 42
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 43
    :pswitch_d
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 44
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 45
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 46
    :pswitch_e
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzB(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 47
    :pswitch_f
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 48
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 49
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 50
    :pswitch_10
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 51
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzw(Ljava/lang/Object;J)Z

    move-result v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzm(Ljava/lang/Object;JZ)V

    .line 52
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto/16 :goto_2

    .line 53
    :pswitch_11
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 54
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzq(Ljava/lang/Object;JI)V

    .line 55
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto :goto_2

    .line 56
    :pswitch_12
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 57
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v1

    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzr(Ljava/lang/Object;JJ)V

    .line 58
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto :goto_2

    .line 59
    :pswitch_13
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 60
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzq(Ljava/lang/Object;JI)V

    .line 61
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto :goto_2

    .line 62
    :pswitch_14
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 63
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v1

    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzr(Ljava/lang/Object;JJ)V

    .line 64
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto :goto_2

    .line 65
    :pswitch_15
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 66
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v1

    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzr(Ljava/lang/Object;JJ)V

    .line 67
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto :goto_2

    .line 68
    :pswitch_16
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 69
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzb(Ljava/lang/Object;J)F

    move-result v1

    invoke-static {p1, v4, v5, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzp(Ljava/lang/Object;JF)V

    .line 70
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    goto :goto_2

    .line 71
    :pswitch_17
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzI(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 72
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zza(Ljava/lang/Object;J)D

    move-result-wide v1

    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzo(Ljava/lang/Object;JD)V

    .line 73
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzD(Ljava/lang/Object;I)V

    .line 3
    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x3

    goto/16 :goto_0

    .line 73
    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzl:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;

    .line 74
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzp(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgs;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;

    .line 75
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzo(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 76
    :cond_5
    return-void

    .line 75
    :cond_6
    nop

    .line 76
    const/4 p1, 0x0

    throw p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzh(Ljava/lang/Object;[BIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc(Ljava/lang/Object;[BIIILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzcu;)I

    return-void
.end method

.method public final zzi(Ljava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;)V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v6, p2

    iget-boolean v2, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    if-eqz v2, :cond_0

    move-object v2, v1

    check-cast v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;

    iget-object v2, v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;

    iget-object v3, v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zza:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;

    .line 2
    invoke-virtual {v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgo;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 3
    invoke-virtual {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zzf()Ljava/util/Iterator;

    move-result-object v2

    .line 4
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    move-object v8, v2

    goto :goto_0

    .line 204
    :cond_0
    const/4 v3, 0x0

    const/4 v8, 0x0

    .line 4
    :goto_0
    iget-object v9, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    sget-object v10, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    const/4 v2, 0x0

    const v4, 0xfffff

    const/4 v5, 0x0

    :goto_1
    array-length v13, v9

    if-ge v2, v13, :cond_33

    .line 5
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v13

    iget-object v14, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    invoke-static {v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result v15

    .line 6
    const/16 v16, 0x0

    aget v7, v14, v2

    const/16 v12, 0x11

    const v17, 0xfffff

    const/4 v11, 0x1

    if-gt v15, v12, :cond_3

    add-int/lit8 v12, v2, 0x2

    .line 7
    aget v12, v14, v12

    and-int v14, v12, v17

    if-eq v14, v4, :cond_2

    move/from16 v4, v17

    if-ne v14, v4, :cond_1

    const/4 v5, 0x0

    goto :goto_2

    .line 199
    :cond_1
    int-to-long v4, v14

    .line 8
    invoke-virtual {v10, v1, v4, v5}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move v5, v4

    .line 7
    :goto_2
    move v4, v14

    :cond_2
    ushr-int/lit8 v12, v12, 0x14

    shl-int v12, v11, v12

    move/from16 v18, v12

    move-object v12, v3

    move v3, v4

    move v4, v5

    move/from16 v5, v18

    goto :goto_3

    .line 8
    :cond_3
    move-object v12, v3

    move v3, v4

    move v4, v5

    const/4 v5, 0x0

    .line 7
    :goto_3
    if-eqz v12, :cond_5

    .line 9
    invoke-interface {v12}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzee;

    iget v14, v14, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzee;->zza:I

    if-gt v14, v7, :cond_5

    iget-object v14, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;

    .line 10
    invoke-virtual {v14, v6, v12}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;->zzb(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Ljava/util/Map$Entry;)V

    .line 11
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    goto :goto_3

    :cond_4
    move-object/from16 v12, v16

    goto :goto_3

    :cond_5
    const v17, 0xfffff

    and-int v13, v13, v17

    int-to-long v13, v13

    packed-switch v15, :pswitch_data_0

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 120
    :pswitch_0
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 121
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v11

    .line 122
    invoke-interface {v6, v7, v5, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzq(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 120
    :cond_6
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 123
    :pswitch_1
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 124
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzD(IJ)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 123
    :cond_7
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 125
    :pswitch_2
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 126
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzB(II)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 125
    :cond_8
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 127
    :pswitch_3
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 128
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzz(IJ)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 127
    :cond_9
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 129
    :pswitch_4
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 130
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzx(II)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 129
    :cond_a
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 131
    :pswitch_5
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 132
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzi(II)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 131
    :cond_b
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 133
    :pswitch_6
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 134
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzI(II)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 133
    :cond_c
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 135
    :pswitch_7
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 136
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzd(ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 135
    :cond_d
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 137
    :pswitch_8
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 138
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 139
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v11

    invoke-interface {v6, v7, v5, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzv(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 137
    :cond_e
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 140
    :pswitch_9
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 141
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v7, v5, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzO(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 140
    :cond_f
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 142
    :pswitch_a
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 143
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzN(Ljava/lang/Object;J)Z

    move-result v5

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzb(IZ)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 142
    :cond_10
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 144
    :pswitch_b
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 145
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzk(II)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 144
    :cond_11
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 146
    :pswitch_c
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_12

    .line 147
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzm(IJ)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 146
    :cond_12
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 148
    :pswitch_d
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 149
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzo(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzr(II)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 148
    :cond_13
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 150
    :pswitch_e
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 151
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzK(IJ)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 150
    :cond_14
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 152
    :pswitch_f
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 153
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzt(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzt(IJ)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 152
    :cond_15
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 154
    :pswitch_10
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 155
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzn(Ljava/lang/Object;J)F

    move-result v5

    invoke-interface {v6, v7, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzo(IF)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 154
    :cond_16
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 156
    :pswitch_11
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 157
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzm(Ljava/lang/Object;J)D

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzf(ID)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 156
    :cond_17
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 158
    :pswitch_12
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_18

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 205
    :cond_18
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzw(I)Ljava/lang/Object;

    move-result-object v1

    .line 206
    check-cast v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzff;

    .line 207
    throw v16

    .line 112
    :pswitch_13
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 113
    aget v5, v5, v2

    .line 114
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 115
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v11

    .line 116
    sget v13, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    if-eqz v7, :cond_1b

    .line 117
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_1a

    const/4 v13, 0x0

    .line 118
    :goto_4
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v14

    if-ge v13, v14, :cond_19

    .line 119
    invoke-interface {v7, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    move-object v15, v6

    check-cast v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdo;

    invoke-virtual {v15, v5, v14, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdo;->zzq(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)V

    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    .line 118
    :cond_19
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 117
    :cond_1a
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 116
    :cond_1b
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 109
    :pswitch_14
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 110
    aget v5, v5, v2

    .line 111
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 112
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzB(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 106
    :pswitch_15
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 107
    aget v5, v5, v2

    .line 108
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 109
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzA(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 103
    :pswitch_16
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 104
    aget v5, v5, v2

    .line 105
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 106
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzz(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 100
    :pswitch_17
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 101
    aget v5, v5, v2

    .line 102
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 103
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzy(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 97
    :pswitch_18
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 98
    aget v5, v5, v2

    .line 99
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 100
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzs(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 94
    :pswitch_19
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 95
    aget v5, v5, v2

    .line 96
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 97
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzC(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 91
    :pswitch_1a
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 92
    aget v5, v5, v2

    .line 93
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 94
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzq(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 88
    :pswitch_1b
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 89
    aget v5, v5, v2

    .line 90
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 91
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzt(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 85
    :pswitch_1c
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 86
    aget v5, v5, v2

    .line 87
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 88
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzu(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 82
    :pswitch_1d
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 83
    aget v5, v5, v2

    .line 84
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 85
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzw(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 79
    :pswitch_1e
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 80
    aget v5, v5, v2

    .line 81
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 82
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzD(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 76
    :pswitch_1f
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 77
    aget v5, v5, v2

    .line 78
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 79
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzx(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 73
    :pswitch_20
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 74
    aget v5, v5, v2

    .line 75
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 76
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzv(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 70
    :pswitch_21
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 71
    aget v5, v5, v2

    .line 72
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 73
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzr(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 67
    :pswitch_22
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 68
    aget v5, v5, v2

    .line 69
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 70
    const/4 v11, 0x0

    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzB(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 64
    :pswitch_23
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 65
    aget v5, v5, v2

    .line 66
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 67
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzA(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 61
    :pswitch_24
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 62
    aget v5, v5, v2

    .line 63
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 64
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzz(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 58
    :pswitch_25
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 59
    aget v5, v5, v2

    .line 60
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 61
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzy(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 55
    :pswitch_26
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 56
    aget v5, v5, v2

    .line 57
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 58
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzs(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 52
    :pswitch_27
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 53
    aget v5, v5, v2

    .line 54
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 55
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzC(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 47
    :pswitch_28
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 48
    aget v5, v5, v2

    .line 49
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 50
    sget v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    if-eqz v7, :cond_1d

    .line 51
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_1c

    .line 52
    invoke-interface {v6, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zze(ILjava/util/List;)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 51
    :cond_1c
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 50
    :cond_1d
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 40
    :pswitch_29
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 41
    aget v5, v5, v2

    .line 42
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 43
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v11

    .line 44
    sget v13, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    if-eqz v7, :cond_20

    .line 45
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_1f

    const/4 v13, 0x0

    .line 46
    :goto_5
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v14

    if-ge v13, v14, :cond_1e

    .line 47
    invoke-interface {v7, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    move-object v15, v6

    check-cast v15, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdo;

    invoke-virtual {v15, v5, v14, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdo;->zzv(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)V

    add-int/lit8 v13, v13, 0x1

    goto :goto_5

    .line 46
    :cond_1e
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 45
    :cond_1f
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 44
    :cond_20
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 35
    :pswitch_2a
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 36
    aget v5, v5, v2

    .line 37
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 38
    sget v11, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zza:I

    if-eqz v7, :cond_22

    .line 39
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_21

    .line 40
    invoke-interface {v6, v5, v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzH(ILjava/util/List;)V

    const/4 v11, 0x0

    goto/16 :goto_6

    .line 39
    :cond_21
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 38
    :cond_22
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 32
    :pswitch_2b
    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 33
    aget v5, v5, v2

    .line 34
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 35
    const/4 v11, 0x0

    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzq(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 29
    :pswitch_2c
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 30
    aget v5, v5, v2

    .line 31
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 32
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzt(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 26
    :pswitch_2d
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 27
    aget v5, v5, v2

    .line 28
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 29
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzu(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 23
    :pswitch_2e
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 24
    aget v5, v5, v2

    .line 25
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 26
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzw(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 20
    :pswitch_2f
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 21
    aget v5, v5, v2

    .line 22
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 23
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzD(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 17
    :pswitch_30
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 18
    aget v5, v5, v2

    .line 19
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 20
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzx(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 14
    :pswitch_31
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 15
    aget v5, v5, v2

    .line 16
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 17
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzv(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 11
    :pswitch_32
    const/4 v11, 0x0

    iget-object v5, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    .line 12
    aget v5, v5, v2

    .line 13
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 14
    invoke-static {v5, v7, v6, v11}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzr(ILjava/util/List;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Z)V

    goto/16 :goto_6

    .line 159
    :pswitch_33
    const/4 v11, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 160
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v13

    .line 161
    invoke-interface {v6, v7, v5, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzq(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)V

    goto/16 :goto_6

    .line 162
    :pswitch_34
    const/4 v11, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 163
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzD(IJ)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 162
    :cond_23
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 164
    :pswitch_35
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_24

    .line 165
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzB(II)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 164
    :cond_24
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 166
    :pswitch_36
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_25

    .line 167
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzz(IJ)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 166
    :cond_25
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 168
    :pswitch_37
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_26

    .line 169
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzx(II)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 168
    :cond_26
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 170
    :pswitch_38
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_27

    .line 171
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzi(II)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 170
    :cond_27
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 172
    :pswitch_39
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_28

    .line 173
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzI(II)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 172
    :cond_28
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 174
    :pswitch_3a
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_29

    .line 175
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;

    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzd(ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdf;)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 174
    :cond_29
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 176
    :pswitch_3b
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 177
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 178
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v13

    invoke-interface {v6, v7, v5, v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzv(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)V

    goto/16 :goto_6

    .line 179
    :pswitch_3c
    const/4 v11, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 180
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v7, v0, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzO(ILjava/lang/Object;Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 179
    :cond_2a
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 181
    :pswitch_3d
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2b

    .line 182
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzw(Ljava/lang/Object;J)Z

    move-result v0

    .line 183
    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzb(IZ)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 181
    :cond_2b
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 184
    :pswitch_3e
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 185
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzk(II)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 184
    :cond_2c
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 186
    :pswitch_3f
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 187
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzm(IJ)V

    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 186
    :cond_2d
    move-object/from16 v0, p0

    goto/16 :goto_6

    .line 188
    :pswitch_40
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 189
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzr(II)V

    move-object/from16 v0, p0

    goto :goto_6

    .line 188
    :cond_2e
    move-object/from16 v0, p0

    goto :goto_6

    .line 190
    :pswitch_41
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 191
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzK(IJ)V

    move-object/from16 v0, p0

    goto :goto_6

    .line 190
    :cond_2f
    move-object/from16 v0, p0

    goto :goto_6

    .line 192
    :pswitch_42
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_30

    .line 193
    invoke-virtual {v10, v1, v13, v14}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v13

    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzt(IJ)V

    move-object/from16 v0, p0

    goto :goto_6

    .line 192
    :cond_30
    move-object/from16 v0, p0

    goto :goto_6

    .line 194
    :pswitch_43
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 195
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzb(Ljava/lang/Object;J)F

    move-result v0

    .line 196
    invoke-interface {v6, v7, v0}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzo(IF)V

    move-object/from16 v0, p0

    goto :goto_6

    .line 194
    :cond_31
    move-object/from16 v0, p0

    goto :goto_6

    .line 197
    :pswitch_44
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 198
    invoke-static {v1, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zza(Ljava/lang/Object;J)D

    move-result-wide v13

    .line 199
    invoke-interface {v6, v7, v13, v14}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;->zzf(ID)V

    .line 11
    :cond_32
    :goto_6
    add-int/lit8 v2, v2, 0x3

    move v5, v4

    move v4, v3

    move-object v3, v12

    goto/16 :goto_1

    .line 4
    :cond_33
    const/16 v16, 0x0

    .line 8
    :goto_7
    if-eqz v3, :cond_35

    iget-object v2, v0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzm:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;

    .line 200
    invoke-virtual {v2, v6, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdt;->zzb(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;Ljava/util/Map$Entry;)V

    .line 201
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_34

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/util/Map$Entry;

    goto :goto_7

    :cond_34
    move-object/from16 v3, v16

    goto :goto_7

    .line 202
    :cond_35
    check-cast v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    iget-object v1, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    .line 203
    move-object v2, v1

    check-cast v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    .line 204
    invoke-virtual {v1, v6}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;->zzl(Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzhh;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzj(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    array-length v2, v2

    if-ge v1, v2, :cond_2

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v2

    const v3, 0xfffff

    and-int v4, v2, v3

    invoke-static {v2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result v2

    int-to-long v4, v4

    packed-switch v2, :pswitch_data_0

    goto/16 :goto_3

    .line 2
    :pswitch_0
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzp(I)I

    move-result v2

    and-int/2addr v2, v3

    int-to-long v2, v2

    .line 3
    invoke-static {p1, v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v6

    .line 4
    invoke-static {p2, v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    if-ne v6, v2, :cond_0

    .line 5
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 6
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_2

    .line 7
    :pswitch_1
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 8
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    goto :goto_1

    .line 9
    :pswitch_2
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 10
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    .line 8
    :goto_1
    if-nez v2, :cond_1

    goto/16 :goto_2

    .line 11
    :pswitch_3
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 12
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 13
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_3

    .line 14
    :pswitch_4
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 15
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    goto/16 :goto_3

    .line 16
    :pswitch_5
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 17
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v3

    if-ne v2, v3, :cond_0

    goto/16 :goto_3

    .line 18
    :pswitch_6
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 19
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    goto/16 :goto_3

    .line 20
    :pswitch_7
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 21
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v3

    if-ne v2, v3, :cond_0

    goto/16 :goto_3

    .line 22
    :pswitch_8
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 23
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v3

    if-ne v2, v3, :cond_0

    goto/16 :goto_3

    .line 24
    :pswitch_9
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 25
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v3

    if-ne v2, v3, :cond_0

    goto/16 :goto_3

    .line 26
    :pswitch_a
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 27
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 28
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_3

    .line 29
    :pswitch_b
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 30
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 31
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_3

    .line 32
    :pswitch_c
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 33
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 34
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgg;->zzE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_3

    .line 35
    :pswitch_d
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 36
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzw(Ljava/lang/Object;J)Z

    move-result v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzw(Ljava/lang/Object;J)Z

    move-result v3

    if-ne v2, v3, :cond_0

    goto/16 :goto_3

    .line 37
    :pswitch_e
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 38
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v3

    if-ne v2, v3, :cond_0

    goto/16 :goto_3

    .line 39
    :pswitch_f
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 40
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    goto/16 :goto_3

    .line 41
    :pswitch_10
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 42
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzc(Ljava/lang/Object;J)I

    move-result v3

    if-ne v2, v3, :cond_0

    goto :goto_3

    .line 43
    :pswitch_11
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 44
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    goto :goto_3

    .line 45
    :pswitch_12
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 46
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v2

    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzd(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    goto :goto_3

    .line 47
    :pswitch_13
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 48
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzb(Ljava/lang/Object;J)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    .line 49
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzb(Ljava/lang/Object;J)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-ne v2, v3, :cond_0

    goto :goto_3

    .line 50
    :pswitch_14
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzH(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 51
    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zza(Ljava/lang/Object;J)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 52
    invoke-static {p2, v4, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zza(Ljava/lang/Object;J)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    goto :goto_3

    .line 6
    :cond_0
    :goto_2
    return v0

    .line 1
    :cond_1
    :goto_3
    add-int/lit8 v1, v1, 0x3

    goto/16 :goto_0

    .line 53
    :cond_2
    move-object v1, p1

    check-cast v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    iget-object v1, v1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    .line 54
    move-object v2, p2

    check-cast v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;

    iget-object v2, v2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzeh;->zzc:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgt;

    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    :cond_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    if-eqz v0, :cond_4

    .line 56
    check-cast p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;

    iget-object p1, p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;

    .line 57
    check-cast p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;

    iget-object p2, p2, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;

    .line 58
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_4
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final zzk(Ljava/lang/Object;)Z
    .locals 14

    .line 1
    const/4 v0, 0x0

    const v1, 0xfffff

    move v2, v0

    move v4, v2

    move v3, v1

    :goto_0
    iget v5, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzj:I

    const/4 v6, 0x1

    if-ge v2, v5, :cond_7

    iget-object v5, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzi:[I

    iget-object v7, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    aget v10, v5, v2

    .line 2
    aget v5, v7, v10

    .line 3
    invoke-direct {p0, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzs(I)I

    move-result v7

    iget-object v8, p0, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzc:[I

    add-int/lit8 v9, v10, 0x2

    .line 4
    aget v8, v8, v9

    and-int v9, v8, v1

    ushr-int/lit8 v8, v8, 0x14

    shl-int v13, v6, v8

    if-eq v9, v3, :cond_1

    if-eq v9, v1, :cond_0

    int-to-long v3, v9

    sget-object v6, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzb:Lsun/misc/Unsafe;

    .line 5
    invoke-virtual {v6, p1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move v12, v4

    move v11, v9

    goto :goto_1

    .line 19
    :cond_0
    move v12, v4

    move v11, v9

    goto :goto_1

    .line 4
    :cond_1
    move v11, v3

    move v12, v4

    .line 5
    :goto_1
    const/high16 v3, 0x10000000

    and-int/2addr v3, v7

    if-eqz v3, :cond_3

    .line 6
    move-object v8, p0

    move-object v9, p1

    invoke-direct/range {v8 .. v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_2

    .line 19
    :cond_2
    return v0

    .line 5
    :cond_3
    move-object v8, p0

    move-object v9, p1

    .line 6
    :goto_2
    invoke-static {v7}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzr(I)I

    move-result p1

    sparse-switch p1, :sswitch_data_0

    goto :goto_4

    .line 16
    :sswitch_0
    invoke-direct {p0, v9, v5, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzM(Ljava/lang/Object;II)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 17
    invoke-direct {p0, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object p1

    invoke-static {v9, v7, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzK(Ljava/lang/Object;ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)Z

    move-result p1

    if-nez p1, :cond_6

    return v0

    .line 12
    :sswitch_1
    and-int p1, v7, v1

    int-to-long v3, p1

    .line 13
    invoke-static {v9, v3, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    .line 14
    check-cast p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfg;

    .line 15
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_4

    .line 20
    :cond_4
    invoke-direct {p0, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzw(I)Ljava/lang/Object;

    move-result-object p1

    .line 21
    check-cast p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzff;

    .line 22
    const/4 p1, 0x0

    throw p1

    .line 6
    :sswitch_2
    and-int p1, v7, v1

    int-to-long v3, p1

    .line 7
    invoke-static {v9, v3, v4}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzgz;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 8
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6

    .line 9
    invoke-direct {p0, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object v3

    move v4, v0

    .line 10
    :goto_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_6

    .line 11
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 12
    invoke-interface {v3, v5}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;->zzk(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    return v0

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 18
    :sswitch_3
    invoke-direct/range {v8 .. v13}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzJ(Ljava/lang/Object;IIII)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 19
    invoke-direct {p0, v10}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzv(I)Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;

    move-result-object p1

    invoke-static {v9, v7, p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzK(Ljava/lang/Object;ILcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzge;)Z

    move-result p1

    if-nez p1, :cond_6

    return v0

    .line 6
    :cond_6
    :goto_4
    add-int/lit8 v2, v2, 0x1

    move-object p1, v9

    move v3, v11

    move v4, v12

    goto/16 :goto_0

    .line 19
    :cond_7
    move-object v8, p0

    move-object v9, p1

    iget-boolean p1, v8, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzfp;->zzh:Z

    if-eqz p1, :cond_8

    .line 23
    move-object p1, v9

    check-cast p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;

    iget-object p1, p1, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzed;->zzb:Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;

    .line 24
    invoke-virtual {p1}, Lcom/google/android/gms/internal/mlkit_vision_barcode_bundled/zzdx;->zzk()Z

    move-result p1

    if-nez p1, :cond_8

    return v0

    :cond_8
    return v6

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_3
        0x11 -> :sswitch_3
        0x1b -> :sswitch_2
        0x31 -> :sswitch_2
        0x32 -> :sswitch_1
        0x3c -> :sswitch_0
        0x44 -> :sswitch_0
    .end sparse-switch
.end method
