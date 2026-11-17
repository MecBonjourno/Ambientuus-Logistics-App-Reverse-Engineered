.class public final Lorg/chromium/base/compat/ApiHelperForS;
.super Ljava/lang/Object;
.source "ApiHelperForS.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ApiHelperForS"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createWindowContext(Landroid/content/Context;Landroid/view/Display;ILandroid/os/Bundle;)Landroid/content/Context;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "display"    # Landroid/view/Display;
    .param p2, "type"    # I
    .param p3, "options"    # Landroid/os/Bundle;

    .line 108
    invoke-virtual {p0, p1, p2, p3}, Landroid/content/Context;->createWindowContext(Landroid/view/Display;ILandroid/os/Bundle;)Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public static getConfidenceScore(Landroid/content/ClipDescription;Ljava/lang/String;)F
    .locals 1
    .param p0, "clipDescription"    # Landroid/content/ClipDescription;
    .param p1, "entityType"    # Ljava/lang/String;

    .line 55
    invoke-virtual {p0, p1}, Landroid/content/ClipDescription;->getConfidenceScore(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public static getPendingIntentMutableFlag()I
    .locals 1

    .line 115
    const/high16 v0, 0x2000000

    return v0
.end method

.method public static getTextClassification(Landroid/view/textclassifier/TextSelection;)Landroid/view/textclassifier/TextClassification;
    .locals 1
    .param p0, "textSelection"    # Landroid/view/textclassifier/TextSelection;

    .line 100
    invoke-virtual {p0}, Landroid/view/textclassifier/TextSelection;->getTextClassification()Landroid/view/textclassifier/TextClassification;

    move-result-object v0

    return-object v0
.end method

.method public static getTextLinks(Landroid/content/ClipData$Item;)Landroid/view/textclassifier/TextLinks;
    .locals 1
    .param p0, "item"    # Landroid/content/ClipData$Item;

    .line 70
    invoke-virtual {p0}, Landroid/content/ClipData$Item;->getTextLinks()Landroid/view/textclassifier/TextLinks;

    move-result-object v0

    return-object v0
.end method

.method public static hasBluetoothConnectPermission()Z
    .locals 4

    .line 74
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 75
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    .line 74
    const-string v3, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {v0, v3, v1, v2}, Lorg/chromium/base/ApiCompatibilityUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isGetClassificationStatusIsComplete(Landroid/content/ClipDescription;)Z
    .locals 2
    .param p0, "clipDescription"    # Landroid/content/ClipDescription;

    .line 63
    invoke-virtual {p0}, Landroid/content/ClipDescription;->getClassificationStatus()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isStyleText(Landroid/content/ClipDescription;)Z
    .locals 1
    .param p0, "clipDescription"    # Landroid/content/ClipDescription;

    .line 47
    invoke-virtual {p0}, Landroid/content/ClipDescription;->isStyledText()Z

    move-result v0

    return v0
.end method

.method public static setAutoEnterEnabled(Landroid/app/PictureInPictureParams$Builder;Z)V
    .locals 0
    .param p0, "builder"    # Landroid/app/PictureInPictureParams$Builder;
    .param p1, "enabled"    # Z

    .line 84
    invoke-virtual {p0, p1}, Landroid/app/PictureInPictureParams$Builder;->setAutoEnterEnabled(Z)Landroid/app/PictureInPictureParams$Builder;

    .line 85
    return-void
.end method

.method public static setIncludeTextClassification(Landroid/view/textclassifier/TextSelection$Request$Builder;Z)Landroid/view/textclassifier/TextSelection$Request$Builder;
    .locals 1
    .param p0, "builder"    # Landroid/view/textclassifier/TextSelection$Request$Builder;
    .param p1, "includeTextClassification"    # Z

    .line 93
    invoke-virtual {p0, p1}, Landroid/view/textclassifier/TextSelection$Request$Builder;->setIncludeTextClassification(Z)Landroid/view/textclassifier/TextSelection$Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static startForeground(Landroid/app/Service;ILandroid/app/Notification;I)V
    .locals 4
    .param p0, "service"    # Landroid/app/Service;
    .param p1, "id"    # I
    .param p2, "notification"    # Landroid/app/Notification;
    .param p3, "foregroundServiceType"    # I

    .line 122
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;I)V
    :try_end_0
    .catch Landroid/app/ForegroundServiceStartNotAllowedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    goto :goto_0

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Landroid/app/ForegroundServiceStartNotAllowedException;
    nop

    .line 126
    invoke-virtual {p2}, Landroid/app/Notification;->getChannelId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot run service as foreground: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for notification channel "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " notification id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 124
    const-string v2, "ApiHelperForS"

    invoke-static {v2, v1}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .end local v0    # "e":Landroid/app/ForegroundServiceStartNotAllowedException;
    :goto_0
    return-void
.end method
