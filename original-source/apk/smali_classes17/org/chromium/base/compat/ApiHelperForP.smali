.class public final Lorg/chromium/base/compat/ApiHelperForP;
.super Ljava/lang/Object;
.source "ApiHelperForP.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static build(Landroid/view/textclassifier/TextSelection$Request$Builder;)Landroid/view/textclassifier/TextSelection$Request;
    .locals 1
    .param p0, "builder"    # Landroid/view/textclassifier/TextSelection$Request$Builder;

    .line 86
    invoke-virtual {p0}, Landroid/view/textclassifier/TextSelection$Request$Builder;->build()Landroid/view/textclassifier/TextSelection$Request;

    move-result-object v0

    return-object v0
.end method

.method public static clearPrimaryClip(Landroid/content/ClipboardManager;)V
    .locals 0
    .param p0, "clipboardManager"    # Landroid/content/ClipboardManager;

    .line 57
    invoke-virtual {p0}, Landroid/content/ClipboardManager;->clearPrimaryClip()V

    .line 58
    return-void
.end method

.method public static getLongVersionCode(Landroid/content/pm/PackageInfo;)J
    .locals 2
    .param p0, "packageInfo"    # Landroid/content/pm/PackageInfo;

    .line 42
    invoke-virtual {p0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getPrivateDnsServerName(Landroid/net/LinkProperties;)Ljava/lang/String;
    .locals 1
    .param p0, "linkProperties"    # Landroid/net/LinkProperties;

    .line 37
    invoke-virtual {p0}, Landroid/net/LinkProperties;->getPrivateDnsServerName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSignalStrength(Landroid/telephony/TelephonyManager;)Landroid/telephony/SignalStrength;
    .locals 1
    .param p0, "telephonyManager"    # Landroid/telephony/TelephonyManager;

    .line 52
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSignalStrength()Landroid/telephony/SignalStrength;

    move-result-object v0

    return-object v0
.end method

.method public static hasSigningCertificate(Landroid/content/pm/PackageManager;Ljava/lang/String;[BI)Z
    .locals 1
    .param p0, "pm"    # Landroid/content/pm/PackageManager;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "certificate"    # [B
    .param p3, "type"    # I

    .line 63
    invoke-virtual {p0, p1, p2, p3}, Landroid/content/pm/PackageManager;->hasSigningCertificate(Ljava/lang/String;[BI)Z

    move-result v0

    return v0
.end method

.method public static isLocationEnabled(Landroid/location/LocationManager;)Z
    .locals 1
    .param p0, "locationManager"    # Landroid/location/LocationManager;

    .line 47
    invoke-virtual {p0}, Landroid/location/LocationManager;->isLocationEnabled()Z

    move-result v0

    return v0
.end method

.method public static isPrivateDnsActive(Landroid/net/LinkProperties;)Z
    .locals 1
    .param p0, "linkProperties"    # Landroid/net/LinkProperties;

    .line 32
    invoke-virtual {p0}, Landroid/net/LinkProperties;->isPrivateDnsActive()Z

    move-result v0

    return v0
.end method

.method public static newTextSelectionRequestBuilder(Ljava/lang/CharSequence;II)Landroid/view/textclassifier/TextSelection$Request$Builder;
    .locals 1
    .param p0, "text"    # Ljava/lang/CharSequence;
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .line 75
    new-instance v0, Landroid/view/textclassifier/TextSelection$Request$Builder;

    invoke-direct {v0, p0, p1, p2}, Landroid/view/textclassifier/TextSelection$Request$Builder;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method

.method public static setDefaultLocales(Landroid/view/textclassifier/TextSelection$Request$Builder;Landroid/os/LocaleList;)Landroid/view/textclassifier/TextSelection$Request$Builder;
    .locals 1
    .param p0, "builder"    # Landroid/view/textclassifier/TextSelection$Request$Builder;
    .param p1, "defaultLocales"    # Landroid/os/LocaleList;

    .line 81
    invoke-virtual {p0, p1}, Landroid/view/textclassifier/TextSelection$Request$Builder;->setDefaultLocales(Landroid/os/LocaleList;)Landroid/view/textclassifier/TextSelection$Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static suggestSelection(Landroid/view/textclassifier/TextClassifier;Landroid/view/textclassifier/TextSelection$Request;)Landroid/view/textclassifier/TextSelection;
    .locals 1
    .param p0, "textClassifier"    # Landroid/view/textclassifier/TextClassifier;
    .param p1, "request"    # Landroid/view/textclassifier/TextSelection$Request;

    .line 69
    invoke-interface {p0, p1}, Landroid/view/textclassifier/TextClassifier;->suggestSelection(Landroid/view/textclassifier/TextSelection$Request;)Landroid/view/textclassifier/TextSelection;

    move-result-object v0

    return-object v0
.end method
