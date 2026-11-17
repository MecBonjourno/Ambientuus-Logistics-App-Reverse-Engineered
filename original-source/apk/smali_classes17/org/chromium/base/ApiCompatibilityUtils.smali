.class public Lorg/chromium/base/ApiCompatibilityUtils;
.super Ljava/lang/Object;
.source "ApiCompatibilityUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/ApiCompatibilityUtils$ApisO;,
        Lorg/chromium/base/ApiCompatibilityUtils$ApisNMR1;,
        Lorg/chromium/base/ApiCompatibilityUtils$ApisQ;,
        Lorg/chromium/base/ApiCompatibilityUtils$ApisP;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ApiCompatUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method

.method public static checkPermission(Landroid/content/Context;Ljava/lang/String;II)I
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "pid"    # I
    .param p3, "uid"    # I

    .line 232
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 233
    :catch_0
    move-exception v0

    .line 237
    .local v0, "e":Ljava/lang/RuntimeException;
    const/4 v1, -0x1

    return v1
.end method

.method public static clearHandwritingBoundsOffsetBottom(Landroid/view/View;)V
    .locals 13
    .param p0, "view"    # Landroid/view/View;

    .line 310
    invoke-static {}, Landroidx/core/os/BuildCompat;->isAtLeastU()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 315
    :cond_0
    :try_start_0
    const-class v0, Landroid/view/View;

    const-string v1, "getHandwritingBoundsOffsetTop"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    .line 316
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 318
    .local v0, "offsetTop":F
    const-class v1, Landroid/view/View;

    const-string v3, "getHandwritingBoundsOffsetLeft"

    new-array v4, v2, [Ljava/lang/Class;

    .line 319
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 321
    .local v1, "offsetLeft":F
    const-class v3, Landroid/view/View;

    const-string v4, "getHandwritingBoundsOffsetRight"

    new-array v5, v2, [Ljava/lang/Class;

    .line 322
    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    .line 324
    .local v3, "offsetRight":F
    const-class v4, Landroid/view/View;

    const-string v5, "setHandwritingBoundsOffsets"

    const/4 v6, 0x4

    new-array v7, v6, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v2

    const/4 v9, 0x1

    aput-object v8, v7, v9

    const/4 v10, 0x2

    aput-object v8, v7, v10

    const/4 v11, 0x3

    aput-object v8, v7, v11

    invoke-virtual {v4, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 326
    .local v4, "setHandwritingBoundsOffsets":Ljava/lang/reflect/Method;
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v5, v6, v2

    aput-object v7, v6, v9

    aput-object v8, v6, v10

    aput-object v12, v6, v11

    invoke-virtual {v4, p0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    nop

    .end local v0    # "offsetTop":F
    .end local v1    # "offsetLeft":F
    .end local v3    # "offsetRight":F
    .end local v4    # "setHandwritingBoundsOffsets":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 327
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_0

    :catch_3
    move-exception v0

    .line 331
    :goto_0
    return-void
.end method

.method public static createLaunchDisplayIdActivityOptions(I)Landroid/os/Bundle;
    .locals 2
    .param p0, "displayId"    # I

    .line 281
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 282
    invoke-static {p0}, Lorg/chromium/base/ApiCompatibilityUtils$ApisO;->createLaunchDisplayIdActivityOptions(I)Landroid/os/Bundle;

    move-result-object v0

    return-object v0

    .line 284
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static disableSmartSelectionTextClassifier(Landroid/widget/TextView;)V
    .locals 2
    .param p0, "textView"    # Landroid/widget/TextView;

    .line 270
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 271
    invoke-static {p0}, Lorg/chromium/base/ApiCompatibilityUtils$ApisO;->disableSmartSelectionTextClassifier(Landroid/widget/TextView;)V

    .line 273
    :cond_0
    return-void
.end method

.method public static getBitmapByUri(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 2
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 360
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 361
    invoke-static {p0, p1}, Lorg/chromium/base/ApiCompatibilityUtils$ApisP;->getBitmapByUri(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    .line 363
    :cond_0
    invoke-static {p0, p1}, Landroid/provider/MediaStore$Images$Media;->getBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static getBytesUtf8(Ljava/lang/String;)[B
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 152
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    return-object v0
.end method

.method public static getColor(Landroid/content/res/Resources;I)I
    .locals 1
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 206
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getDrawable(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 179
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/chromium/base/ApiCompatibilityUtils;->getDrawableForDensity(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public static getDrawableForDensity(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .param p2, "density"    # I

    .line 187
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0

    .line 192
    .local v0, "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    const/4 v1, 0x0

    if-nez p2, :cond_0

    .line 193
    :try_start_0
    invoke-virtual {p0, p1, v1}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 193
    return-object v1

    .line 195
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1, p2, v1}, Landroid/content/res/Resources;->getDrawableForDensity(IILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 197
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 195
    return-object v1

    .line 197
    :catchall_0
    move-exception v1

    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 198
    throw v1
.end method

.method public static getNotificationSettingsIntent()Landroid/content/Intent;
    .locals 4

    .line 160
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 161
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, "packageName":Ljava/lang/String;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_0

    .line 163
    invoke-static {v0, v1}, Lorg/chromium/base/ApiCompatibilityUtils$ApisO;->initNotificationSettingsIntent(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0

    .line 165
    :cond_0
    const-string v2, "android.settings.ACTION_APP_NOTIFICATION_SETTINGS"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 166
    const-string v2, "app_package"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 167
    nop

    .line 168
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 167
    const-string v3, "app_uid"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 170
    :goto_0
    return-object v0
.end method

.method static getProcessName()Ljava/lang/String;
    .locals 4

    .line 336
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 337
    invoke-static {}, Lorg/chromium/base/ApiCompatibilityUtils$ApisP;->getProcessName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 340
    :cond_0
    :try_start_0
    const-string v0, "android.app.ActivityThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 341
    .local v0, "activityThreadClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "currentProcessName"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 342
    .end local v0    # "activityThreadClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v0

    .line 345
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getTargetableDisplayIds(Landroid/app/Activity;)Ljava/util/List;
    .locals 2
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

    .line 259
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 260
    invoke-static {p0}, Lorg/chromium/base/ApiCompatibilityUtils$ApisQ;->getTargetableDisplayIds(Landroid/app/Activity;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 262
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public static isDemoUser()Z
    .locals 2

    .line 224
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    if-lt v0, v1, :cond_0

    invoke-static {}, Lorg/chromium/base/ApiCompatibilityUtils$ApisNMR1;->isDemoUser()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isInMultiWindowMode(Landroid/app/Activity;)Z
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .line 246
    invoke-virtual {p0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    move-result v0

    return v0
.end method

.method public static isRunningInUserTestHarness()Z
    .locals 2

    .line 350
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 351
    invoke-static {}, Lorg/chromium/base/ApiCompatibilityUtils$ApisQ;->isRunningInUserTestHarness()Z

    move-result v0

    return v0

    .line 353
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 131
    .local p0, "obj":Ljava/lang/Object;, "TT;"
    if-eqz p0, :cond_0

    .line 132
    return-object p0

    .line 131
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method public static requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 143
    .local p0, "obj":Ljava/lang/Object;, "TT;"
    if-eqz p0, :cond_0

    .line 144
    return-object p0

    .line 143
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static setActivityOptionsBackgroundActivityStartMode(Landroid/app/ActivityOptions;)V
    .locals 1
    .param p0, "options"    # Landroid/app/ActivityOptions;

    .line 296
    invoke-static {}, Landroidx/core/os/BuildCompat;->isAtLeastU()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 297
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 299
    return-void
.end method

.method public static setTextAppearance(Landroid/widget/TextView;I)V
    .locals 1
    .param p0, "view"    # Landroid/widget/TextView;
    .param p1, "id"    # I

    .line 217
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 218
    return-void
.end method
