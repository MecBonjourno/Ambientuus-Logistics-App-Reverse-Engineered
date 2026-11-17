.class public Lcom/google/android/flexbox/FlexboxLayout;
.super Landroid/view/ViewGroup;
.source "FlexboxLayout.java"

# interfaces
.implements Lcom/google/android/flexbox/FlexContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;,
        Lcom/google/android/flexbox/FlexboxLayout$DividerMode;
    }
.end annotation


# static fields
.field public static final SHOW_DIVIDER_BEGINNING:I = 0x1

.field public static final SHOW_DIVIDER_END:I = 0x4

.field public static final SHOW_DIVIDER_MIDDLE:I = 0x2

.field public static final SHOW_DIVIDER_NONE:I


# instance fields
.field private mAlignContent:I

.field private mAlignItems:I

.field private mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

.field private mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

.field private mDividerHorizontalHeight:I

.field private mDividerVerticalWidth:I

.field private mFlexDirection:I

.field private mFlexLines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/flexbox/FlexLine;",
            ">;"
        }
    .end annotation
.end field

.field private mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

.field private mFlexWrap:I

.field private mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

.field private mJustifyContent:I

.field private mMaxLine:I

.field private mOrderCache:Landroid/util/SparseIntArray;

.field private mReorderedIndices:[I

.field private mShowDividerHorizontal:I

.field private mShowDividerVertical:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 209
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/flexbox/FlexboxLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 210
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs"
        }
    .end annotation

    .line 213
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/flexbox/FlexboxLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 214
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs",
            "defStyleAttr"
        }
    .end annotation

    .line 217
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 122
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mMaxLine:I

    .line 198
    new-instance v1, Lcom/google/android/flexbox/FlexboxHelper;

    invoke-direct {v1, p0}, Lcom/google/android/flexbox/FlexboxHelper;-><init>(Lcom/google/android/flexbox/FlexContainer;)V

    iput-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 200
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    .line 206
    new-instance v1, Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    invoke-direct {v1}, Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;-><init>()V

    iput-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    .line 219
    sget-object v1, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 221
    .local v1, "a":Landroid/content/res/TypedArray;
    sget v3, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_flexDirection:I

    .line 222
    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    .line 223
    sget v3, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_flexWrap:I

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    .line 224
    sget v3, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_justifyContent:I

    .line 225
    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lcom/google/android/flexbox/FlexboxLayout;->mJustifyContent:I

    .line 226
    sget v3, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_alignItems:I

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignItems:I

    .line 227
    sget v3, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_alignContent:I

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignContent:I

    .line 228
    sget v3, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_maxLine:I

    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mMaxLine:I

    .line 229
    sget v0, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_dividerDrawable:I

    invoke-virtual {v1, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 230
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 231
    invoke-virtual {p0, v0}, Lcom/google/android/flexbox/FlexboxLayout;->setDividerDrawableHorizontal(Landroid/graphics/drawable/Drawable;)V

    .line 232
    invoke-virtual {p0, v0}, Lcom/google/android/flexbox/FlexboxLayout;->setDividerDrawableVertical(Landroid/graphics/drawable/Drawable;)V

    .line 234
    :cond_0
    sget v3, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_dividerDrawableHorizontal:I

    .line 235
    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 236
    .local v3, "drawableHorizontal":Landroid/graphics/drawable/Drawable;
    if-eqz v3, :cond_1

    .line 237
    invoke-virtual {p0, v3}, Lcom/google/android/flexbox/FlexboxLayout;->setDividerDrawableHorizontal(Landroid/graphics/drawable/Drawable;)V

    .line 239
    :cond_1
    sget v4, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_dividerDrawableVertical:I

    .line 240
    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 241
    .local v4, "drawableVertical":Landroid/graphics/drawable/Drawable;
    if-eqz v4, :cond_2

    .line 242
    invoke-virtual {p0, v4}, Lcom/google/android/flexbox/FlexboxLayout;->setDividerDrawableVertical(Landroid/graphics/drawable/Drawable;)V

    .line 244
    :cond_2
    sget v5, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_showDivider:I

    invoke-virtual {v1, v5, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    .line 245
    .local v5, "dividerMode":I
    if-eqz v5, :cond_3

    .line 246
    iput v5, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    .line 247
    iput v5, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    .line 249
    :cond_3
    sget v6, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_showDividerVertical:I

    .line 250
    invoke-virtual {v1, v6, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    .line 251
    .local v6, "dividerModeVertical":I
    if-eqz v6, :cond_4

    .line 252
    iput v6, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    .line 254
    :cond_4
    sget v7, Lcom/google/android/flexbox/R$styleable;->FlexboxLayout_showDividerHorizontal:I

    .line 255
    invoke-virtual {v1, v7, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 256
    .local v2, "dividerModeHorizontal":I
    if-eqz v2, :cond_5

    .line 257
    iput v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    .line 259
    :cond_5
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 260
    return-void
.end method

.method private allFlexLinesAreDummyBefore(I)Z
    .locals 2
    .param p1, "flexLineIndex"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flexLineIndex"
        }
    .end annotation

    .line 1532
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_1

    .line 1533
    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/flexbox/FlexLine;

    invoke-virtual {v1}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v1

    if-lez v1, :cond_0

    .line 1534
    const/4 v1, 0x0

    return v1

    .line 1532
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1537
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private allViewsAreGoneBefore(II)Z
    .locals 4
    .param p1, "index"    # I
    .param p2, "indexInFlexLine"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "indexInFlexLine"
        }
    .end annotation

    .line 1497
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-gt v0, p2, :cond_1

    .line 1498
    sub-int v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/google/android/flexbox/FlexboxLayout;->getReorderedChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1499
    .local v1, "view":Landroid/view/View;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    .line 1500
    const/4 v2, 0x0

    return v2

    .line 1497
    .end local v1    # "view":Landroid/view/View;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1503
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private drawDividersHorizontal(Landroid/graphics/Canvas;ZZ)V
    .locals 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "isRtl"    # Z
    .param p3, "fromBottomToTop"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "canvas",
            "isRtl",
            "fromBottomToTop"
        }
    .end annotation

    .line 960
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingLeft()I

    move-result v0

    .line 961
    .local v0, "paddingLeft":I
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingRight()I

    move-result v1

    .line 962
    .local v1, "paddingRight":I
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getWidth()I

    move-result v2

    sub-int/2addr v2, v1

    sub-int/2addr v2, v0

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 963
    .local v2, "horizontalDividerLength":I
    const/4 v3, 0x0

    .local v3, "i":I
    iget-object v4, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "size":I
    :goto_0
    if-ge v3, v4, :cond_a

    .line 964
    iget-object v5, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/flexbox/FlexLine;

    .line 965
    .local v5, "flexLine":Lcom/google/android/flexbox/FlexLine;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    iget v7, v5, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    if-ge v6, v7, :cond_5

    .line 966
    iget v7, v5, Lcom/google/android/flexbox/FlexLine;->mFirstIndex:I

    add-int/2addr v7, v6

    .line 967
    .local v7, "viewIndex":I
    invoke-virtual {p0, v7}, Lcom/google/android/flexbox/FlexboxLayout;->getReorderedChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 968
    .local v8, "view":Landroid/view/View;
    if-eqz v8, :cond_4

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_0

    .line 969
    goto :goto_4

    .line 971
    :cond_0
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    .line 974
    .local v9, "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    invoke-direct {p0, v7, v6}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeChildAtAlongMainAxis(II)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 976
    if-eqz p2, :cond_1

    .line 977
    invoke-virtual {v8}, Landroid/view/View;->getRight()I

    move-result v10

    iget v11, v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->rightMargin:I

    add-int/2addr v10, v11

    .local v10, "dividerLeft":I
    goto :goto_2

    .line 979
    .end local v10    # "dividerLeft":I
    :cond_1
    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v10

    iget v11, v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->leftMargin:I

    sub-int/2addr v10, v11

    iget v11, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    sub-int/2addr v10, v11

    .line 982
    .restart local v10    # "dividerLeft":I
    :goto_2
    iget v11, v5, Lcom/google/android/flexbox/FlexLine;->mTop:I

    iget v12, v5, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    invoke-direct {p0, p1, v10, v11, v12}, Lcom/google/android/flexbox/FlexboxLayout;->drawVerticalDivider(Landroid/graphics/Canvas;III)V

    .line 986
    .end local v10    # "dividerLeft":I
    :cond_2
    iget v10, v5, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    add-int/lit8 v10, v10, -0x1

    if-ne v6, v10, :cond_4

    .line 987
    iget v10, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/lit8 v10, v10, 0x4

    if-lez v10, :cond_4

    .line 989
    if-eqz p2, :cond_3

    .line 990
    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v10

    iget v11, v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->leftMargin:I

    sub-int/2addr v10, v11

    iget v11, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    sub-int/2addr v10, v11

    .restart local v10    # "dividerLeft":I
    goto :goto_3

    .line 992
    .end local v10    # "dividerLeft":I
    :cond_3
    invoke-virtual {v8}, Landroid/view/View;->getRight()I

    move-result v10

    iget v11, v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->rightMargin:I

    add-int/2addr v10, v11

    .line 995
    .restart local v10    # "dividerLeft":I
    :goto_3
    iget v11, v5, Lcom/google/android/flexbox/FlexLine;->mTop:I

    iget v12, v5, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    invoke-direct {p0, p1, v10, v11, v12}, Lcom/google/android/flexbox/FlexboxLayout;->drawVerticalDivider(Landroid/graphics/Canvas;III)V

    .line 965
    .end local v7    # "viewIndex":I
    .end local v8    # "view":Landroid/view/View;
    .end local v9    # "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    .end local v10    # "dividerLeft":I
    :cond_4
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1002
    .end local v6    # "j":I
    :cond_5
    invoke-direct {p0, v3}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeFlexLine(I)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1004
    if-eqz p3, :cond_6

    .line 1005
    iget v6, v5, Lcom/google/android/flexbox/FlexLine;->mBottom:I

    .local v6, "horizontalDividerTop":I
    goto :goto_5

    .line 1007
    .end local v6    # "horizontalDividerTop":I
    :cond_6
    iget v6, v5, Lcom/google/android/flexbox/FlexLine;->mTop:I

    iget v7, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    sub-int/2addr v6, v7

    .line 1009
    .restart local v6    # "horizontalDividerTop":I
    :goto_5
    invoke-direct {p0, p1, v0, v6, v2}, Lcom/google/android/flexbox/FlexboxLayout;->drawHorizontalDivider(Landroid/graphics/Canvas;III)V

    .line 1013
    .end local v6    # "horizontalDividerTop":I
    :cond_7
    invoke-direct {p0, v3}, Lcom/google/android/flexbox/FlexboxLayout;->hasEndDividerAfterFlexLine(I)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 1014
    iget v6, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/lit8 v6, v6, 0x4

    if-lez v6, :cond_9

    .line 1016
    if-eqz p3, :cond_8

    .line 1017
    iget v6, v5, Lcom/google/android/flexbox/FlexLine;->mTop:I

    iget v7, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    sub-int/2addr v6, v7

    .restart local v6    # "horizontalDividerTop":I
    goto :goto_6

    .line 1019
    .end local v6    # "horizontalDividerTop":I
    :cond_8
    iget v6, v5, Lcom/google/android/flexbox/FlexLine;->mBottom:I

    .line 1021
    .restart local v6    # "horizontalDividerTop":I
    :goto_6
    invoke-direct {p0, p1, v0, v6, v2}, Lcom/google/android/flexbox/FlexboxLayout;->drawHorizontalDivider(Landroid/graphics/Canvas;III)V

    .line 963
    .end local v5    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .end local v6    # "horizontalDividerTop":I
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 1026
    .end local v3    # "i":I
    .end local v4    # "size":I
    :cond_a
    return-void
.end method

.method private drawDividersVertical(Landroid/graphics/Canvas;ZZ)V
    .locals 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "isRtl"    # Z
    .param p3, "fromBottomToTop"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "canvas",
            "isRtl",
            "fromBottomToTop"
        }
    .end annotation

    .line 1040
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingTop()I

    move-result v0

    .line 1041
    .local v0, "paddingTop":I
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingBottom()I

    move-result v1

    .line 1042
    .local v1, "paddingBottom":I
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getHeight()I

    move-result v2

    sub-int/2addr v2, v1

    sub-int/2addr v2, v0

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1043
    .local v2, "verticalDividerLength":I
    const/4 v3, 0x0

    .local v3, "i":I
    iget-object v4, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "size":I
    :goto_0
    if-ge v3, v4, :cond_a

    .line 1044
    iget-object v5, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/flexbox/FlexLine;

    .line 1047
    .local v5, "flexLine":Lcom/google/android/flexbox/FlexLine;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    iget v7, v5, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    if-ge v6, v7, :cond_5

    .line 1048
    iget v7, v5, Lcom/google/android/flexbox/FlexLine;->mFirstIndex:I

    add-int/2addr v7, v6

    .line 1049
    .local v7, "viewIndex":I
    invoke-virtual {p0, v7}, Lcom/google/android/flexbox/FlexboxLayout;->getReorderedChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 1050
    .local v8, "view":Landroid/view/View;
    if-eqz v8, :cond_4

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_0

    .line 1051
    goto :goto_4

    .line 1053
    :cond_0
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    .line 1056
    .local v9, "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    invoke-direct {p0, v7, v6}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeChildAtAlongMainAxis(II)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 1058
    if-eqz p3, :cond_1

    .line 1059
    invoke-virtual {v8}, Landroid/view/View;->getBottom()I

    move-result v10

    iget v11, v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v10, v11

    .local v10, "dividerTop":I
    goto :goto_2

    .line 1061
    .end local v10    # "dividerTop":I
    :cond_1
    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v10

    iget v11, v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->topMargin:I

    sub-int/2addr v10, v11

    iget v11, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    sub-int/2addr v10, v11

    .line 1064
    .restart local v10    # "dividerTop":I
    :goto_2
    iget v11, v5, Lcom/google/android/flexbox/FlexLine;->mLeft:I

    iget v12, v5, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    invoke-direct {p0, p1, v11, v10, v12}, Lcom/google/android/flexbox/FlexboxLayout;->drawHorizontalDivider(Landroid/graphics/Canvas;III)V

    .line 1068
    .end local v10    # "dividerTop":I
    :cond_2
    iget v10, v5, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    add-int/lit8 v10, v10, -0x1

    if-ne v6, v10, :cond_4

    .line 1069
    iget v10, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/lit8 v10, v10, 0x4

    if-lez v10, :cond_4

    .line 1071
    if-eqz p3, :cond_3

    .line 1072
    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v10

    iget v11, v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->topMargin:I

    sub-int/2addr v10, v11

    iget v11, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    sub-int/2addr v10, v11

    .restart local v10    # "dividerTop":I
    goto :goto_3

    .line 1074
    .end local v10    # "dividerTop":I
    :cond_3
    invoke-virtual {v8}, Landroid/view/View;->getBottom()I

    move-result v10

    iget v11, v9, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v10, v11

    .line 1077
    .restart local v10    # "dividerTop":I
    :goto_3
    iget v11, v5, Lcom/google/android/flexbox/FlexLine;->mLeft:I

    iget v12, v5, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    invoke-direct {p0, p1, v11, v10, v12}, Lcom/google/android/flexbox/FlexboxLayout;->drawHorizontalDivider(Landroid/graphics/Canvas;III)V

    .line 1047
    .end local v7    # "viewIndex":I
    .end local v8    # "view":Landroid/view/View;
    .end local v9    # "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    .end local v10    # "dividerTop":I
    :cond_4
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1084
    .end local v6    # "j":I
    :cond_5
    invoke-direct {p0, v3}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeFlexLine(I)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1086
    if-eqz p2, :cond_6

    .line 1087
    iget v6, v5, Lcom/google/android/flexbox/FlexLine;->mRight:I

    .local v6, "verticalDividerLeft":I
    goto :goto_5

    .line 1089
    .end local v6    # "verticalDividerLeft":I
    :cond_6
    iget v6, v5, Lcom/google/android/flexbox/FlexLine;->mLeft:I

    iget v7, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    sub-int/2addr v6, v7

    .line 1091
    .restart local v6    # "verticalDividerLeft":I
    :goto_5
    invoke-direct {p0, p1, v6, v0, v2}, Lcom/google/android/flexbox/FlexboxLayout;->drawVerticalDivider(Landroid/graphics/Canvas;III)V

    .line 1094
    .end local v6    # "verticalDividerLeft":I
    :cond_7
    invoke-direct {p0, v3}, Lcom/google/android/flexbox/FlexboxLayout;->hasEndDividerAfterFlexLine(I)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 1095
    iget v6, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/lit8 v6, v6, 0x4

    if-lez v6, :cond_9

    .line 1097
    if-eqz p2, :cond_8

    .line 1098
    iget v6, v5, Lcom/google/android/flexbox/FlexLine;->mLeft:I

    iget v7, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    sub-int/2addr v6, v7

    .restart local v6    # "verticalDividerLeft":I
    goto :goto_6

    .line 1100
    .end local v6    # "verticalDividerLeft":I
    :cond_8
    iget v6, v5, Lcom/google/android/flexbox/FlexLine;->mRight:I

    .line 1102
    .restart local v6    # "verticalDividerLeft":I
    :goto_6
    invoke-direct {p0, p1, v6, v0, v2}, Lcom/google/android/flexbox/FlexboxLayout;->drawVerticalDivider(Landroid/graphics/Canvas;III)V

    .line 1043
    .end local v5    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .end local v6    # "verticalDividerLeft":I
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 1107
    .end local v3    # "i":I
    .end local v4    # "size":I
    :cond_a
    return-void
