.class public Lcom/coleta/ambientuus/utils/ButtonStyles;
.super Ljava/lang/Object;
.source "ButtonStyles.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V
    .locals 3
    .param p0, "buttonB"    # Landroid/widget/Button;
    .param p1, "context"    # Landroid/content/Context;

    .line 18
    move-object v0, p0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    .line 19
    .local v0, "button":Lcom/google/android/material/button/MaterialButton;
    sget v1, Lcom/coleta/ambientuus/R$color;->verde_ambietuus:I

    invoke-static {p1, v1}, Landroidx/core/content/ContextCompat;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 20
    sget v1, Lcom/coleta/ambientuus/R$color;->white:I

    invoke-static {p1, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setTextColor(I)V

    .line 21
    sget v1, Lcom/coleta/ambientuus/R$color;->white:I

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setIconTintResource(I)V

    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/coleta/ambientuus/R$dimen;->borderRadiusDefault:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 24
    .local v1, "radius":I
    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setCornerRadius(I)V

    .line 25
    sget v2, Lcom/coleta/ambientuus/R$font;->montserrat_semibold:I

    invoke-static {p1, v2}, Landroidx/core/content/res/ResourcesCompat;->getFont(Landroid/content/Context;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 26
    .local v2, "typeface":Landroid/graphics/Typeface;
    invoke-virtual {v0, v2}, Lcom/google/android/material/button/MaterialButton;->setTypeface(Landroid/graphics/Typeface;)V

    .line 27
    return-void
.end method

.method public static aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V
    .locals 3
    .param p0, "buttonB"    # Landroid/widget/Button;
    .param p1, "context"    # Landroid/content/Context;

    .line 30
    move-object v0, p0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    .line 31
    .local v0, "button":Lcom/google/android/material/button/MaterialButton;
    sget v1, Lcom/google/android/material/R$color;->material_dynamic_neutral90:I

    invoke-static {p1, v1}, Landroidx/core/content/ContextCompat;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 32
    sget v1, Lcom/google/android/material/R$color;->material_dynamic_neutral60:I

    invoke-static {p1, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setTextColor(I)V

    .line 33
    sget v1, Lcom/google/android/material/R$color;->material_dynamic_neutral60:I

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setIconTintResource(I)V

    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/coleta/ambientuus/R$dimen;->borderRadiusDefault:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 36
    .local v1, "radius":I
    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setCornerRadius(I)V

    .line 37
    sget v2, Lcom/coleta/ambientuus/R$font;->montserrat_semibold:I

    invoke-static {p1, v2}, Landroidx/core/content/res/ResourcesCompat;->getFont(Landroid/content/Context;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 38
    .local v2, "typeface":Landroid/graphics/Typeface;
    invoke-virtual {v0, v2}, Lcom/google/android/material/button/MaterialButton;->setTypeface(Landroid/graphics/Typeface;)V

    .line 39
    return-void
.end method

.method private static dpToPx(ILandroid/content/Context;)I
    .locals 3
    .param p0, "dp"    # I
    .param p1, "context"    # Landroid/content/Context;

    .line 52
    int-to-float v0, p0

    .line 55
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 52
    const/4 v2, 0x1

    invoke-static {v2, v0, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method private static setLayoutParams(Lcom/google/android/material/button/MaterialButton;Landroid/content/Context;I)V
    .locals 3
    .param p0, "button"    # Lcom/google/android/material/button/MaterialButton;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "heightDp"    # I

    .line 42
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 44
    invoke-static {p2, p1}, Lcom/coleta/ambientuus/utils/ButtonStyles;->dpToPx(ILandroid/content/Context;)I

    move-result v1

    const/4 v2, -0x1

    invoke-direct {v0, v2, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 46
    .local v0, "params":Landroid/view/ViewGroup$MarginLayoutParams;
    const/4 v1, 0x4

    invoke-static {v1, p1}, Lcom/coleta/ambientuus/utils/ButtonStyles;->dpToPx(ILandroid/content/Context;)I

    move-result v1

    .line 47
    .local v1, "margin":I
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 48
    invoke-virtual {p0, v0}, Lcom/google/android/material/button/MaterialButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    return-void
.end method
