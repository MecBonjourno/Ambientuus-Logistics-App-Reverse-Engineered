.class public Lcom/coleta/ambientuus/views/OverlayView;
.super Landroid/view/View;
.source "OverlayView.java"


# instance fields
.field private animator:Landroid/animation/ValueAnimator;

.field private final cornerPaint:Landroid/graphics/Paint;

.field private final laserPaint:Landroid/graphics/Paint;

.field private laserY:F


# direct methods
.method public static synthetic $r8$lambda$1ZY3mHFfikOkvo-rBL1A7wogd84(Lcom/coleta/ambientuus/views/OverlayView;Landroid/animation/ValueAnimator;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/views/OverlayView;->lambda$startAnimation$0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    .line 27
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    sget v1, Lcom/coleta/ambientuus/R$color;->verde_ambietuus:I

    invoke-static {p1, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 28
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 29
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 30
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 33
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->laserPaint:Landroid/graphics/Paint;

    .line 34
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->laserPaint:Landroid/graphics/Paint;

    const/high16 v2, -0x10000

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 35
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->laserPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 36
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->laserPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 37
    return-void
.end method

.method private synthetic lambda$startAnimation$0(Landroid/animation/ValueAnimator;)V
    .locals 7
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .line 61
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 62
    .local v0, "progress":F
    invoke-virtual {p0}, Lcom/coleta/ambientuus/views/OverlayView;->getHeight()I

    move-result v1

    .line 63
    .local v1, "height":I
    invoke-virtual {p0}, Lcom/coleta/ambientuus/views/OverlayView;->getWidth()I

    move-result v2

    int-to-double v2, v2

    const-wide v4, 0x3fe6666666666666L    # 0.7

    mul-double/2addr v2, v4

    double-to-int v2, v2

    .line 64
    .local v2, "rectSize":I
    sub-int v3, v1, v2

    div-int/lit8 v3, v3, 0x2

    .line 65
    .local v3, "top":I
    add-int v4, v3, v2

    .line 66
    .local v4, "bottom":I
    int-to-float v5, v3

    sub-int v6, v4, v3

    int-to-float v6, v6

    mul-float/2addr v6, v0

    add-float/2addr v5, v6

    iput v5, p0, Lcom/coleta/ambientuus/views/OverlayView;->laserY:F

    .line 67
    invoke-virtual {p0}, Lcom/coleta/ambientuus/views/OverlayView;->invalidate()V

    .line 68
    return-void
.end method

.method private startAnimation()V
    .locals 4

    .line 52
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 54
    :cond_0
    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    .line 55
    iget-object v1, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 56
    iget-object v1, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 57
    iget-object v1, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 58
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 60
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/coleta/ambientuus/views/OverlayView$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/views/OverlayView$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/views/OverlayView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 70
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 71
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private stopAnimation()V
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/coleta/ambientuus/views/OverlayView;->animator:Landroid/animation/ValueAnimator;

    .line 78
    :cond_0
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 0

    .line 41
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 42
    invoke-direct {p0}, Lcom/coleta/ambientuus/views/OverlayView;->startAnimation()V

    .line 43
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 47
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 48
    invoke-direct {p0}, Lcom/coleta/ambientuus/views/OverlayView;->stopAnimation()V

    .line 49
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 21
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 82
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 84
    invoke-virtual {v0}, Lcom/coleta/ambientuus/views/OverlayView;->getWidth()I

    move-result v1

    .line 85
    .local v1, "width":I
    invoke-virtual {v0}, Lcom/coleta/ambientuus/views/OverlayView;->getHeight()I

    move-result v2

    .line 86
    .local v2, "height":I
    int-to-double v3, v1

    const-wide v5, 0x3fe6666666666666L    # 0.7

    mul-double/2addr v3, v5

    double-to-int v3, v3

    .line 87
    .local v3, "rectSize":I
    sub-int v4, v1, v3

    div-int/lit8 v4, v4, 0x2

    .line 88
    .local v4, "left":I
    sub-int v5, v2, v3

    div-int/lit8 v5, v5, 0x2

    .line 89
    .local v5, "top":I
    add-int v6, v4, v3

    .line 90
    .local v6, "right":I
    add-int v7, v5, v3

    .line 92
    .local v7, "bottom":I
    div-int/lit8 v8, v3, 0x6

    .line 96
    .local v8, "cornerLength":I
    int-to-float v10, v4

    int-to-float v11, v5

    add-int v9, v4, v8

    int-to-float v12, v9

    int-to-float v13, v5

    iget-object v14, v0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    move-object/from16 v9, p1

    invoke-virtual/range {v9 .. v14}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 97
    int-to-float v9, v4

    int-to-float v10, v5

    int-to-float v11, v4

    add-int v12, v5, v8

    int-to-float v12, v12

    iget-object v13, v0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    move-object/from16 v15, p1

    move/from16 v16, v9

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v12

    move-object/from16 v20, v13

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 100
    int-to-float v9, v6

    int-to-float v10, v5

    sub-int v11, v6, v8

    int-to-float v11, v11

    int-to-float v12, v5

    iget-object v13, v0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    move/from16 v16, v9

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v12

    move-object/from16 v20, v13

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 101
    int-to-float v9, v6

    int-to-float v10, v5

    int-to-float v11, v6

    add-int v12, v5, v8

    int-to-float v12, v12

    iget-object v13, v0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    move/from16 v16, v9

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v12

    move-object/from16 v20, v13

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 104
    int-to-float v9, v4

    int-to-float v10, v7

    add-int v11, v4, v8

    int-to-float v11, v11

    int-to-float v12, v7

    iget-object v13, v0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    move/from16 v16, v9

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v12

    move-object/from16 v20, v13

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 105
    int-to-float v9, v4

    int-to-float v10, v7

    int-to-float v11, v4

    sub-int v12, v7, v8

    int-to-float v12, v12

    iget-object v13, v0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    move/from16 v16, v9

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v12

    move-object/from16 v20, v13

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 108
    int-to-float v9, v6

    int-to-float v10, v7

    sub-int v11, v6, v8

    int-to-float v11, v11

    int-to-float v12, v7

    iget-object v13, v0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    move/from16 v16, v9

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v12

    move-object/from16 v20, v13

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 109
    int-to-float v9, v6

    int-to-float v10, v7

    int-to-float v11, v6

    sub-int v12, v7, v8

    int-to-float v12, v12

    iget-object v13, v0, Lcom/coleta/ambientuus/views/OverlayView;->cornerPaint:Landroid/graphics/Paint;

    move/from16 v16, v9

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v12

    move-object/from16 v20, v13

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 112
    int-to-float v9, v4

    iget v10, v0, Lcom/coleta/ambientuus/views/OverlayView;->laserY:F

    int-to-float v11, v6

    iget v12, v0, Lcom/coleta/ambientuus/views/OverlayView;->laserY:F

    iget-object v13, v0, Lcom/coleta/ambientuus/views/OverlayView;->laserPaint:Landroid/graphics/Paint;

    move/from16 v16, v9

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v12

    move-object/from16 v20, v13

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 113
    return-void
.end method