.end method

.method private drawHorizontalDivider(Landroid/graphics/Canvas;III)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "canvas",
            "left",
            "top",
            "length"
        }
    .end annotation

    .line 1118
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 1119
    return-void

    .line 1121
    :cond_0
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

    add-int v1, p2, p4

    iget v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v2, p3

    .line 1122
    invoke-virtual {v0, p2, p3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1123
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1124
    return-void
.end method

.method private drawVerticalDivider(Landroid/graphics/Canvas;III)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "canvas",
            "left",
            "top",
            "length"
        }
    .end annotation

    .line 1110
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 1111
    return-void

    .line 1113
    :cond_0
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v1, p2

    add-int v2, p3, p4

    invoke-virtual {v0, p2, p3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1114
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1115
    return-void
.end method

.method private hasDividerBeforeChildAtAlongMainAxis(II)Z
    .locals 3
    .param p1, "index"    # I
    .param p2, "indexInFlexLine"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "indexInFlexLine"
        }
    .end annotation

    .line 1481
    invoke-direct {p0, p1, p2}, Lcom/google/android/flexbox/FlexboxLayout;->allViewsAreGoneBefore(II)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 1482
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1483
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_0

    move v1, v2

    :cond_0
    return v1

    .line 1485
    :cond_1
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_2

    move v1, v2

    :cond_2
    return v1

    .line 1488
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1489
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_4

    move v1, v2

    :cond_4
    return v1

    .line 1491
    :cond_5
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_6

    move v1, v2

    :cond_6
    return v1
.end method

.method private hasDividerBeforeFlexLine(I)Z
    .locals 3
    .param p1, "flexLineIndex"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flexLineIndex"
        }
    .end annotation

    .line 1513
    const/4 v0, 0x0

    if-ltz p1, :cond_8

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 1516
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/flexbox/FlexboxLayout;->allFlexLinesAreDummyBefore(I)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    .line 1517
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1518
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/2addr v1, v2

    if-eqz v1, :cond_1

    move v0, v2

    :cond_1
    return v0

    .line 1520
    :cond_2
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/2addr v1, v2

    if-eqz v1, :cond_3

    move v0, v2

    :cond_3
    return v0

    .line 1523
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1524
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_5

    move v0, v2

    :cond_5
    return v0

    .line 1526
    :cond_6
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_7

    move v0, v2

    :cond_7
    return v0

    .line 1514
    :cond_8
    :goto_0
    return v0
.end method

.method private hasEndDividerAfterFlexLine(I)Z
    .locals 3
    .param p1, "flexLineIndex"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flexLineIndex"
        }
    .end annotation

    .line 1547
    const/4 v0, 0x0

    if-ltz p1, :cond_6

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_1

    .line 1551
    :cond_0
    add-int/lit8 v1, p1, 0x1

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 1552
    iget-object v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/flexbox/FlexLine;

    invoke-virtual {v2}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v2

    if-lez v2, :cond_1

    .line 1553
    return v0

    .line 1551
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1556
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    .line 1557
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_3

    move v0, v2

    :cond_3
    return v0

    .line 1559
    :cond_4
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_5

    move v0, v2

    :cond_5
    return v0

    .line 1548
    :cond_6
    :goto_1
    return v0
.end method

