.class Lorg/chromium/base/ApiCompatibilityUtils$ApisQ;
.super Ljava/lang/Object;
.source "ApiCompatibilityUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/ApiCompatibilityUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ApisQ"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getTargetableDisplayIds(Landroid/app/Activity;)Ljava/util/List;
    .locals 10
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .local v0, "displayList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-nez p0, :cond_0

    return-object v0

    .line 67
    :cond_0
    nop

    .line 68
    const-string v1, "display"

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    .line 69
    .local v1, "displayManager":Landroid/hardware/display/DisplayManager;
    if-nez v1, :cond_1

    return-object v0

    .line 70
    :cond_1
    invoke-virtual {v1}, Landroid/hardware/display/DisplayManager;->getDisplays()[Landroid/view/Display;

    move-result-object v2

    .line 71
    .local v2, "displays":[Landroid/view/Display;
    nop

    .line 72
    const-string v3, "activity"

    invoke-virtual {p0, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager;

    .line 73
    .local v3, "am":Landroid/app/ActivityManager;
    array-length v4, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_3

    aget-object v6, v2, v5

    .line 74
    .local v6, "display":Landroid/view/Display;
    invoke-virtual {v6}, Landroid/view/Display;->getState()I

    move-result v7

    const/4 v8, 0x2

    if-ne v7, v8, :cond_2

    .line 75
    invoke-virtual {v6}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    new-instance v8, Landroid/content/Intent;

    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-direct {v8, p0, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 75
    invoke-virtual {v3, p0, v7, v8}, Landroid/app/ActivityManager;->isActivityStartAllowedOnDisplay(Landroid/content/Context;ILandroid/content/Intent;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 77
    invoke-virtual {v6}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .end local v6    # "display":Landroid/view/Display;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 80
    :cond_3
    return-object v0
.end method

.method static isRunningInUserTestHarness()Z
    .locals 1

    .line 61
    invoke-static {}, Landroid/app/ActivityManager;->isRunningInUserTestHarness()Z

    move-result v0

    return v0
.end method
