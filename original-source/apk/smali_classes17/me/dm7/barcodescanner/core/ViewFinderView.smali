.class public Lme/dm7/barcodescanner/core/ViewFinderView;
.super Landroid/view/View;
.source "ViewFinderView.java"


# static fields
.field private static final ANIMATION_DELAY:J = 0x50L

.field private static final LANDSCAPE_HEIGHT_RATIO:F = 0.625f

.field private static final LANDSCAPE_MAX_FRAME_HEIGHT:I = 0x2a3

.field private static final LANDSCAPE_MAX_FRAME_WIDTH:I = 0x4b0

.field private static final LANDSCAPE_WIDTH_RATIO:F = 0.625f

.field private static final MIN_FRAME_HEIGHT:I = 0xf0

.field private static final MIN_FRAME_WIDTH:I = 0xf0

.field private static final POINT_SIZE:I = 0xa

.field private static final PORTRAIT_HEIGHT_RATIO:F = 0.375f

.field private static final PORTRAIT_MAX_FRAME_HEIGHT:I = 0x2d0

.field private static final PORTRAIT_MAX_FRAME_WIDTH:I = 0x3b1

.field private static final PORTRAIT_WIDTH_RATIO:F = 0.875f

.field private static final SCANNER_ALPHA:[I

.field private static final TAG:Ljava/lang/String; = "ViewFinderView"


# instance fields
.field private mFramingRect:Landroid/graphics/Rect;

.field private scannerAlpha:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lme/dm7/barcodescanner/core/ViewFinderView;->SCANNER_ALPHA:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x40
        0x80
        0xc0
        0xff
        0xc0
        0x80
        0x40
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 37
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 41
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    return-void
.end method

.method private static findDesiredDimensionInRange(FIII)I
    .locals 1
    .param p0, "ratio"    # F
    .param p1, "resolution"    # I
    .param p2, "hardMin"    # I
    .param p3, "hardMax"    # I

    .line 145
    int-to-float v0, p1

    mul-float/2addr v0, p0

    float-to-int v0, v0

    .line 146
    .local v0, "dim":I
    if-ge v0, p2, :cond_0

    .line 147
    return p2

    .line 149
    :cond_0
    if-le v0, p3, :cond_1

    .line 150
    return p3

    .line 152
    :cond_1
    return v0
.end method


# virtual methods
.method public drawLaser(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 100
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    move-object v7, v1

    .line 101
    .local v7, "paint":Landroid/graphics/Paint;
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 103
    .local v8, "resources":Landroid/content/res/Resources;
    sget v1, Lme/dm7/barcodescanner/core/R$color;->viewfinder_laser:I

    invoke-virtual {v8, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 104
    sget-object v1, Lme/dm7/barcodescanner/core/ViewFinderView;->SCANNER_ALPHA:[I

    iget v2, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->scannerAlpha:I

    aget v1, v1, v2

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 105
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 106
    iget v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->scannerAlpha:I

    add-int/lit8 v1, v1, 0x1

    sget-object v2, Lme/dm7/barcodescanner/core/ViewFinderView;->SCANNER_ALPHA:[I

    array-length v2, v2

    rem-int/2addr v1, v2

    iput v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->scannerAlpha:I

    .line 107
    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int v9, v1, v2

    .line 108
    .local v9, "middle":I
    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    add-int/lit8 v1, v1, 0x2

    int-to-float v3, v1

    add-int/lit8 v1, v9, -0x1

    int-to-float v4, v1

    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    add-int/lit8 v1, v1, -0x1

    int-to-float v5, v1

    add-int/lit8 v1, v9, 0x2

    int-to-float v6, v1

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 110
    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    add-int/lit8 v3, v1, -0xa

    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    add-int/lit8 v4, v1, -0xa

    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    add-int/lit8 v5, v1, 0xa

    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v6, v1, 0xa

    const-wide/16 v1, 0x50

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lme/dm7/barcodescanner/core/ViewFinderView;->postInvalidateDelayed(JIIII)V

    .line 115
    return-void
.end method

.method public drawViewFinderBorder(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 79
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    move-object v6, v0

    .line 80
    .local v6, "paint":Landroid/graphics/Paint;
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 81
    .local v0, "resources":Landroid/content/res/Resources;
    sget v1, Lme/dm7/barcodescanner/core/R$color;->viewfinder_border:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 83
    sget v1, Lme/dm7/barcodescanner/core/R$integer;->viewfinder_border_width:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 84
    sget v1, Lme/dm7/barcodescanner/core/R$integer;->viewfinder_border_length:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    .line 86
    .local v7, "lineLength":I
    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    add-int/lit8 v1, v1, -0x1

    int-to-float v2, v1

    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    add-int/lit8 v1, v1, -0x1

    int-to-float v3, v1

    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    add-int/lit8 v1, v1, -0x1

    int-to-float v4, v1

    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    add-int/lit8 v1, v1, -0x1

    add-int/2addr v1, v7

    int-to-float v5, v1

    move-object v1, p1

    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 87
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v2, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v3, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    add-int/lit8 p1, p1, -0x1

    add-int/2addr p1, v7

    int-to-float v4, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 89
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v2, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v3, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v4, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    sub-int/2addr p1, v7

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 90
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v2, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v3, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    add-int/lit8 p1, p1, -0x1

    add-int/2addr p1, v7

    int-to-float v4, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 92
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v2, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v3, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v4, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    add-int/lit8 p1, p1, -0x1

    add-int/2addr p1, v7

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 93
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v2, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v3, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    sub-int/2addr p1, v7

    int-to-float v4, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    add-int/lit8 p1, p1, -0x1

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 95
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v2, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v3, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v4, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    sub-int/2addr p1, v7

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 96
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v2, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v3, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    sub-int/2addr p1, v7

    int-to-float v4, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 97
    return-void
.end method

.method public drawViewFinderMask(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 65
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    move-object v6, v0

    .line 66
    .local v6, "paint":Landroid/graphics/Paint;
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 67
    .local v0, "resources":Landroid/content/res/Resources;
    sget v1, Lme/dm7/barcodescanner/core/R$color;->viewfinder_mask:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 69
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    .line 70
    .local v7, "width":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v8

    .line 72
    .local v8, "height":I
    int-to-float v4, v7

    iget-object v1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v5, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 73
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    int-to-float v4, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 74
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v2, p1

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, p1

    int-to-float v4, v7

    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v5, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 75
    iget-object p1, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 p1, p1, 0x1

    int-to-float v3, p1

    int-to-float v4, v7

    int-to-float v5, v8

    const/4 v2, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 76
    return-void
.end method

.method public getFramingRect()Landroid/graphics/Rect;
    .locals 1

    .line 50
    iget-object v0, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 55
    iget-object v0, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 56
    return-void

    .line 59
    :cond_0
    invoke-virtual {p0, p1}, Lme/dm7/barcodescanner/core/ViewFinderView;->drawViewFinderMask(Landroid/graphics/Canvas;)V

    .line 60
    invoke-virtual {p0, p1}, Lme/dm7/barcodescanner/core/ViewFinderView;->drawViewFinderBorder(Landroid/graphics/Canvas;)V

    .line 61
    invoke-virtual {p0, p1}, Lme/dm7/barcodescanner/core/ViewFinderView;->drawLaser(Landroid/graphics/Canvas;)V

    .line 62
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "xNew"    # I
    .param p2, "yNew"    # I
    .param p3, "xOld"    # I
    .param p4, "yOld"    # I

    .line 119
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->updateFramingRect()V

    .line 120
    return-void
.end method

.method public setupViewFinder()V
    .locals 0

    .line 45
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->updateFramingRect()V

    .line 46
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->invalidate()V

    .line 47
    return-void
.end method

.method public declared-synchronized updateFramingRect()V
    .locals 9

    monitor-enter p0

    .line 123
    :try_start_0
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 124
    .local v0, "viewResolution":Landroid/graphics/Point;
    nop

    .line 129
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/ViewFinderView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lme/dm7/barcodescanner/core/DisplayUtils;->getScreenOrientation(Landroid/content/Context;)I

    move-result v1

    .line 131
    .local v1, "orientation":I
    const/4 v2, 0x1

    const/16 v3, 0xf0

    if-eq v1, v2, :cond_0

    .line 132
    iget v2, v0, Landroid/graphics/Point;->x:I

    const/16 v4, 0x4b0

    const/high16 v5, 0x3f200000    # 0.625f

    invoke-static {v5, v2, v3, v4}, Lme/dm7/barcodescanner/core/ViewFinderView;->findDesiredDimensionInRange(FIII)I

    move-result v2

    .line 133
    .local v2, "width":I
    iget v4, v0, Landroid/graphics/Point;->y:I

    const/16 v6, 0x2a3

    invoke-static {v5, v4, v3, v6}, Lme/dm7/barcodescanner/core/ViewFinderView;->findDesiredDimensionInRange(FIII)I

    move-result v3

    .local v3, "height":I
    goto :goto_0

    .line 135
    .end local v2    # "width":I
    .end local v3    # "height":I
    .end local p0    # "this":Lme/dm7/barcodescanner/core/ViewFinderView;
    :cond_0
    iget v2, v0, Landroid/graphics/Point;->x:I

    const/16 v4, 0x3b1

    const/high16 v5, 0x3f600000    # 0.875f

    invoke-static {v5, v2, v3, v4}, Lme/dm7/barcodescanner/core/ViewFinderView;->findDesiredDimensionInRange(FIII)I

    move-result v2

    .line 136
    .restart local v2    # "width":I
    iget v4, v0, Landroid/graphics/Point;->y:I

    const/16 v5, 0x2d0

    const/high16 v6, 0x3ec00000    # 0.375f

    invoke-static {v6, v4, v3, v5}, Lme/dm7/barcodescanner/core/ViewFinderView;->findDesiredDimensionInRange(FIII)I

    move-result v3

    .line 139
    .restart local v3    # "height":I
    :goto_0
    iget v4, v0, Landroid/graphics/Point;->x:I

    sub-int/2addr v4, v2

    div-int/lit8 v4, v4, 0x2

    .line 140
    .local v4, "leftOffset":I
    iget v5, v0, Landroid/graphics/Point;->y:I

    sub-int/2addr v5, v3

    div-int/lit8 v5, v5, 0x2

    .line 141
    .local v5, "topOffset":I
    new-instance v6, Landroid/graphics/Rect;

    add-int v7, v4, v2

    add-int v8, v5, v3

    invoke-direct {v6, v4, v5, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v6, p0, Lme/dm7/barcodescanner/core/ViewFinderView;->mFramingRect:Landroid/graphics/Rect;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    monitor-exit p0

    return-void

    .line 122
    .end local v0    # "viewResolution":Landroid/graphics/Point;
    .end local v1    # "orientation":I
    .end local v2    # "width":I
    .end local v3    # "height":I
    .end local v4    # "leftOffset":I
    .end local v5    # "topOffset":I
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