.method private layoutHorizontal(ZIIII)V
    .locals 26
    .param p1, "isRtl"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "isRtl",
            "left",
            "top",
            "right",
            "bottom"
        }
    .end annotation

    .line 615
    move-object/from16 v0, p0

    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingLeft()I

    move-result v1

    .line 616
    .local v1, "paddingLeft":I
    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingRight()I

    move-result v2

    .line 621
    .local v2, "paddingRight":I
    sub-int v3, p5, p3

    .line 622
    .local v3, "height":I
    sub-int v4, p4, p2

    .line 625
    .local v4, "width":I
    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingBottom()I

    move-result v5

    sub-int v5, v3, v5

    .line 626
    .local v5, "childBottom":I
    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingTop()I

    move-result v6

    .line 632
    .local v6, "childTop":I
    const/4 v7, 0x0

    .local v7, "i":I
    iget-object v8, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    .local v8, "size":I
    :goto_0
    if-ge v7, v8, :cond_d

    .line 633
    iget-object v9, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object v12, v9

    check-cast v12, Lcom/google/android/flexbox/FlexLine;

    .line 634
    .local v12, "flexLine":Lcom/google/android/flexbox/FlexLine;
    invoke-direct {v0, v7}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeFlexLine(I)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 635
    iget v9, v0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    sub-int/2addr v5, v9

    .line 636
    iget v9, v0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v6, v9

    move/from16 v16, v5

    goto :goto_1

    .line 634
    :cond_0
    move/from16 v16, v5

    .line 638
    .end local v5    # "childBottom":I
    .local v16, "childBottom":I
    :goto_1
    const/4 v5, 0x0

    .line 639
    .local v5, "spaceBetweenItem":F
    iget v9, v0, Lcom/google/android/flexbox/FlexboxLayout;->mJustifyContent:I

    const/high16 v10, 0x40000000    # 2.0f

    const/4 v11, 0x1

    packed-switch v9, :pswitch_data_0

    .line 681
    move/from16 v18, v1

    move/from16 v20, v2

    .end local v1    # "paddingLeft":I
    .end local v2    # "paddingRight":I
    .local v18, "paddingLeft":I
    .local v20, "paddingRight":I
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Invalid justifyContent is set: "

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v9, v0, Lcom/google/android/flexbox/FlexboxLayout;->mJustifyContent:I

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 671
    .end local v18    # "paddingLeft":I
    .end local v20    # "paddingRight":I
    .restart local v1    # "paddingLeft":I
    .restart local v2    # "paddingRight":I
    :pswitch_0
    invoke-virtual {v12}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v9

    .line 672
    .local v9, "visibleCount":I
    if-eqz v9, :cond_1

    .line 673
    iget v10, v12, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v10, v4, v10

    int-to-float v10, v10

    add-int/lit8 v13, v9, 0x1

    int-to-float v13, v13

    div-float v5, v10, v13

    .line 676
    :cond_1
    int-to-float v10, v1

    add-float/2addr v10, v5

    .line 677
    .local v10, "childLeft":F
    sub-int v13, v4, v2

    int-to-float v13, v13

    sub-float/2addr v13, v5

    .line 678
    .local v13, "childRight":F
    goto :goto_3

    .line 653
    .end local v9    # "visibleCount":I
    .end local v10    # "childLeft":F
    .end local v13    # "childRight":F
    :pswitch_1
    invoke-virtual {v12}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v9

    .line 654
    .restart local v9    # "visibleCount":I
    if-eqz v9, :cond_2

    .line 655
    iget v13, v12, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v13, v4, v13

    int-to-float v13, v13

    int-to-float v14, v9

    div-float v5, v13, v14

    .line 658
    :cond_2
    int-to-float v13, v1

    div-float v14, v5, v10

    add-float/2addr v13, v14

    .line 659
    .local v13, "childLeft":F
    sub-int v14, v4, v2

    int-to-float v14, v14

    div-float v10, v5, v10

    sub-float v10, v14, v10

    .line 660
    .local v10, "childRight":F
    move/from16 v25, v13

    move v13, v10

    move/from16 v10, v25

    goto :goto_3

    .line 663
    .end local v9    # "visibleCount":I
    .end local v10    # "childRight":F
    .end local v13    # "childLeft":F
    :pswitch_2
    int-to-float v10, v1

    .line 664
    .local v10, "childLeft":F
    invoke-virtual {v12}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v9

    .line 665
    .restart local v9    # "visibleCount":I
    if-eq v9, v11, :cond_3

    add-int/lit8 v13, v9, -0x1

    int-to-float v13, v13

    goto :goto_2

    :cond_3
    const/high16 v13, 0x3f800000    # 1.0f

    .line 666
    .local v13, "denominator":F
    :goto_2
    iget v14, v12, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v14, v4, v14

    int-to-float v14, v14

    div-float v5, v14, v13

    .line 667
    sub-int v14, v4, v2

    int-to-float v14, v14

    .line 668
    .local v14, "childRight":F
    move v13, v14

    goto :goto_3

    .line 649
    .end local v9    # "visibleCount":I
    .end local v10    # "childLeft":F
    .end local v13    # "denominator":F
    .end local v14    # "childRight":F
    :pswitch_3
    int-to-float v9, v1

    iget v13, v12, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v13, v4, v13

    int-to-float v13, v13

    div-float/2addr v13, v10

    add-float/2addr v9, v13

    .line 650
    .local v9, "childLeft":F
    sub-int v13, v4, v2

    int-to-float v13, v13

    iget v14, v12, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v14, v4, v14

    int-to-float v14, v14

    div-float/2addr v14, v10

    sub-float/2addr v13, v14

    .line 651
    .local v13, "childRight":F
    move v10, v9

    goto :goto_3

    .line 645
    .end local v9    # "childLeft":F
    .end local v13    # "childRight":F
    :pswitch_4
    iget v9, v12, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v9, v4, v9

    add-int/2addr v9, v2

    int-to-float v10, v9

    .line 646
    .restart local v10    # "childLeft":F
    iget v9, v12, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int/2addr v9, v1

    int-to-float v13, v9

    .line 647
    .restart local v13    # "childRight":F
    goto :goto_3

    .line 641
    .end local v10    # "childLeft":F
    .end local v13    # "childRight":F
    :pswitch_5
    int-to-float v10, v1

    .line 642
    .restart local v10    # "childLeft":F
    sub-int v9, v4, v2

    int-to-float v13, v9

    .line 643
    .restart local v13    # "childRight":F
    nop

    .line 684
    :goto_3
    const/4 v9, 0x0

    invoke-static {v5, v9}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 686
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_4
    iget v14, v12, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    if-ge v9, v14, :cond_c

    .line 687
    iget v14, v12, Lcom/google/android/flexbox/FlexLine;->mFirstIndex:I

    add-int/2addr v14, v9

    .line 688
    .local v14, "index":I
    move v15, v11

    invoke-virtual {v0, v14}, Lcom/google/android/flexbox/FlexboxLayout;->getReorderedChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 689
    .local v11, "child":Landroid/view/View;
    if-eqz v11, :cond_b

    move/from16 v17, v15

    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v15

    move/from16 v18, v1

    .end local v1    # "paddingLeft":I
    .restart local v18    # "paddingLeft":I
    const/16 v1, 0x8

    if-ne v15, v1, :cond_4

    .line 690
    move/from16 v20, v2

    move/from16 v24, v16

    goto/16 :goto_8

    .line 692
    :cond_4
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    .line 693
    .local v1, "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    iget v15, v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->leftMargin:I

    int-to-float v15, v15

    add-float/2addr v10, v15

    .line 694
    iget v15, v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->rightMargin:I

    int-to-float v15, v15

    sub-float/2addr v13, v15

    .line 695
    const/4 v15, 0x0

    .line 696
    .local v15, "beforeDividerLength":I
    const/16 v19, 0x0

    .line 697
    .local v19, "endDividerLength":I
    invoke-direct {v0, v14, v9}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeChildAtAlongMainAxis(II)Z

    move-result v20

    if-eqz v20, :cond_5

    .line 698
    iget v15, v0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    .line 699
    move/from16 v20, v2

    .end local v2    # "paddingRight":I
    .restart local v20    # "paddingRight":I
    int-to-float v2, v15

    add-float/2addr v10, v2

    .line 700
    int-to-float v2, v15

    sub-float/2addr v13, v2

    move v2, v10

    move/from16 v21, v13

    move/from16 v22, v15

    goto :goto_5

    .line 697
    .end local v20    # "paddingRight":I
    .restart local v2    # "paddingRight":I
    :cond_5
    move/from16 v20, v2

    .end local v2    # "paddingRight":I
    .restart local v20    # "paddingRight":I
    move v2, v10

    move/from16 v21, v13

    move/from16 v22, v15

    .line 702
    .end local v10    # "childLeft":F
    .end local v13    # "childRight":F
    .end local v15    # "beforeDividerLength":I
    .local v2, "childLeft":F
    .local v21, "childRight":F
    .local v22, "beforeDividerLength":I
    :goto_5
    iget v10, v12, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    add-int/lit8 v10, v10, -0x1

    if-ne v9, v10, :cond_6

    iget v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/lit8 v10, v10, 0x4

    if-lez v10, :cond_6

    .line 703
    iget v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    move/from16 v19, v10

    .line 706
    :cond_6
    iget v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    const/4 v13, 0x2

    if-ne v10, v13, :cond_8

    .line 707
    if-eqz p1, :cond_7

    .line 708
    iget-object v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 709
    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->round(F)I

    move-result v13

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    sub-int/2addr v13, v15

    .line 710
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v15

    sub-int v15, v16, v15

    move/from16 v23, v14

    move v14, v15

    .end local v14    # "index":I
    .local v23, "index":I
    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->round(F)I

    move-result v15

    .line 708
    invoke-virtual/range {v10 .. v16}, Lcom/google/android/flexbox/FlexboxHelper;->layoutSingleChildHorizontal(Landroid/view/View;Lcom/google/android/flexbox/FlexLine;IIII)V

    move/from16 v24, v16

    goto :goto_6

    .line 713
    .end local v23    # "index":I
    .restart local v14    # "index":I
    :cond_7
    move/from16 v23, v14

    .end local v14    # "index":I
    .restart local v23    # "index":I
    iget-object v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 714
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v13

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    sub-int v14, v16, v14

    .line 715
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v15

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v24

    add-int v15, v15, v24

    .line 713
    invoke-virtual/range {v10 .. v16}, Lcom/google/android/flexbox/FlexboxHelper;->layoutSingleChildHorizontal(Landroid/view/View;Lcom/google/android/flexbox/FlexLine;IIII)V

    move/from16 v24, v16

    .end local v16    # "childBottom":I
    .local v24, "childBottom":I
    goto :goto_6

    .line 718
    .end local v23    # "index":I
    .end local v24    # "childBottom":I
    .restart local v14    # "index":I
    .restart local v16    # "childBottom":I
    :cond_8
    move/from16 v23, v14

    move/from16 v24, v16

    .end local v14    # "index":I
    .end local v16    # "childBottom":I
    .restart local v23    # "index":I
    .restart local v24    # "childBottom":I
    if-eqz p1, :cond_9

    .line 719
    iget-object v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 720
    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->round(F)I

    move-result v13

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    sub-int/2addr v13, v14

    .line 721
    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->round(F)I

    move-result v15

    .line 722
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    add-int v16, v6, v14

    .line 719
    move v14, v6

    .end local v6    # "childTop":I
    .local v14, "childTop":I
    invoke-virtual/range {v10 .. v16}, Lcom/google/android/flexbox/FlexboxHelper;->layoutSingleChildHorizontal(Landroid/view/View;Lcom/google/android/flexbox/FlexLine;IIII)V

    goto :goto_6

    .line 724
    .end local v14    # "childTop":I
    .restart local v6    # "childTop":I
    :cond_9
    move v14, v6

    .end local v6    # "childTop":I
    .restart local v14    # "childTop":I
    iget-object v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 725
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v13

    .line 726
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v15, v6

    .line 727
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    add-int v16, v14, v6

    .line 724
    invoke-virtual/range {v10 .. v16}, Lcom/google/android/flexbox/FlexboxHelper;->layoutSingleChildHorizontal(Landroid/view/View;Lcom/google/android/flexbox/FlexLine;IIII)V

    move v6, v14

    .line 730
    .end local v14    # "childTop":I
    .restart local v6    # "childTop":I
    :goto_6
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    int-to-float v10, v10

    add-float/2addr v10, v5

    iget v13, v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->rightMargin:I

    int-to-float v13, v13

    add-float/2addr v10, v13

    add-float/2addr v2, v10

    .line 731
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    int-to-float v10, v10

    add-float/2addr v10, v5

    iget v13, v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->leftMargin:I

    int-to-float v13, v13

    add-float/2addr v10, v13

    sub-float v21, v21, v10

    .line 733
    if-eqz p1, :cond_a

    .line 734
    const/4 v13, 0x0

    const/4 v15, 0x0

    move-object v10, v12

    move/from16 v12, v19

    move/from16 v14, v22

    .end local v19    # "endDividerLength":I
    .end local v22    # "beforeDividerLength":I
    .local v10, "flexLine":Lcom/google/android/flexbox/FlexLine;
    .local v12, "endDividerLength":I
    .local v14, "beforeDividerLength":I
    invoke-virtual/range {v10 .. v15}, Lcom/google/android/flexbox/FlexLine;->updatePositionFromView(Landroid/view/View;IIII)V

    move/from16 v25, v12

    move-object v12, v10

    move/from16 v10, v25

    .local v10, "endDividerLength":I
    .local v12, "flexLine":Lcom/google/android/flexbox/FlexLine;
    goto :goto_7

    .line 737
    .end local v10    # "endDividerLength":I
    .end local v14    # "beforeDividerLength":I
    .restart local v19    # "endDividerLength":I
    .restart local v22    # "beforeDividerLength":I
    :cond_a
    move/from16 v10, v19

    move/from16 v14, v22

    .end local v19    # "endDividerLength":I
    .end local v22    # "beforeDividerLength":I
    .restart local v10    # "endDividerLength":I
    .restart local v14    # "beforeDividerLength":I
    const/4 v13, 0x0

    const/4 v15, 0x0

    move/from16 v25, v14

    move v14, v10

    move-object v10, v12

    move/from16 v12, v25

    .local v10, "flexLine":Lcom/google/android/flexbox/FlexLine;
    .local v12, "beforeDividerLength":I
    .local v14, "endDividerLength":I
    invoke-virtual/range {v10 .. v15}, Lcom/google/android/flexbox/FlexLine;->updatePositionFromView(Landroid/view/View;IIII)V

    move-object v12, v10

    move v10, v14

    move/from16 v14, v25

    .line 686
    .end local v1    # "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    .end local v10    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .end local v11    # "child":Landroid/view/View;
    .end local v14    # "endDividerLength":I
    .end local v23    # "index":I
    .local v12, "flexLine":Lcom/google/android/flexbox/FlexLine;
    :goto_7
    move v10, v2

    move/from16 v13, v21

    goto :goto_8

    .line 689
    .end local v18    # "paddingLeft":I
    .end local v20    # "paddingRight":I
    .end local v21    # "childRight":F
    .end local v24    # "childBottom":I
    .local v1, "paddingLeft":I
    .local v2, "paddingRight":I
    .local v10, "childLeft":F
    .restart local v11    # "child":Landroid/view/View;
    .restart local v13    # "childRight":F
    .local v14, "index":I
    .restart local v16    # "childBottom":I
    :cond_b
    move/from16 v18, v1

    move/from16 v20, v2

    move/from16 v23, v14

    move/from16 v17, v15

    move/from16 v24, v16

    .line 686
    .end local v1    # "paddingLeft":I
    .end local v2    # "paddingRight":I
    .end local v11    # "child":Landroid/view/View;
    .end local v14    # "index":I
    .end local v16    # "childBottom":I
    .restart local v18    # "paddingLeft":I
    .restart local v20    # "paddingRight":I
    .restart local v24    # "childBottom":I
    :goto_8
    add-int/lit8 v9, v9, 0x1

    move/from16 v11, v17

    move/from16 v1, v18

    move/from16 v2, v20

    move/from16 v16, v24

    goto/16 :goto_4

    .end local v18    # "paddingLeft":I
    .end local v20    # "paddingRight":I
    .end local v24    # "childBottom":I
    .restart local v1    # "paddingLeft":I
    .restart local v2    # "paddingRight":I
    .restart local v16    # "childBottom":I
    :cond_c
    move/from16 v18, v1

    move/from16 v20, v2

    move/from16 v24, v16

    .line 741
    .end local v1    # "paddingLeft":I
    .end local v2    # "paddingRight":I
    .end local v9    # "j":I
    .end local v16    # "childBottom":I
    .restart local v18    # "paddingLeft":I
    .restart local v20    # "paddingRight":I
    .restart local v24    # "childBottom":I
    iget v1, v12, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    add-int/2addr v6, v1

    .line 742
    iget v1, v12, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    sub-int v5, v24, v1

    .line 632
    .end local v12    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .end local v24    # "childBottom":I
    .local v5, "childBottom":I
    add-int/lit8 v7, v7, 0x1

    move/from16 v1, v18

    goto/16 :goto_0

    .line 744
    .end local v7    # "i":I
    .end local v8    # "size":I
    .end local v10    # "childLeft":F
    .end local v13    # "childRight":F
    .end local v18    # "paddingLeft":I
    .end local v20    # "paddingRight":I
    .restart local v1    # "paddingLeft":I
    .restart local v2    # "paddingRight":I
    :cond_d
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private layoutVertical(ZZIIII)V
    .locals 28
    .param p1, "isRtl"    # Z
    .param p2, "fromBottomToTop"    # Z
    .param p3, "left"    # I
    .param p4, "top"    # I
    .param p5, "right"    # I
    .param p6, "bottom"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "isRtl",
            "fromBottomToTop",
            "left",
            "top",
            "right",
            "bottom"
        }
    .end annotation

    .line 770
    move-object/from16 v0, p0

    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingTop()I

    move-result v1

    .line 771
    .local v1, "paddingTop":I
    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingBottom()I

    move-result v2

    .line 773
    .local v2, "paddingBottom":I
    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingRight()I

    move-result v3

    .line 774
    .local v3, "paddingRight":I
    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingLeft()I

    move-result v4

    .line 776
    .local v4, "childLeft":I
    sub-int v5, p5, p3

    .line 777
    .local v5, "width":I
    sub-int v6, p6, p4

    .line 780
    .local v6, "height":I
    sub-int v7, v5, v3

    .line 789
    .local v7, "childRight":I
    const/4 v8, 0x0

    .local v8, "i":I
    iget-object v9, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    .local v9, "size":I
    :goto_0
    if-ge v8, v9, :cond_d

    .line 790
    iget-object v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v10, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    move-object v13, v10

    check-cast v13, Lcom/google/android/flexbox/FlexLine;

    .line 791
    .local v13, "flexLine":Lcom/google/android/flexbox/FlexLine;
    invoke-direct {v0, v8}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeFlexLine(I)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 792
    iget v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v4, v10

    .line 793
    iget v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    sub-int/2addr v7, v10

    move/from16 v17, v7

    goto :goto_1

    .line 791
    :cond_0
    move/from16 v17, v7

    .line 795
    .end local v7    # "childRight":I
    .local v17, "childRight":I
    :goto_1
    const/4 v7, 0x0

    .line 796
    .local v7, "spaceBetweenItem":F
    iget v10, v0, Lcom/google/android/flexbox/FlexboxLayout;->mJustifyContent:I

    const/high16 v11, 0x40000000    # 2.0f

    const/4 v12, 0x1

    packed-switch v10, :pswitch_data_0

    .line 838
    move/from16 v19, v1

    move/from16 v20, v2

    move/from16 v21, v3

    .end local v1    # "paddingTop":I
    .end local v2    # "paddingBottom":I
    .end local v3    # "paddingRight":I
    .local v19, "paddingTop":I
    .local v20, "paddingBottom":I
    .local v21, "paddingRight":I
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid justifyContent is set: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/google/android/flexbox/FlexboxLayout;->mJustifyContent:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 828
    .end local v19    # "paddingTop":I
    .end local v20    # "paddingBottom":I
    .end local v21    # "paddingRight":I
    .restart local v1    # "paddingTop":I
    .restart local v2    # "paddingBottom":I
    .restart local v3    # "paddingRight":I
    :pswitch_0
    invoke-virtual {v13}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v10

    .line 829
    .local v10, "visibleCount":I
    if-eqz v10, :cond_1

    .line 830
    iget v11, v13, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v11, v6, v11

    int-to-float v11, v11

    add-int/lit8 v14, v10, 0x1

    int-to-float v14, v14

    div-float v7, v11, v14

    .line 833
    :cond_1
    int-to-float v11, v1

    add-float/2addr v11, v7

    .line 834
    .local v11, "childTop":F
    sub-int v14, v6, v2

    int-to-float v14, v14

    sub-float/2addr v14, v7

    .line 835
    .local v14, "childBottom":F
    goto :goto_3

    .line 810
    .end local v10    # "visibleCount":I
    .end local v11    # "childTop":F
    .end local v14    # "childBottom":F
    :pswitch_1
    invoke-virtual {v13}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v10

    .line 811
    .restart local v10    # "visibleCount":I
    if-eqz v10, :cond_2

    .line 812
    iget v14, v13, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v14, v6, v14

    int-to-float v14, v14

    int-to-float v15, v10

    div-float v7, v14, v15

    .line 815
    :cond_2
    int-to-float v14, v1

    div-float v15, v7, v11

    add-float/2addr v14, v15

    .line 816
    .local v14, "childTop":F
    sub-int v15, v6, v2

    int-to-float v15, v15

    div-float v11, v7, v11

    sub-float v11, v15, v11

    .line 817
    .local v11, "childBottom":F
    move/from16 v27, v14

    move v14, v11

    move/from16 v11, v27

    goto :goto_3

    .line 820
    .end local v10    # "visibleCount":I
    .end local v11    # "childBottom":F
    .end local v14    # "childTop":F
    :pswitch_2
    int-to-float v11, v1

    .line 821
    .local v11, "childTop":F
    invoke-virtual {v13}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v10

    .line 822
    .restart local v10    # "visibleCount":I
    if-eq v10, v12, :cond_3

    add-int/lit8 v14, v10, -0x1

    int-to-float v14, v14

    goto :goto_2

    :cond_3
    const/high16 v14, 0x3f800000    # 1.0f

    .line 823
    .local v14, "denominator":F
    :goto_2
    iget v15, v13, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v15, v6, v15

    int-to-float v15, v15

    div-float v7, v15, v14

    .line 824
    sub-int v15, v6, v2

    int-to-float v15, v15

    .line 825
    .local v15, "childBottom":F
    move v14, v15

    goto :goto_3

    .line 806
    .end local v10    # "visibleCount":I
    .end local v11    # "childTop":F
    .end local v14    # "denominator":F
    .end local v15    # "childBottom":F
    :pswitch_3
    int-to-float v10, v1

    iget v14, v13, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v14, v6, v14

    int-to-float v14, v14

    div-float/2addr v14, v11

    add-float/2addr v10, v14

    .line 807
    .local v10, "childTop":F
    sub-int v14, v6, v2

    int-to-float v14, v14

    iget v15, v13, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v15, v6, v15

    int-to-float v15, v15

    div-float/2addr v15, v11

    sub-float/2addr v14, v15

    .line 808
    .local v14, "childBottom":F
    move v11, v10

    goto :goto_3

    .line 802
    .end local v10    # "childTop":F
    .end local v14    # "childBottom":F
    :pswitch_4
    iget v10, v13, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int v10, v6, v10

    add-int/2addr v10, v2

    int-to-float v11, v10

    .line 803
    .restart local v11    # "childTop":F
    iget v10, v13, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    sub-int/2addr v10, v1

    int-to-float v14, v10

    .line 804
    .restart local v14    # "childBottom":F
    goto :goto_3

    .line 798
    .end local v11    # "childTop":F
    .end local v14    # "childBottom":F
    :pswitch_5
    int-to-float v11, v1

    .line 799
    .restart local v11    # "childTop":F
    sub-int v10, v6, v2

    int-to-float v14, v10

    .line 800
    .restart local v14    # "childBottom":F
    nop

    .line 841
    :goto_3
    const/4 v10, 0x0

    invoke-static {v7, v10}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 843
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_4
    iget v15, v13, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    if-ge v10, v15, :cond_c

    .line 844
    iget v15, v13, Lcom/google/android/flexbox/FlexLine;->mFirstIndex:I

    add-int/2addr v15, v10

    .line 845
    .local v15, "index":I
    move/from16 v16, v12

    invoke-virtual {v0, v15}, Lcom/google/android/flexbox/FlexboxLayout;->getReorderedChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 846
    .local v12, "child":Landroid/view/View;
    if-eqz v12, :cond_b

    move/from16 v19, v1

    .end local v1    # "paddingTop":I
    .restart local v19    # "paddingTop":I
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v1

    move/from16 v20, v2

    .end local v2    # "paddingBottom":I
    .restart local v20    # "paddingBottom":I
    const/16 v2, 0x8

    if-ne v1, v2, :cond_4

    .line 847
    move/from16 v21, v3

    move/from16 v24, v16

    move/from16 v26, v17

    goto/16 :goto_9

    .line 849
    :cond_4
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    .line 850
    .local v1, "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    iget v2, v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->topMargin:I

    int-to-float v2, v2

    add-float/2addr v11, v2

    .line 851
    iget v2, v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->bottomMargin:I

    int-to-float v2, v2

    sub-float/2addr v14, v2

    .line 852
    const/4 v2, 0x0

    .line 853
    .local v2, "beforeDividerLength":I
    const/16 v18, 0x0

    .line 854
    .local v18, "endDividerLength":I
    invoke-direct {v0, v15, v10}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeChildAtAlongMainAxis(II)Z

    move-result v21

    if-eqz v21, :cond_5

    .line 855
    iget v2, v0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    .line 856
    move/from16 v21, v3

    .end local v3    # "paddingRight":I
    .restart local v21    # "paddingRight":I
    int-to-float v3, v2

    add-float/2addr v11, v3

    .line 857
    int-to-float v3, v2

    sub-float/2addr v14, v3

    move v3, v11

    move/from16 v22, v14

    goto :goto_5

    .line 854
    .end local v21    # "paddingRight":I
    .restart local v3    # "paddingRight":I
    :cond_5
    move/from16 v21, v3

    .end local v3    # "paddingRight":I
    .restart local v21    # "paddingRight":I
    move v3, v11

    move/from16 v22, v14

    .line 859
    .end local v11    # "childTop":F
    .end local v14    # "childBottom":F
    .local v3, "childTop":F
    .local v22, "childBottom":F
    :goto_5
    iget v11, v13, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    add-int/lit8 v11, v11, -0x1

    if-ne v10, v11, :cond_6

    iget v11, v0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/lit8 v11, v11, 0x4

    if-lez v11, :cond_6

    .line 861
    iget v11, v0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    move/from16 v23, v11

    .end local v18    # "endDividerLength":I
    .local v11, "endDividerLength":I
    goto :goto_6

    .line 863
    .end local v11    # "endDividerLength":I
    .restart local v18    # "endDividerLength":I
    :cond_6
    move/from16 v23, v18

    .end local v18    # "endDividerLength":I
    .local v23, "endDividerLength":I
    :goto_6
    if-eqz p1, :cond_8

    .line 864
    if-eqz p2, :cond_7

    .line 865
    iget-object v11, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 866
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    sub-int v14, v17, v14

    .line 867
    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->round(F)I

    move-result v18

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v24

    sub-int v18, v18, v24

    .line 868
    move/from16 v24, v16

    move/from16 v16, v18

    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->round(F)I

    move-result v18

    .line 865
    move/from16 v25, v15

    move v15, v14

    .end local v15    # "index":I
    .local v25, "index":I
    const/4 v14, 0x1

    invoke-virtual/range {v11 .. v18}, Lcom/google/android/flexbox/FlexboxHelper;->layoutSingleChildVertical(Landroid/view/View;Lcom/google/android/flexbox/FlexLine;ZIIII)V

    move/from16 v26, v17

    goto :goto_7

    .line 870
    .end local v25    # "index":I
    .restart local v15    # "index":I
    :cond_7
    move/from16 v25, v15

    move/from16 v24, v16

    .end local v15    # "index":I
    .restart local v25    # "index":I
    iget-object v11, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 871
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    sub-int v15, v17, v14

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v16

    .line 872
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v14

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    add-int v18, v14, v18

    .line 870
    const/4 v14, 0x1

    invoke-virtual/range {v11 .. v18}, Lcom/google/android/flexbox/FlexboxHelper;->layoutSingleChildVertical(Landroid/view/View;Lcom/google/android/flexbox/FlexLine;ZIIII)V

    move/from16 v26, v17

    .end local v17    # "childRight":I
    .local v26, "childRight":I
    goto :goto_7

    .line 875
    .end local v25    # "index":I
    .end local v26    # "childRight":I
    .restart local v15    # "index":I
    .restart local v17    # "childRight":I
    :cond_8
    move/from16 v25, v15

    move/from16 v24, v16

    move/from16 v26, v17

    .end local v15    # "index":I
    .end local v17    # "childRight":I
    .restart local v25    # "index":I
    .restart local v26    # "childRight":I
    if-eqz p2, :cond_9

    .line 876
    iget-object v11, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 877
    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->round(F)I

    move-result v14

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v15

    sub-int v16, v14, v15

    .line 878
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    add-int v17, v4, v14

    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->round(F)I

    move-result v18

    .line 876
    const/4 v14, 0x0

    move v15, v4

    .end local v4    # "childLeft":I
    .local v15, "childLeft":I
    invoke-virtual/range {v11 .. v18}, Lcom/google/android/flexbox/FlexboxHelper;->layoutSingleChildVertical(Landroid/view/View;Lcom/google/android/flexbox/FlexLine;ZIIII)V

    goto :goto_7

    .line 880
    .end local v15    # "childLeft":I
    .restart local v4    # "childLeft":I
    :cond_9
    move v15, v4

    .end local v4    # "childLeft":I
    .restart local v15    # "childLeft":I
    iget-object v11, v0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 881
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v16

    .line 882
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int v17, v15, v4

    .line 883
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    add-int v18, v4, v14

    .line 880
    const/4 v14, 0x0

    invoke-virtual/range {v11 .. v18}, Lcom/google/android/flexbox/FlexboxHelper;->layoutSingleChildVertical(Landroid/view/View;Lcom/google/android/flexbox/FlexLine;ZIIII)V

    move v4, v15

    .line 886
    .end local v15    # "childLeft":I
    .restart local v4    # "childLeft":I
    :goto_7
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    int-to-float v11, v11

    add-float/2addr v11, v7

    iget v14, v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->bottomMargin:I

    int-to-float v14, v14

    add-float/2addr v11, v14

    add-float/2addr v3, v11

    .line 887
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    int-to-float v11, v11

    add-float/2addr v11, v7

    iget v14, v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->topMargin:I

    int-to-float v14, v14

    add-float/2addr v11, v14

    sub-float v22, v22, v11

    .line 889
    if-eqz p2, :cond_a

    .line 890
    move-object v11, v13

    .end local v13    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .local v11, "flexLine":Lcom/google/android/flexbox/FlexLine;
    const/4 v13, 0x0

    const/4 v15, 0x0

    move/from16 v16, v2

    move/from16 v14, v23

    .end local v2    # "beforeDividerLength":I
    .end local v23    # "endDividerLength":I
    .local v14, "endDividerLength":I
    .local v16, "beforeDividerLength":I
    invoke-virtual/range {v11 .. v16}, Lcom/google/android/flexbox/FlexLine;->updatePositionFromView(Landroid/view/View;IIII)V

    move/from16 v27, v16

    move/from16 v16, v14

    move/from16 v14, v27

    move-object v13, v11

    .end local v11    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .restart local v13    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .local v14, "beforeDividerLength":I
    .local v16, "endDividerLength":I
    goto :goto_8

    .line 893
    .end local v14    # "beforeDividerLength":I
    .end local v16    # "endDividerLength":I
    .restart local v2    # "beforeDividerLength":I
    .restart local v23    # "endDividerLength":I
    :cond_a
    move v14, v2

    move/from16 v16, v23

    .end local v2    # "beforeDividerLength":I
    .end local v23    # "endDividerLength":I
    .restart local v14    # "beforeDividerLength":I
    .restart local v16    # "endDividerLength":I
    move-object v11, v13

    .end local v13    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .restart local v11    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    const/4 v13, 0x0

    const/4 v15, 0x0

    invoke-virtual/range {v11 .. v16}, Lcom/google/android/flexbox/FlexLine;->updatePositionFromView(Landroid/view/View;IIII)V

    move-object v13, v11

    .line 843
    .end local v1    # "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    .end local v11    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .end local v12    # "child":Landroid/view/View;
    .end local v14    # "beforeDividerLength":I
    .end local v16    # "endDividerLength":I
    .end local v25    # "index":I
    .restart local v13    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    :goto_8
    move v11, v3

    move/from16 v14, v22

    goto :goto_9

    .line 846
    .end local v19    # "paddingTop":I
    .end local v20    # "paddingBottom":I
    .end local v21    # "paddingRight":I
    .end local v22    # "childBottom":F
    .end local v26    # "childRight":I
    .local v1, "paddingTop":I
    .local v2, "paddingBottom":I
    .local v3, "paddingRight":I
    .local v11, "childTop":F
    .restart local v12    # "child":Landroid/view/View;
    .local v14, "childBottom":F
    .local v15, "index":I
    .restart local v17    # "childRight":I
    :cond_b
    move/from16 v19, v1

    move/from16 v20, v2

    move/from16 v21, v3

    move/from16 v25, v15

    move/from16 v24, v16

    move/from16 v26, v17

    .line 843
    .end local v1    # "paddingTop":I
    .end local v2    # "paddingBottom":I
    .end local v3    # "paddingRight":I
    .end local v12    # "child":Landroid/view/View;
    .end local v15    # "index":I
    .end local v17    # "childRight":I
    .restart local v19    # "paddingTop":I
    .restart local v20    # "paddingBottom":I
    .restart local v21    # "paddingRight":I
    .restart local v26    # "childRight":I
    :goto_9
    add-int/lit8 v10, v10, 0x1

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    move/from16 v12, v24

    move/from16 v17, v26

    goto/16 :goto_4

    .end local v19    # "paddingTop":I
    .end local v20    # "paddingBottom":I
    .end local v21    # "paddingRight":I
    .end local v26    # "childRight":I
    .restart local v1    # "paddingTop":I
    .restart local v2    # "paddingBottom":I
    .restart local v3    # "paddingRight":I
    .restart local v17    # "childRight":I
    :cond_c
    move/from16 v19, v1

    move/from16 v20, v2

    move/from16 v21, v3

    move/from16 v26, v17

    .line 897
    .end local v1    # "paddingTop":I
    .end local v2    # "paddingBottom":I
    .end local v3    # "paddingRight":I
    .end local v10    # "j":I
    .end local v17    # "childRight":I
    .restart local v19    # "paddingTop":I
    .restart local v20    # "paddingBottom":I
    .restart local v21    # "paddingRight":I
    .restart local v26    # "childRight":I
    iget v1, v13, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    add-int/2addr v4, v1

    .line 898
    iget v1, v13, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    sub-int v7, v26, v1

    .line 789
    .end local v13    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .end local v26    # "childRight":I
    .local v7, "childRight":I
    add-int/lit8 v8, v8, 0x1

    move/from16 v1, v19

    goto/16 :goto_0

    .line 900
    .end local v8    # "i":I
    .end local v9    # "size":I
    .end local v11    # "childTop":F
    .end local v14    # "childBottom":F
    .end local v19    # "paddingTop":I
    .end local v20    # "paddingBottom":I
    .end local v21    # "paddingRight":I
    .restart local v1    # "paddingTop":I
    .restart local v2    # "paddingBottom":I
    .restart local v3    # "paddingRight":I
    :cond_d
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private measureHorizontal(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "widthMeasureSpec",
            "heightMeasureSpec"
        }
    .end annotation

    .line 346
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 348
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;->reset()V

    .line 349
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    .line 350
    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/flexbox/FlexboxHelper;->calculateHorizontalFlexLines(Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;II)V

    .line 352
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    iget-object v0, v0, Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;->mFlexLines:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    .line 354
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/flexbox/FlexboxHelper;->determineMainSize(II)V

    .line 357
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignItems:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_4

    .line 358
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/flexbox/FlexLine;

    .line 360
    .local v1, "flexLine":Lcom/google/android/flexbox/FlexLine;
    const/high16 v2, -0x80000000

    .line 361
    .local v2, "largestHeightInLine":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    iget v4, v1, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    if-ge v3, v4, :cond_3

    .line 362
    iget v4, v1, Lcom/google/android/flexbox/FlexLine;->mFirstIndex:I

    add-int/2addr v4, v3

    .line 363
    .local v4, "viewIndex":I
    invoke-virtual {p0, v4}, Lcom/google/android/flexbox/FlexboxLayout;->getReorderedChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 364
    .local v5, "child":Landroid/view/View;
    if-eqz v5, :cond_2

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_0

    .line 365
    goto :goto_2

    .line 367
    :cond_0
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    .line 368
    .local v6, "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    iget v7, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    const/4 v8, 0x2

    if-eq v7, v8, :cond_1

    .line 369
    iget v7, v1, Lcom/google/android/flexbox/FlexLine;->mMaxBaseline:I

    invoke-virtual {v5}, Landroid/view/View;->getBaseline()I

    move-result v8

    sub-int/2addr v7, v8

    .line 370
    .local v7, "marginTop":I
    iget v8, v6, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->topMargin:I

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 371
    nop

    .line 372
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    add-int/2addr v8, v7

    iget v9, v6, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v8, v9

    .line 371
    invoke-static {v2, v8}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 373
    .end local v7    # "marginTop":I
    goto :goto_2

    .line 374
    :cond_1
    iget v7, v1, Lcom/google/android/flexbox/FlexLine;->mMaxBaseline:I

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    sub-int/2addr v7, v8

    .line 375
    invoke-virtual {v5}, Landroid/view/View;->getBaseline()I

    move-result v8

    add-int/2addr v7, v8

    .line 376
    .local v7, "marginBottom":I
    iget v8, v6, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->bottomMargin:I

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 377
    nop

    .line 378
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    iget v9, v6, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;->topMargin:I

    add-int/2addr v8, v9

    add-int/2addr v8, v7

    .line 377
    invoke-static {v2, v8}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 361
    .end local v4    # "viewIndex":I
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "lp":Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    .end local v7    # "marginBottom":I
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 381
    .end local v3    # "i":I
    :cond_3
    iput v2, v1, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    .line 382
    .end local v1    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    .end local v2    # "largestHeightInLine":I
    goto :goto_0

    .line 385
    :cond_4
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 386
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    .line 385
    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/flexbox/FlexboxHelper;->determineCrossSize(III)V

    .line 389
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxHelper;->stretchViews()V

    .line 390
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    iget v1, v1, Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;->mChildState:I

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/google/android/flexbox/FlexboxLayout;->setMeasuredDimensionForFlex(IIII)V

    .line 392
    return-void
