.class public Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;,
        Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$Builder;
    }
.end annotation


# instance fields
.field private final zza:Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;

.field private final zzb:F


# direct methods
.method synthetic constructor <init>(Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;FLcom/google/mlkit/vision/barcode/zzb;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zza:Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;

    iput p2, p0, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zzb:F

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .line 1
    nop

    .end local p0    # "this":Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;
    .end local p1    # "o":Ljava/lang/Object;
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;

    iget-object v1, p0, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zza:Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;

    .line 2
    iget-object v3, p1, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zza:Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;

    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zzb:F

    iget p1, p1, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zzb:F

    cmpl-float p1, v1, p1

    if-nez p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 4

    .line 1
    nop

    .end local p0    # "this":Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;
    iget-object v0, p0, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zza:Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;

    iget v1, p0, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zzb:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Lcom/google/android/gms/common/internal/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final zza()F
    .locals 1

    iget v0, p0, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zzb:F

    return v0
.end method

.method public final zzb()Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;
    .locals 1

    iget-object v0, p0, Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions;->zza:Lcom/google/mlkit/vision/barcode/ZoomSuggestionOptions$ZoomCallback;

    return-object v0
.end method
