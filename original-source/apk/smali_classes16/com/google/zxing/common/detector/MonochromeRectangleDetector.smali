.class public final Lcom/google/zxing/common/detector/MonochromeRectangleDetector;
.super Ljava/lang/Object;
.source "MonochromeRectangleDetector.java"


# static fields
.field private static final MAX_MODULES:I = 0x20


# instance fields
.field private final image:Lcom/google/zxing/common/BitMatrix;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 0
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    .line 38
    return-void
.end method

.method private blackWhiteRange(IIIIZ)[I
    .locals 7
    .param p1, "fixedDimension"    # I
    .param p2, "maxWhiteRun"    # I
    .param p3, "minDim"    # I
    .param p4, "maxDim"    # I
    .param p5, "horizontal"    # Z

    .line 170
    add-int v0, p3, p4

    const/4 v1, 0x2

    div-int/2addr v0, v1

    .line 173
    .local v0, "center":I
    move v2, v0

    .line 174
    .local v2, "start":I
    :goto_0
    if-lt v2, p3, :cond_7

    .line 175
    iget-object v3, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    if-eqz p5, :cond_0

    invoke-virtual {v3, v2, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_0
    invoke-virtual {v3, p1, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 176
    :goto_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 178
    :cond_1
    move v3, v2

    .line 180
    .local v3, "whiteRunStart":I
    :cond_2
    add-int/lit8 v2, v2, -0x1

    .line 181
    if-lt v2, p3, :cond_4

    iget-object v4, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    if-eqz p5, :cond_3

    invoke-virtual {v4, v2, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_2

    .line 182
    :cond_3
    invoke-virtual {v4, p1, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 183
    :cond_4
    :goto_2
    sub-int v4, v3, v2

    .line 184
    .local v4, "whiteRunSize":I
    if-lt v2, p3, :cond_6

    if-le v4, p2, :cond_5

    goto :goto_3

    .line 188
    .end local v3    # "whiteRunStart":I
    .end local v4    # "whiteRunSize":I
    :cond_5
    goto :goto_0

    .line 185
    .restart local v3    # "whiteRunStart":I
    .restart local v4    # "whiteRunSize":I
    :cond_6
    :goto_3
    move v2, v3

    .line 186
    nop

    .line 190
    .end local v3    # "whiteRunStart":I
    .end local v4    # "whiteRunSize":I
    :cond_7
    const/4 v3, 0x1

    add-int/2addr v2, v3

    .line 193
    move v4, v0

    .line 194
    .local v4, "end":I
    :goto_4
    if-ge v4, p4, :cond_f

    .line 195
    iget-object v5, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    if-eqz p5, :cond_8

    invoke-virtual {v5, v4, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_9

    goto :goto_5

    :cond_8
    invoke-virtual {v5, p1, v4}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 196
    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 198
    :cond_9
    move v5, v4

    .line 200
    .local v5, "whiteRunStart":I
    :cond_a
    add-int/2addr v4, v3

    .line 201
    if-ge v4, p4, :cond_c

    iget-object v6, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    if-eqz p5, :cond_b

    invoke-virtual {v6, v4, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_a

    goto :goto_6

    .line 202
    :cond_b
    invoke-virtual {v6, p1, v4}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 203
    :cond_c
    :goto_6
    sub-int v6, v4, v5

    .line 204
    .local v6, "whiteRunSize":I
    if-ge v4, p4, :cond_e

    if-le v6, p2, :cond_d

    goto :goto_7

    .line 208
    .end local v5    # "whiteRunStart":I
    .end local v6    # "whiteRunSize":I
    :cond_d
    goto :goto_4

    .line 205
    .restart local v5    # "whiteRunStart":I
    .restart local v6    # "whiteRunSize":I
    :cond_e
    :goto_7
    move v4, v5

    .line 206
    nop

    .line 210
    .end local v5    # "whiteRunStart":I
    .end local v6    # "whiteRunSize":I
    :cond_f
    add-int/lit8 v4, v4, -0x1

    .line 212
    if-le v4, v2, :cond_10

    new-array v1, v1, [I

    const/4 v5, 0x0

    aput v2, v1, v5

    aput v4, v1, v3

    goto :goto_8

    :cond_10
    const/4 v1, 0x0

    :goto_8
    return-object v1
.end method

.method private findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;
    .locals 11
    .param p1, "centerX"    # I
    .param p2, "deltaX"    # I
    .param p3, "left"    # I
    .param p4, "right"    # I
    .param p5, "centerY"    # I
    .param p6, "deltaY"    # I
    .param p7, "top"    # I
    .param p8, "bottom"    # I
    .param p9, "maxWhiteRun"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 109
    move/from16 v0, p5

    const/4 v1, 0x0

    .line 110
    .local v1, "lastRange":[I
    move/from16 v2, p5

    .local v2, "y":I
    move v3, p1

    move v8, v3

    move v3, v2

    .line 111
    .end local v2    # "y":I
    .local v3, "y":I
    .local v8, "x":I
    :goto_0
    move/from16 v9, p8

    if-ge v3, v9, :cond_a

    move/from16 v10, p7

    if-lt v3, v10, :cond_a

    if-ge v8, p4, :cond_a

    if-lt v8, p3, :cond_a

    .line 114
    if-nez p2, :cond_0

    .line 116
    const/4 v7, 0x1

    move-object v2, p0

    move v5, p3

    move v6, p4

    move/from16 v4, p9

    invoke-direct/range {v2 .. v7}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->blackWhiteRange(IIIIZ)[I

    move-result-object v7

    move v5, v8

    .local v7, "range":[I
    goto :goto_1

    .line 119
    .end local v7    # "range":[I
    :cond_0
    const/4 v9, 0x0

    move-object v4, p0

    move/from16 v6, p9

    move v5, v8

    move v7, v10

    move/from16 v8, p8

    .end local v8    # "x":I
    .local v5, "x":I
    invoke-direct/range {v4 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->blackWhiteRange(IIIIZ)[I

    move-result-object v2

    move-object v7, v2

    .line 121
    .restart local v7    # "range":[I
    :goto_1
    if-nez v7, :cond_9

    .line 122
    if-eqz v1, :cond_8

    .line 126
    const/4 v2, 0x1

    const/4 v4, 0x0

    if-nez p2, :cond_4

    .line 127
    sub-int v6, v3, p6

    .line 128
    .local v6, "lastY":I
    aget v8, v1, v4

    if-ge v8, p1, :cond_3

    .line 129
    aget v8, v1, v2

    if-le v8, p1, :cond_2

    .line 131
    new-instance v8, Lcom/google/zxing/ResultPoint;

    if-lez p6, :cond_1

    aget v2, v1, v4

    goto :goto_2

    :cond_1
    aget v2, v1, v2

    :goto_2
    int-to-float v2, v2

    int-to-float v4, v6

    invoke-direct {v8, v2, v4}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v8

    .line 133
    :cond_2
    new-instance v2, Lcom/google/zxing/ResultPoint;

    aget v4, v1, v4

    int-to-float v4, v4

    int-to-float v8, v6

    invoke-direct {v2, v4, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v2

    .line 135
    :cond_3
    new-instance v4, Lcom/google/zxing/ResultPoint;

    aget v2, v1, v2

    int-to-float v2, v2

    int-to-float v8, v6

    invoke-direct {v4, v2, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v4

    .line 138
    .end local v6    # "lastY":I
    :cond_4
    sub-int v8, v5, p2

    .line 139
    .local v8, "lastX":I
    aget v6, v1, v4

    if-ge v6, v0, :cond_7

    .line 140
    aget v6, v1, v2

    if-le v6, v0, :cond_6

    .line 141
    new-instance v6, Lcom/google/zxing/ResultPoint;

    int-to-float v9, v8

    if-gez p2, :cond_5

    aget v2, v1, v4

    goto :goto_3

    :cond_5
    aget v2, v1, v2

    :goto_3
    int-to-float v2, v2

    invoke-direct {v6, v9, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v6

    .line 143
    :cond_6
    new-instance v2, Lcom/google/zxing/ResultPoint;

    int-to-float v6, v8

    aget v4, v1, v4

    int-to-float v4, v4

    invoke-direct {v2, v6, v4}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v2

    .line 145
    :cond_7
    new-instance v4, Lcom/google/zxing/ResultPoint;

    int-to-float v6, v8

    aget v2, v1, v2

    int-to-float v2, v2

    invoke-direct {v4, v6, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v4

    .line 123
    .end local v8    # "lastX":I
    :cond_8
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 149
    :cond_9
    move-object v1, v7

    .line 112
    .end local v7    # "range":[I
    add-int v3, v3, p6

    add-int v8, v5, p2

    .end local v5    # "x":I
    .local v8, "x":I
    goto/16 :goto_0

    .line 111
    :cond_a
    move v5, v8

    .line 151
    .end local v3    # "y":I
    .end local v8    # "x":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method


# virtual methods
.method public detect()[Lcom/google/zxing/ResultPoint;
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 51
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v10

    .line 52
    .local v10, "height":I
    iget-object v1, v0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v11

    .line 53
    .local v11, "width":I
    div-int/lit8 v5, v10, 0x2

    .line 54
    .local v5, "halfHeight":I
    div-int/lit8 v1, v11, 0x2

    .line 55
    .local v1, "halfWidth":I
    div-int/lit16 v2, v10, 0x100

    const/4 v12, 0x1

    invoke-static {v12, v2}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 56
    .local v13, "deltaY":I
    div-int/lit16 v2, v11, 0x100

    invoke-static {v12, v2}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 58
    .local v14, "deltaX":I
    const/4 v7, 0x0

    .line 59
    .local v7, "top":I
    move v8, v10

    .line 60
    .local v8, "bottom":I
    const/4 v3, 0x0

    .line 61
    .local v3, "left":I
    move v4, v11

    .line 62
    .local v4, "right":I
    neg-int v6, v13

    div-int/lit8 v9, v1, 0x2

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v15

    .line 64
    .local v15, "pointA":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v15}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v7, v0, -0x1

    .line 65
    neg-int v2, v14

    div-int/lit8 v9, v5, 0x2

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v16

    .line 67
    .local v16, "pointB":Lcom/google/zxing/ResultPoint;
    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v3, v0, -0x1

    .line 68
    div-int/lit8 v9, v5, 0x2

    move-object/from16 v0, p0

    move v2, v14

    .end local v14    # "deltaX":I
    .local v2, "deltaX":I
    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v14

    .line 70
    move/from16 v17, v2

    .end local v2    # "deltaX":I
    .local v14, "pointC":Lcom/google/zxing/ResultPoint;
    .local v17, "deltaX":I
    invoke-virtual {v14}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v4, v0, 0x1

    .line 71
    div-int/lit8 v9, v1, 0x2

    const/4 v2, 0x0

    move-object/from16 v0, p0

    move v6, v13

    .end local v13    # "deltaY":I
    .local v6, "deltaY":I
    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v13

    .line 73
    move v0, v6

    .end local v6    # "deltaY":I
    .local v0, "deltaY":I
    .local v13, "pointD":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v13}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    float-to-int v2, v2

    add-int/lit8 v8, v2, 0x1

    .line 76
    neg-int v6, v0

    div-int/lit8 v9, v1, 0x4

    const/4 v2, 0x0

    move/from16 v18, v0

    move-object/from16 v0, p0

    .end local v0    # "deltaY":I
    .local v18, "deltaY":I
    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v2

    .line 79
    .end local v15    # "pointA":Lcom/google/zxing/ResultPoint;
    .local v2, "pointA":Lcom/google/zxing/ResultPoint;
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    const/4 v6, 0x0

    aput-object v2, v0, v6

    aput-object v16, v0, v12

    const/4 v6, 0x2

    aput-object v14, v0, v6

    const/4 v6, 0x3

    aput-object v13, v0, v6

    return-object v0
.end method