.end method

.method private measureVertical(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "widthMeasureSpec",
            "heightMeasureSpec"
        }
    .end annotation

    .line 407
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 408
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;->reset()V

    .line 409
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/flexbox/FlexboxHelper;->calculateVerticalFlexLines(Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;II)V

    .line 411
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    iget-object v0, v0, Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;->mFlexLines:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    .line 413
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/flexbox/FlexboxHelper;->determineMainSize(II)V

    .line 414
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    .line 415
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingRight()I

    move-result v2

    add-int/2addr v1, v2

    .line 414
    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/flexbox/FlexboxHelper;->determineCrossSize(III)V

    .line 418
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    invoke-virtual {v0}, Lcom/google/android/flexbox/FlexboxHelper;->stretchViews()V

    .line 419
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLinesResult:Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;

    iget v1, v1, Lcom/google/android/flexbox/FlexboxHelper$FlexLinesResult;->mChildState:I

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/google/android/flexbox/FlexboxLayout;->setMeasuredDimensionForFlex(IIII)V

    .line 421
    return-void
.end method

.method private setMeasuredDimensionForFlex(IIII)V
    .locals 10
    .param p1, "flexDirection"    # I
    .param p2, "widthMeasureSpec"    # I
    .param p3, "heightMeasureSpec"    # I
    .param p4, "childState"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "flexDirection",
            "widthMeasureSpec",
            "heightMeasureSpec",
            "childState"
        }
    .end annotation

    .line 436
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 437
    .local v0, "widthMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 438
    .local v1, "widthSize":I
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 439
    .local v2, "heightMode":I
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 442
    .local v3, "heightSize":I
    packed-switch p1, :pswitch_data_0

    .line 455
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid flex direction: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 451
    :pswitch_0
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getLargestMainSize()I

    move-result v4

    .line 452
    .local v4, "calculatedMaxHeight":I
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getSumOfCrossSize()I

    move-result v5

    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingLeft()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingRight()I

    move-result v6

    add-int/2addr v5, v6

    .line 453
    .local v5, "calculatedMaxWidth":I
    goto :goto_0

    .line 445
    .end local v4    # "calculatedMaxHeight":I
    .end local v5    # "calculatedMaxWidth":I
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getSumOfCrossSize()I

    move-result v4

    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingTop()I

    move-result v5

    add-int/2addr v4, v5

    .line 446
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getPaddingBottom()I

    move-result v5

    add-int/2addr v4, v5

    .line 447
    .restart local v4    # "calculatedMaxHeight":I
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getLargestMainSize()I

    move-result v5

    .line 448
    .restart local v5    # "calculatedMaxWidth":I
    nop

    .line 459
    :goto_0
    const/high16 v6, 0x1000000

    sparse-switch v0, :sswitch_data_0

    .line 485
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown width mode is set: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 461
    :sswitch_0
    if-ge v1, v5, :cond_0

    .line 462
    nop

    .line 463
    invoke-static {p4, v6}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result p4

    .line 465
    :cond_0
    invoke-static {v1, p2, p4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v6

    .line 467
    .local v6, "widthSizeAndState":I
    goto :goto_2

    .line 480
    .end local v6    # "widthSizeAndState":I
    :sswitch_1
    nop

    .line 481
    invoke-static {v5, p2, p4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v6

    .line 482
    .restart local v6    # "widthSizeAndState":I
    goto :goto_2

    .line 469
    .end local v6    # "widthSizeAndState":I
    :sswitch_2
    if-ge v1, v5, :cond_1

    .line 470
    nop

    .line 471
    invoke-static {p4, v6}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result p4

    goto :goto_1

    .line 473
    :cond_1
    move v1, v5

    .line 475
    :goto_1
    invoke-static {v1, p2, p4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v6

    .line 477
    .restart local v6    # "widthSizeAndState":I
    nop

    .line 488
    :goto_2
    const/16 v7, 0x100

    sparse-switch v2, :sswitch_data_1

    .line 516
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unknown height mode is set: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 490
    :sswitch_3
    if-ge v3, v4, :cond_2

    .line 491
    invoke-static {p4, v7}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result p4

    .line 495
    :cond_2
    invoke-static {v3, p3, p4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v7

    .line 497
    .local v7, "heightSizeAndState":I
    goto :goto_4

    .line 511
    .end local v7    # "heightSizeAndState":I
    :sswitch_4
    invoke-static {v4, p3, p4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v7

    .line 513
    .restart local v7    # "heightSizeAndState":I
    goto :goto_4

    .line 499
    .end local v7    # "heightSizeAndState":I
    :sswitch_5
    if-ge v3, v4, :cond_3

    .line 500
    invoke-static {p4, v7}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result p4

    goto :goto_3

    .line 504
    :cond_3
    move v3, v4

    .line 506
    :goto_3
    invoke-static {v3, p3, p4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v7

    .line 508
    .restart local v7    # "heightSizeAndState":I
    nop

    .line 518
    :goto_4
    invoke-virtual {p0, v6, v7}, Lcom/google/android/flexbox/FlexboxLayout;->setMeasuredDimension(II)V

    .line 519
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_2
        0x0 -> :sswitch_1
        0x40000000 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        -0x80000000 -> :sswitch_5
        0x0 -> :sswitch_4
        0x40000000 -> :sswitch_3
    .end sparse-switch
.end method

.method private setWillNotDrawFlag()V
    .locals 1

    .line 1465
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 1466
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/flexbox/FlexboxLayout;->setWillNotDraw(Z)V

    goto :goto_0

    .line 1468
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/flexbox/FlexboxLayout;->setWillNotDraw(Z)V

    .line 1470
    :goto_0
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 2
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "child",
            "index",
            "params"
        }
    .end annotation

    .line 321
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mOrderCache:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    .line 322
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getChildCount()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mOrderCache:Landroid/util/SparseIntArray;

    .line 328
    :cond_0
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mOrderCache:Landroid/util/SparseIntArray;

    .line 329
    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/google/android/flexbox/FlexboxHelper;->createReorderedIndices(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Landroid/util/SparseIntArray;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mReorderedIndices:[I

    .line 330
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 331
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "p"
        }
    .end annotation

    .line 1128
    instance-of v0, p1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    return v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "attrs"
        }
    .end annotation

    .line 78
    invoke-virtual {p0, p1}, Lcom/google/android/flexbox/FlexboxLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lp"
        }
    .end annotation

    .line 1138
    instance-of v0, p1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    if-eqz v0, :cond_0

    .line 1139
    new-instance v0, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    move-object v1, p1

    check-cast v1, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    invoke-direct {v0, v1}, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;-><init>(Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;)V

    return-object v0

    .line 1140
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1

    .line 1141
    new-instance v0, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    .line 1143
    :cond_1
    new-instance v0, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "attrs"
        }
    .end annotation

    .line 1133
    new-instance v0, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/google/android/flexbox/FlexboxLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public getAlignContent()I
    .locals 1

    .line 1205
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignContent:I

    return v0
.end method

.method public getAlignItems()I
    .locals 1

    .line 1191
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignItems:I

    return v0
.end method

.method public getChildHeightMeasureSpec(III)I
    .locals 1
    .param p1, "heightSpec"    # I
    .param p2, "padding"    # I
    .param p3, "childDimension"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "heightSpec",
            "padding",
            "childDimension"
        }
    .end annotation

    .line 1299
    invoke-static {p1, p2, p3}, Lcom/google/android/flexbox/FlexboxLayout;->getChildMeasureSpec(III)I

    move-result v0

    return v0
.end method

.method public getChildWidthMeasureSpec(III)I
    .locals 1
    .param p1, "widthSpec"    # I
    .param p2, "padding"    # I
    .param p3, "childDimension"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "widthSpec",
            "padding",
            "childDimension"
        }
    .end annotation

    .line 1294
    invoke-static {p1, p2, p3}, Lcom/google/android/flexbox/FlexboxLayout;->getChildMeasureSpec(III)I

    move-result v0

    return v0
.end method

.method public getDecorationLengthCrossAxis(Landroid/view/View;)I
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 1272
    const/4 v0, 0x0

    return v0
.end method

.method public getDecorationLengthMainAxis(Landroid/view/View;II)I
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "indexInFlexLine"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "view",
            "index",
            "indexInFlexLine"
        }
    .end annotation

    .line 1249
    const/4 v0, 0x0

    .line 1250
    .local v0, "decorationLength":I
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1251
    invoke-direct {p0, p2, p3}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeChildAtAlongMainAxis(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1252
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v0, v1

    .line 1254
    :cond_0
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/lit8 v1, v1, 0x4

    if-lez v1, :cond_3

    .line 1255
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v0, v1

    goto :goto_0

    .line 1258
    :cond_1
    invoke-direct {p0, p2, p3}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeChildAtAlongMainAxis(II)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1259
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v0, v1

    .line 1261
    :cond_2
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/lit8 v1, v1, 0x4

    if-lez v1, :cond_3

    .line 1262
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v0, v1

    .line 1265
    :cond_3
    :goto_0
    return v0
.end method

.method public getDividerDrawableHorizontal()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1339
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getDividerDrawableVertical()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1350
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getFlexDirection()I
    .locals 1

    .line 1149
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    return v0
.end method

.method public getFlexItemAt(I)Landroid/view/View;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 295
    invoke-virtual {p0, p1}, Lcom/google/android/flexbox/FlexboxLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getFlexItemCount()I
    .locals 1

    .line 290
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getFlexLines()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/flexbox/FlexLine;",
            ">;"
        }
    .end annotation

    .line 1237
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1238
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/flexbox/FlexLine;>;"
    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/flexbox/FlexLine;

    .line 1239
    .local v2, "flexLine":Lcom/google/android/flexbox/FlexLine;
    invoke-virtual {v2}, Lcom/google/android/flexbox/FlexLine;->getItemCountNotGone()I

    move-result v3

    if-nez v3, :cond_0

    .line 1240
    goto :goto_0

    .line 1242
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1243
    .end local v2    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    goto :goto_0

    .line 1244
    :cond_1
    return-object v0
