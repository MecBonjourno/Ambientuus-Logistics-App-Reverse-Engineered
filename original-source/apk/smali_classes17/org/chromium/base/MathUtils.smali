.class public Lorg/chromium/base/MathUtils;
.super Ljava/lang/Object;
.source "MathUtils.java"


# static fields
.field public static final EPSILON:F = 0.001f


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static areFloatsEqual(FF)Z
    .locals 2
    .param p0, "f1"    # F
    .param p1, "f2"    # F

    .line 169
    sub-float v0, p0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3a83126f    # 0.001f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static clamp(FFF)F
    .locals 3
    .param p0, "value"    # F
    .param p1, "a"    # F
    .param p2, "b"    # F

    .line 69
    cmpl-float v0, p1, p2

    if-lez v0, :cond_0

    move v0, p2

    goto :goto_0

    :cond_0
    move v0, p1

    .line 70
    .local v0, "min":F
    :goto_0
    cmpl-float v1, p1, p2

    if-lez v1, :cond_1

    move v1, p1

    goto :goto_1

    :cond_1
    move v1, p2

    .line 71
    .local v1, "max":F
    :goto_1
    cmpg-float v2, p0, v0

    if-gez v2, :cond_2

    .line 72
    move p0, v0

    goto :goto_2

    .line 73
    :cond_2
    cmpl-float v2, p0, v1

    if-lez v2, :cond_3

    .line 74
    move p0, v1

    .line 76
    :cond_3
    :goto_2
    return p0
.end method

.method public static clamp(III)I
    .locals 2
    .param p0, "value"    # I
    .param p1, "a"    # I
    .param p2, "b"    # I

    .line 27
    if-le p1, p2, :cond_0

    move v0, p2

    goto :goto_0

    :cond_0
    move v0, p1

    .line 28
    .local v0, "min":I
    :goto_0
    if-le p1, p2, :cond_1

    move v1, p1

    goto :goto_1

    :cond_1
    move v1, p2

    .line 29
    .local v1, "max":I
    :goto_1
    if-ge p0, v0, :cond_2

    .line 30
    move p0, v0

    goto :goto_2

    .line 31
    :cond_2
    if-le p0, v1, :cond_3

    .line 32
    move p0, v1

    .line 34
    :cond_3
    :goto_2
    return p0
.end method

.method public static clamp(JJJ)J
    .locals 5
    .param p0, "value"    # J
    .param p2, "a"    # J
    .param p4, "b"    # J

    .line 48
    cmp-long v0, p2, p4

    if-lez v0, :cond_0

    move-wide v0, p4

    goto :goto_0

    :cond_0
    move-wide v0, p2

    .line 49
    .local v0, "min":J
    :goto_0
    cmp-long v2, p2, p4

    if-lez v2, :cond_1

    move-wide v2, p2

    goto :goto_1

    :cond_1
    move-wide v2, p4

    .line 50
    .local v2, "max":J
    :goto_1
    cmp-long v4, p0, v0

    if-gez v4, :cond_2

    .line 51
    move-wide p0, v0

    goto :goto_2

    .line 52
    :cond_2
    cmp-long v4, p0, v2

    if-lez v4, :cond_3

    .line 53
    move-wide p0, v2

    .line 55
    :cond_3
    :goto_2
    return-wide p0
.end method

.method public static compareLongs(JJ)I
    .locals 1
    .param p0, "lhs"    # J
    .param p2, "rhs"    # J

    .line 159
    cmp-long v0, p0, p2

    if-gez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    cmp-long v0, p0, p2

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public static distance(FFFF)F
    .locals 4
    .param p0, "x1"    # F
    .param p1, "y1"    # F
    .param p2, "x2"    # F
    .param p3, "y2"    # F

    .line 181
    sub-float v0, p2, p0

    .line 182
    .local v0, "xDist":F
    sub-float v1, p3, p1

    .line 183
    .local v1, "yDist":F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v2, v2

    return v2
.end method

.method public static flipSignIf(FZ)F
    .locals 1
    .param p0, "value"    # F
    .param p1, "flipSign"    # Z

    .line 150
    if-eqz p1, :cond_0

    neg-float v0, p0

    goto :goto_0

    :cond_0
    move v0, p0

    :goto_0
    return v0
.end method

.method public static flipSignIf(IZ)I
    .locals 1
    .param p0, "value"    # I
    .param p1, "flipSign"    # Z

    .line 139
    if-eqz p1, :cond_0

    neg-int v0, p0

    goto :goto_0

    :cond_0
    move v0, p0

    :goto_0
    return v0
.end method

.method public static interpolate(FFF)F
    .locals 1
    .param p0, "value"    # F
    .param p1, "target"    # F
    .param p2, "speed"    # F

    .line 97
    sub-float v0, p1, p0

    mul-float/2addr v0, p2

    add-float/2addr v0, p0

    return v0
.end method

.method public static map(FFFFF)F
    .locals 3
    .param p0, "value"    # F
    .param p1, "fromStart"    # F
    .param p2, "fromStop"    # F
    .param p3, "toStart"    # F
    .param p4, "toStop"    # F

    .line 199
    sub-float v0, p4, p3

    sub-float v1, p0, p1

    sub-float v2, p2, p1

    div-float/2addr v1, v2

    mul-float/2addr v0, v1

    add-float/2addr v0, p3

    return v0
.end method

.method public static positiveModulo(II)I
    .locals 2
    .param p0, "a"    # I
    .param p1, "b"    # I

    .line 84
    rem-int v0, p0, p1

    .line 85
    .local v0, "mod":I
    if-ltz v0, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    add-int v1, v0, p1

    :goto_0
    return v1
.end method

.method public static roundTwoDecimalPlaces(D)D
    .locals 4
    .param p0, "value"    # D

    .line 209
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    mul-double v2, p0, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-double v2, v2

    div-double/2addr v2, v0

    return-wide v2
.end method

.method public static scaleToFitTargetSize([III)F
    .locals 5
    .param p0, "dimensions"    # [I
    .param p1, "targetWidth"    # I
    .param p2, "targetHeight"    # I

    .line 119
    array-length v0, p0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    const/4 v0, 0x0

    aget v1, p0, v0

    if-lez v1, :cond_0

    const/4 v1, 0x1

    aget v2, p0, v1

    if-lez v2, :cond_0

    .line 124
    int-to-float v2, p1

    aget v3, p0, v0

    int-to-float v3, v3

    div-float/2addr v2, v3

    int-to-float v3, p2

    aget v4, p0, v1

    int-to-float v4, v4

    div-float/2addr v3, v4

    .line 125
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 126
    .local v2, "scale":F
    aget v3, p0, v0

    int-to-float v3, v3

    mul-float/2addr v3, v2

    float-to-int v3, v3

    aput v3, p0, v0

    .line 127
    aget v0, p0, v1

    int-to-float v0, v0

    mul-float/2addr v0, v2

    float-to-int v0, v0

    aput v0, p0, v1

    .line 128
    return v2

    .line 120
    .end local v2    # "scale":F
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expected dimensions to have length >= 2 && dimensions[0] > 0 && dimensions[1] > 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static smoothstep(F)F
    .locals 3
    .param p0, "t"    # F

    .line 106
    mul-float v0, p0, p0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v1, p0

    const/high16 v2, 0x40400000    # 3.0f

    sub-float/2addr v2, v1

    mul-float/2addr v0, v2

    return v0
.end method
