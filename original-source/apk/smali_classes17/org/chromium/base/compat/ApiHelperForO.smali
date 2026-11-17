.class public final Lorg/chromium/base/compat/ApiHelperForO;
.super Ljava/lang/Object;
.source "ApiHelperForO.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addItem(Landroid/content/ClipData;Landroid/content/ContentResolver;Landroid/content/ClipData$Item;)V
    .locals 0
    .param p0, "clipData"    # Landroid/content/ClipData;
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
    .param p2, "item"    # Landroid/content/ClipData$Item;

    .line 146
    invoke-virtual {p0, p1, p2}, Landroid/content/ClipData;->addItem(Landroid/content/ContentResolver;Landroid/content/ClipData$Item;)V

    .line 147
    return-void
.end method

.method public static areAnimatorsEnabled()Z
    .locals 1

    .line 105
    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    return v0
.end method

.method public static cancelAutofillSession(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .line 89
    const-class v0, Landroid/view/autofill/AutofillManager;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/autofill/AutofillManager;

    .line 90
    .local v0, "afm":Landroid/view/autofill/AutofillManager;
    if-eqz v0, :cond_0

    .line 91
    invoke-virtual {v0}, Landroid/view/autofill/AutofillManager;->cancel()V

    .line 93
    :cond_0
    return-void
.end method

.method public static createContextForSplit(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 80
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskReads()Lorg/chromium/base/StrictModeContext;

    move-result-object v0

    .line 81
    .local v0, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->createContextForSplit(Ljava/lang/String;)Landroid/content/Context;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 81
    :cond_0
    return-object v1

    .line 80
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method

.method public static getNotificationChannelId(Landroid/app/Notification;)Ljava/lang/String;
    .locals 1
    .param p0, "notification"    # Landroid/app/Notification;

    .line 131
    invoke-virtual {p0}, Landroid/app/Notification;->getChannelId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTimestamp(Landroid/content/ClipDescription;)J
    .locals 2
    .param p0, "clipDescription"    # Landroid/content/ClipDescription;

    .line 69
    invoke-virtual {p0}, Landroid/content/ClipDescription;->getTimestamp()J

    move-result-wide v0

    return-wide v0
.end method

.method public static isInstantApp(Landroid/content/pm/PackageManager;)Z
    .locals 1
    .param p0, "packageManager"    # Landroid/content/pm/PackageManager;

    .line 59
    invoke-virtual {p0}, Landroid/content/pm/PackageManager;->isInstantApp()Z

    move-result v0

    return v0
.end method

.method public static isScreenWideColorGamut(Landroid/content/res/Configuration;)Z
    .locals 1
    .param p0, "configuration"    # Landroid/content/res/Configuration;

    .line 54
    invoke-virtual {p0}, Landroid/content/res/Configuration;->isScreenWideColorGamut()Z

    move-result v0

    return v0
.end method

.method public static isWideColorGamut(Landroid/view/Display;)Z
    .locals 1
    .param p0, "display"    # Landroid/view/Display;

    .line 44
    invoke-virtual {p0}, Landroid/view/Display;->isWideColorGamut()Z

    move-result v0

    return v0
.end method

.method public static notifyValueChangedForAutofill(Landroid/view/View;)V
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Landroid/view/autofill/AutofillManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/autofill/AutofillManager;

    .line 98
    .local v0, "afm":Landroid/view/autofill/AutofillManager;
    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {v0, p0}, Landroid/view/autofill/AutofillManager;->notifyValueChanged(Landroid/view/View;)V

    .line 101
    :cond_0
    return-void
.end method

.method public static registerDefaultNetworkCallback(Landroid/net/ConnectivityManager;Landroid/net/ConnectivityManager$NetworkCallback;Landroid/os/Handler;)V
    .locals 0
    .param p0, "connectivityManager"    # Landroid/net/ConnectivityManager;
    .param p1, "networkCallback"    # Landroid/net/ConnectivityManager$NetworkCallback;
    .param p2, "handler"    # Landroid/os/Handler;

    .line 126
    invoke-virtual {p0, p1, p2}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;Landroid/os/Handler;)V

    .line 127
    return-void
.end method

.method public static registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "filter"    # Landroid/content/IntentFilter;
    .param p3, "permission"    # Ljava/lang/String;
    .param p4, "scheduler"    # Landroid/os/Handler;
    .param p5, "flags"    # I

    .line 139
    invoke-virtual/range {p0 .. p5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static setChannelId(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;
    .locals 1
    .param p0, "builder"    # Landroid/app/Notification$Builder;
    .param p1, "channelId"    # Ljava/lang/String;

    .line 111
    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static setColorMode(Landroid/view/Window;I)V
    .locals 0
    .param p0, "window"    # Landroid/view/Window;
    .param p1, "colorMode"    # I

    .line 49
    invoke-virtual {p0, p1}, Landroid/view/Window;->setColorMode(I)V

    .line 50
    return-void
.end method

.method public static setDefaultFocusHighlightEnabled(Landroid/view/View;Z)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
    .param p1, "enabled"    # Z

    .line 64
    invoke-virtual {p0, p1}, Landroid/view/View;->setDefaultFocusHighlightEnabled(Z)V

    .line 65
    return-void
.end method

.method public static setTimeoutAfter(Landroid/app/Notification$Builder;J)Landroid/app/Notification$Builder;
    .locals 1
    .param p0, "builder"    # Landroid/app/Notification$Builder;
    .param p1, "ms"    # J

    .line 116
    invoke-virtual {p0, p1, p2}, Landroid/app/Notification$Builder;->setTimeoutAfter(J)Landroid/app/Notification$Builder;

    move-result-object v0

    return-object v0
.end method