.end method

.method public getFlexLinesInternal()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/flexbox/FlexLine;",
            ">;"
        }
    .end annotation

    .line 1323
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    return-object v0
.end method

.method public getFlexWrap()I
    .locals 1

    .line 1163
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    return v0
.end method

.method public getJustifyContent()I
    .locals 1

    .line 1177
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mJustifyContent:I

    return v0
.end method

.method public getLargestMainSize()I
    .locals 4

    .line 523
    const/high16 v0, -0x80000000

    .line 524
    .local v0, "largestSize":I
    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/flexbox/FlexLine;

    .line 525
    .local v2, "flexLine":Lcom/google/android/flexbox/FlexLine;
    iget v3, v2, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 526
    .end local v2    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    goto :goto_0

    .line 527
    :cond_0
    return v0
.end method

.method public getMaxLine()I
    .locals 1

    .line 1218
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mMaxLine:I

    return v0
.end method

.method public getReorderedChildAt(I)Landroid/view/View;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 308
    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mReorderedIndices:[I

    array-length v0, v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 311
    :cond_0
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mReorderedIndices:[I

    aget v0, v0, p1

    invoke-virtual {p0, v0}, Lcom/google/android/flexbox/FlexboxLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0

    .line 309
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getReorderedFlexItemAt(I)Landroid/view/View;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 316
    invoke-virtual {p0, p1}, Lcom/google/android/flexbox/FlexboxLayout;->getReorderedChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getShowDividerHorizontal()I
    .locals 1

    .line 1416
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    return v0
.end method

.method public getShowDividerVertical()I
    .locals 1

    .line 1411
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    return v0
.end method

.method public getSumOfCrossSize()I
    .locals 5

    .line 532
    const/4 v0, 0x0

    .line 533
    .local v0, "sum":I
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_4

    .line 534
    iget-object v3, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/flexbox/FlexLine;

    .line 537
    .local v3, "flexLine":Lcom/google/android/flexbox/FlexLine;
    invoke-direct {p0, v1}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeFlexLine(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 538
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 539
    iget v4, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v0, v4

    goto :goto_1

    .line 541
    :cond_0
    iget v4, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v0, v4

    .line 546
    :cond_1
    :goto_1
    invoke-direct {p0, v1}, Lcom/google/android/flexbox/FlexboxLayout;->hasEndDividerAfterFlexLine(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 547
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 548
    iget v4, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v0, v4

    goto :goto_2

    .line 550
    :cond_2
    iget v4, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v0, v4

    .line 553
    :cond_3
    :goto_2
    iget v4, v3, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    add-int/2addr v0, v4

    .line 533
    .end local v3    # "flexLine":Lcom/google/android/flexbox/FlexLine;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 555
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_4
    return v0
.end method

.method public isMainAxisDirectionHorizontal()Z
    .locals 2

    .line 560
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "canvas"
        }
    .end annotation

    .line 905
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 906
    return-void

    .line 908
    :cond_0
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    if-nez v0, :cond_1

    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    if-nez v0, :cond_1

    .line 910
    return-void

    .line 913
    :cond_1
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    .line 915
    .local v0, "layoutDirection":I
    const/4 v1, 0x0

    .line 916
    .local v1, "fromBottomToTop":Z
    iget v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v2, :pswitch_data_0

    goto :goto_3

    .line 939
    :pswitch_0
    if-ne v0, v5, :cond_2

    move v2, v5

    goto :goto_0

    :cond_2
    move v2, v4

    .line 940
    .local v2, "isRtl":Z
    :goto_0
    iget v6, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    if-ne v6, v3, :cond_4

    .line 941
    if-nez v2, :cond_3

    move v4, v5

    :cond_3
    move v2, v4

    .line 943
    :cond_4
    invoke-direct {p0, p1, v2, v5}, Lcom/google/android/flexbox/FlexboxLayout;->drawDividersVertical(Landroid/graphics/Canvas;ZZ)V

    goto :goto_3

    .line 932
    .end local v2    # "isRtl":Z
    :pswitch_1
    if-ne v0, v5, :cond_5

    move v2, v5

    goto :goto_1

    :cond_5
    move v2, v4

    .line 933
    .restart local v2    # "isRtl":Z
    :goto_1
    iget v6, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    if-ne v6, v3, :cond_7

    .line 934
    if-nez v2, :cond_6

    goto :goto_2

    :cond_6
    move v5, v4

    :goto_2
    move v2, v5

    .line 936
    :cond_7
    invoke-direct {p0, p1, v2, v4}, Lcom/google/android/flexbox/FlexboxLayout;->drawDividersVertical(Landroid/graphics/Canvas;ZZ)V

    .line 937
    goto :goto_3

    .line 925
    .end local v2    # "isRtl":Z
    :pswitch_2
    if-eq v0, v5, :cond_8

    move v4, v5

    .line 926
    .local v4, "isRtl":Z
    :cond_8
    iget v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    if-ne v2, v3, :cond_9

    .line 927
    const/4 v1, 0x1

    .line 929
    :cond_9
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/flexbox/FlexboxLayout;->drawDividersHorizontal(Landroid/graphics/Canvas;ZZ)V

    .line 930
    goto :goto_3

    .line 918
    .end local v4    # "isRtl":Z
    :pswitch_3
    if-ne v0, v5, :cond_a

    move v4, v5

    .line 919
    .restart local v4    # "isRtl":Z
    :cond_a
    iget v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    if-ne v2, v3, :cond_b

    .line 920
    const/4 v1, 0x1

    .line 922
    :cond_b
    invoke-direct {p0, p1, v4, v1}, Lcom/google/android/flexbox/FlexboxLayout;->drawDividersHorizontal(Landroid/graphics/Canvas;ZZ)V

    .line 923
    nop

    .line 946
    .end local v4    # "isRtl":Z
    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 8
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "changed",
            "left",
            "top",
            "right",
            "bottom"
        }
    .end annotation

    .line 565
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v7

    .line 567
    .local v7, "layoutDirection":I
    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v1, :pswitch_data_0

    .line 591
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid flex direction is set: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 584
    :pswitch_0
    if-ne v7, v4, :cond_0

    move v1, v4

    goto :goto_0

    :cond_0
    move v1, v3

    .line 585
    .local v1, "isRtl":Z
    :goto_0
    iget v5, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    if-ne v5, v2, :cond_2

    .line 586
    if-nez v1, :cond_1

    move v3, v4

    :cond_1
    move v1, v3

    .line 588
    :cond_2
    const/4 v2, 0x1

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/flexbox/FlexboxLayout;->layoutVertical(ZZIIII)V

    .line 589
    goto :goto_4

    .line 577
    .end local v1    # "isRtl":Z
    :pswitch_1
    if-ne v7, v4, :cond_3

    move v1, v4

    goto :goto_1

    :cond_3
    move v1, v3

    .line 578
    .restart local v1    # "isRtl":Z
    :goto_1
    iget v5, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    if-ne v5, v2, :cond_5

    .line 579
    if-nez v1, :cond_4

    move v3, v4

    :cond_4
    move v1, v3

    .line 581
    :cond_5
    const/4 v2, 0x0

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/flexbox/FlexboxLayout;->layoutVertical(ZZIIII)V

    .line 582
    goto :goto_4

    .line 573
    .end local v1    # "isRtl":Z
    :pswitch_2
    if-eq v7, v4, :cond_6

    move v1, v4

    goto :goto_2

    :cond_6
    move v1, v3

    .line 574
    .restart local v1    # "isRtl":Z
    :goto_2
    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/google/android/flexbox/FlexboxLayout;->layoutHorizontal(ZIIII)V

    .line 575
    goto :goto_4

    .line 569
    .end local v1    # "isRtl":Z
    :pswitch_3
    if-ne v7, v4, :cond_7

    move v1, v4

    goto :goto_3

    :cond_7
    move v1, v3

    .line 570
    .restart local v1    # "isRtl":Z
    :goto_3
    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/google/android/flexbox/FlexboxLayout;->layoutHorizontal(ZIIII)V

    .line 571
    nop

    .line 593
    :goto_4
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "widthMeasureSpec",
            "heightMeasureSpec"
        }
    .end annotation

    .line 264
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mOrderCache:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    .line 265
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->getChildCount()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mOrderCache:Landroid/util/SparseIntArray;

    .line 267
    :cond_0
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mOrderCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0, v1}, Lcom/google/android/flexbox/FlexboxHelper;->isOrderChangedFromLastMeasurement(Landroid/util/SparseIntArray;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 268
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexboxHelper:Lcom/google/android/flexbox/FlexboxHelper;

    iget-object v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mOrderCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0, v1}, Lcom/google/android/flexbox/FlexboxHelper;->createReorderedIndices(Landroid/util/SparseIntArray;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mReorderedIndices:[I

    .line 273
    :cond_1
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    packed-switch v0, :pswitch_data_0

    .line 283
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid value for the flex direction is set: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 280
    :pswitch_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/flexbox/FlexboxLayout;->measureVertical(II)V

    .line 281
    goto :goto_0

    .line 276
    :pswitch_1
    invoke-direct {p0, p1, p2}, Lcom/google/android/flexbox/FlexboxLayout;->measureHorizontal(II)V

    .line 277
    nop

    .line 286
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onNewFlexItemAdded(Landroid/view/View;IILcom/google/android/flexbox/FlexLine;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "indexInFlexLine"    # I
    .param p4, "flexLine"    # Lcom/google/android/flexbox/FlexLine;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "view",
            "index",
            "indexInFlexLine",
            "flexLine"
        }
    .end annotation

    .line 1305
    invoke-direct {p0, p2, p3}, Lcom/google/android/flexbox/FlexboxLayout;->hasDividerBeforeChildAtAlongMainAxis(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1306
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1307
    iget v0, p4, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v0, v1

    iput v0, p4, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    .line 1308
    iget v0, p4, Lcom/google/android/flexbox/FlexLine;->mDividerLengthInMainSize:I

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v0, v1

    iput v0, p4, Lcom/google/android/flexbox/FlexLine;->mDividerLengthInMainSize:I

    goto :goto_0

    .line 1310
    :cond_0
    iget v0, p4, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v0, v1

    iput v0, p4, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    .line 1311
    iget v0, p4, Lcom/google/android/flexbox/FlexLine;->mDividerLengthInMainSize:I

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v0, v1

    iput v0, p4, Lcom/google/android/flexbox/FlexLine;->mDividerLengthInMainSize:I

    .line 1314
    :cond_1
    :goto_0
    return-void
.end method

.method public onNewFlexLineAdded(Lcom/google/android/flexbox/FlexLine;)V
    .locals 2
    .param p1, "flexLine"    # Lcom/google/android/flexbox/FlexLine;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flexLine"
        }
    .end annotation

    .line 1279
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->isMainAxisDirectionHorizontal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1280
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    and-int/lit8 v0, v0, 0x4

    if-lez v0, :cond_1

    .line 1281
    iget v0, p1, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v0, v1

    iput v0, p1, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    .line 1282
    iget v0, p1, Lcom/google/android/flexbox/FlexLine;->mDividerLengthInMainSize:I

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    add-int/2addr v0, v1

    iput v0, p1, Lcom/google/android/flexbox/FlexLine;->mDividerLengthInMainSize:I

    goto :goto_0

    .line 1285
    :cond_0
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    and-int/lit8 v0, v0, 0x4

    if-lez v0, :cond_1

    .line 1286
    iget v0, p1, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v0, v1

    iput v0, p1, Lcom/google/android/flexbox/FlexLine;->mMainSize:I

    .line 1287
    iget v0, p1, Lcom/google/android/flexbox/FlexLine;->mDividerLengthInMainSize:I

    iget v1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    add-int/2addr v0, v1

    iput v0, p1, Lcom/google/android/flexbox/FlexLine;->mDividerLengthInMainSize:I

    .line 1290
    :cond_1
    :goto_0
    return-void
.end method

.method public setAlignContent(I)V
    .locals 1
    .param p1, "alignContent"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "alignContent"
        }
    .end annotation

    .line 1210
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignContent:I

    if-eq v0, p1, :cond_0

    .line 1211
    iput p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignContent:I

    .line 1212
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1214
    :cond_0
    return-void
.end method

.method public setAlignItems(I)V
    .locals 1
    .param p1, "alignItems"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "alignItems"
        }
    .end annotation

    .line 1196
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignItems:I

    if-eq v0, p1, :cond_0

    .line 1197
    iput p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mAlignItems:I

    .line 1198
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1200
    :cond_0
    return-void
