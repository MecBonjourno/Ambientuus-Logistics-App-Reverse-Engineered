.class public Lorg/chromium/base/PackageManagerUtils;
.super Ljava/lang/Object;
.source "PackageManagerUtils.java"


# static fields
.field public static final BROWSER_INTENT:Landroid/content/Intent;

.field private static final TAG:Ljava/lang/String; = "PackageManagerUtils"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 25
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 26
    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 27
    const-string v1, "android.intent.category.BROWSABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 28
    const-string v1, "http"

    const-string v2, ""

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/PackageManagerUtils;->BROWSER_INTENT:Landroid/content/Intent;

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canResolveActivity(Landroid/content/Intent;)Z
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .line 85
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/PackageManagerUtils;->canResolveActivity(Landroid/content/Intent;I)Z

    move-result v0

    return v0
.end method

.method public static canResolveActivity(Landroid/content/Intent;I)Z
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;
    .param p1, "flags"    # I

    .line 76
    invoke-static {p0, p1}, Lorg/chromium/base/PackageManagerUtils;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static getQueryInstalledHomeLaunchersIntent()Landroid/content/Intent;
    .locals 2

    .line 92
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method private static handleExpectedExceptionsOrRethrow(Ljava/lang/RuntimeException;Landroid/content/Intent;)V
    .locals 3
    .param p0, "e"    # Ljava/lang/RuntimeException;
    .param p1, "intent"    # Landroid/content/Intent;

    .line 126
    instance-of v0, p0, Ljava/lang/NullPointerException;

    if-nez v0, :cond_1

    .line 127
    invoke-virtual {p0}, Ljava/lang/RuntimeException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Landroid/os/TransactionTooLargeException;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 130
    :cond_0
    throw p0

    .line 128
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not resolve Activity for intent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PackageManagerUtils"

    invoke-static {v1, v0, p0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 132
    return-void
.end method

.method public static queryAllLaunchersInfo()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .line 121
    invoke-static {}, Lorg/chromium/base/PackageManagerUtils;->getQueryInstalledHomeLaunchersIntent()Landroid/content/Intent;

    move-result-object v0

    .line 120
    const/high16 v1, 0x20000

    invoke-static {v0, v1}, Lorg/chromium/base/PackageManagerUtils;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static queryAllWebBrowsersInfo()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .line 111
    const/high16 v0, 0xf0000

    .line 113
    .local v0, "flags":I
    sget-object v1, Lorg/chromium/base/PackageManagerUtils;->BROWSER_INTENT:Landroid/content/Intent;

    invoke-static {v1, v0}, Lorg/chromium/base/PackageManagerUtils;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;
    .locals 3
    .param p0, "intent"    # Landroid/content/Intent;
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "I)",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .line 61
    :try_start_0
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskReads()Lorg/chromium/base/StrictModeContext;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .local v0, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_1
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 63
    .local v1, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v1, p0, p1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    if-eqz v0, :cond_0

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 63
    :cond_0
    return-object v2

    .line 61
    .end local v1    # "pm":Landroid/content/pm/PackageManager;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_3
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "intent":Landroid/content/Intent;
    .end local p1    # "flags":I
    :cond_1
    :goto_0
    throw v1
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    .line 64
    .end local v0    # "ignored":Lorg/chromium/base/StrictModeContext;
    .restart local p0    # "intent":Landroid/content/Intent;
    .restart local p1    # "flags":I
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-static {v0, p0}, Lorg/chromium/base/PackageManagerUtils;->handleExpectedExceptionsOrRethrow(Ljava/lang/RuntimeException;Landroid/content/Intent;)V

    .line 67
    .end local v0    # "e":Ljava/lang/RuntimeException;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;
    .locals 3
    .param p0, "intent"    # Landroid/content/Intent;
    .param p1, "flags"    # I

    .line 43
    :try_start_0
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskWrites()Lorg/chromium/base/StrictModeContext;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .local v0, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_1
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 45
    .local v1, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v1, p0, p1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    if-eqz v0, :cond_0

    :try_start_2
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 45
    :cond_0
    return-object v2

    .line 43
    .end local v1    # "pm":Landroid/content/pm/PackageManager;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_3
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "intent":Landroid/content/Intent;
    .end local p1    # "flags":I
    :cond_1
    :goto_0
    throw v1
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    .line 46
    .end local v0    # "ignored":Lorg/chromium/base/StrictModeContext;
    .restart local p0    # "intent":Landroid/content/Intent;
    .restart local p1    # "flags":I
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-static {v0, p0}, Lorg/chromium/base/PackageManagerUtils;->handleExpectedExceptionsOrRethrow(Ljava/lang/RuntimeException;Landroid/content/Intent;)V

    .line 49
    .end local v0    # "e":Ljava/lang/RuntimeException;
    const/4 v0, 0x0

    return-object v0
.end method

.method public static resolveDefaultWebBrowserActivity()Landroid/content/pm/ResolveInfo;
    .locals 2

    .line 99
    sget-object v0, Lorg/chromium/base/PackageManagerUtils;->BROWSER_INTENT:Landroid/content/Intent;

    const/high16 v1, 0x10000

    invoke-static {v0, v1}, Lorg/chromium/base/PackageManagerUtils;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    return-object v0
.end method
