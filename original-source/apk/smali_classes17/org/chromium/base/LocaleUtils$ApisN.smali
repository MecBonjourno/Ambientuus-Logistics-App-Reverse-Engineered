.class Lorg/chromium/base/LocaleUtils$ApisN;
.super Ljava/lang/Object;
.source "LocaleUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/LocaleUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ApisN"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static prependToLocaleList(Ljava/lang/String;Landroid/os/LocaleList;)Landroid/os/LocaleList;
    .locals 5
    .param p0, "languageTag"    # Ljava/lang/String;
    .param p1, "localeList"    # Landroid/os/LocaleList;

    .line 282
    invoke-virtual {p1}, Landroid/os/LocaleList;->toLanguageTags()Ljava/lang/String;

    move-result-object v0

    .line 286
    .local v0, "languageList":Ljava/lang/String;
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const-string v4, "(^|,)%1$s$|%1$s,"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 287
    .local v2, "pattern":Ljava/lang/String;
    const-string v4, ""

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 289
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v3

    aput-object v0, v4, v1

    .line 290
    const-string v1, "%1$s,%2$s"

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 289
    invoke-static {v1}, Landroid/os/LocaleList;->forLanguageTags(Ljava/lang/String;)Landroid/os/LocaleList;

    move-result-object v1

    return-object v1
.end method

.method static setConfigLocales(Landroid/content/Context;Landroid/content/res/Configuration;Ljava/lang/String;)V
    .locals 1
    .param p0, "base"    # Landroid/content/Context;
    .param p1, "config"    # Landroid/content/res/Configuration;
    .param p2, "language"    # Ljava/lang/String;

    .line 265
    nop

    .line 266
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object v0

    .line 265
    invoke-static {p2, v0}, Lorg/chromium/base/LocaleUtils$ApisN;->prependToLocaleList(Ljava/lang/String;Landroid/os/LocaleList;)Landroid/os/LocaleList;

    move-result-object v0

    .line 267
    .local v0, "updatedLocales":Landroid/os/LocaleList;
    invoke-virtual {p1, v0}, Landroid/content/res/Configuration;->setLocales(Landroid/os/LocaleList;)V

    .line 268
    return-void
.end method

.method static setLocaleList(Landroid/content/res/Configuration;)V
    .locals 1
    .param p0, "config"    # Landroid/content/res/Configuration;

    .line 271
    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object v0

    invoke-static {v0}, Landroid/os/LocaleList;->setDefault(Landroid/os/LocaleList;)V

    .line 272
    return-void
.end method