.end method

.method public setDividerDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "divider"
        }
    .end annotation

    .line 1361
    invoke-virtual {p0, p1}, Lcom/google/android/flexbox/FlexboxLayout;->setDividerDrawableHorizontal(Landroid/graphics/drawable/Drawable;)V

    .line 1362
    invoke-virtual {p0, p1}, Lcom/google/android/flexbox/FlexboxLayout;->setDividerDrawableVertical(Landroid/graphics/drawable/Drawable;)V

    .line 1363
    return-void
.end method

.method public setDividerDrawableHorizontal(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "divider"
        }
    .end annotation

    .line 1374
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

    .line 1375
    return-void

    .line 1377
    :cond_0
    iput-object p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableHorizontal:Landroid/graphics/drawable/Drawable;

    .line 1378
    if-eqz p1, :cond_1

    .line 1379
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    goto :goto_0

    .line 1381
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerHorizontalHeight:I

    .line 1383
    :goto_0
    invoke-direct {p0}, Lcom/google/android/flexbox/FlexboxLayout;->setWillNotDrawFlag()V

    .line 1384
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1385
    return-void
.end method

.method public setDividerDrawableVertical(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "divider"
        }
    .end annotation

    .line 1396
    iget-object v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

    .line 1397
    return-void

    .line 1399
    :cond_0
    iput-object p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerDrawableVertical:Landroid/graphics/drawable/Drawable;

    .line 1400
    if-eqz p1, :cond_1

    .line 1401
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    goto :goto_0

    .line 1403
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mDividerVerticalWidth:I

    .line 1405
    :goto_0
    invoke-direct {p0}, Lcom/google/android/flexbox/FlexboxLayout;->setWillNotDrawFlag()V

    .line 1406
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1407
    return-void
.end method

.method public setFlexDirection(I)V
    .locals 1
    .param p1, "flexDirection"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flexDirection"
        }
    .end annotation

    .line 1154
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    if-eq v0, p1, :cond_0

    .line 1155
    iput p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexDirection:I

    .line 1156
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1158
    :cond_0
    return-void
.end method

.method public setFlexLines(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flexLines"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/flexbox/FlexLine;",
            ">;)V"
        }
    .end annotation

    .line 1318
    .local p1, "flexLines":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/flexbox/FlexLine;>;"
    iput-object p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexLines:Ljava/util/List;

    .line 1319
    return-void
.end method

.method public setFlexWrap(I)V
    .locals 1
    .param p1, "flexWrap"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flexWrap"
        }
    .end annotation

    .line 1168
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    if-eq v0, p1, :cond_0

    .line 1169
    iput p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mFlexWrap:I

    .line 1170
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1172
    :cond_0
    return-void
.end method

.method public setJustifyContent(I)V
    .locals 1
    .param p1, "justifyContent"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "justifyContent"
        }
    .end annotation

    .line 1182
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mJustifyContent:I

    if-eq v0, p1, :cond_0

    .line 1183
    iput p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mJustifyContent:I

    .line 1184
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1186
    :cond_0
    return-void
.end method

.method public setMaxLine(I)V
    .locals 1
    .param p1, "maxLine"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "maxLine"
        }
    .end annotation

    .line 1223
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mMaxLine:I

    if-eq v0, p1, :cond_0

    .line 1224
    iput p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mMaxLine:I

    .line 1225
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1227
    :cond_0
    return-void
.end method

.method public setShowDivider(I)V
    .locals 0
    .param p1, "dividerMode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dividerMode"
        }
    .end annotation

    .line 1430
    invoke-virtual {p0, p1}, Lcom/google/android/flexbox/FlexboxLayout;->setShowDividerVertical(I)V

    .line 1431
    invoke-virtual {p0, p1}, Lcom/google/android/flexbox/FlexboxLayout;->setShowDividerHorizontal(I)V

    .line 1432
    return-void
.end method

.method public setShowDividerHorizontal(I)V
    .locals 1
    .param p1, "dividerMode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dividerMode"
        }
    .end annotation

    .line 1458
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    if-eq p1, v0, :cond_0

    .line 1459
    iput p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerHorizontal:I

    .line 1460
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1462
    :cond_0
    return-void
.end method

.method public setShowDividerVertical(I)V
    .locals 1
    .param p1, "dividerMode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dividerMode"
        }
    .end annotation

    .line 1443
    iget v0, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    if-eq p1, v0, :cond_0

    .line 1444
    iput p1, p0, Lcom/google/android/flexbox/FlexboxLayout;->mShowDividerVertical:I

    .line 1445
    invoke-virtual {p0}, Lcom/google/android/flexbox/FlexboxLayout;->requestLayout()V

    .line 1447
    :cond_0
    return-void
.end method

.method public updateViewCache(ILandroid/view/View;)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "position",
            "view"
        }
    .end annotation

    .line 1329
    return-void
.end method
