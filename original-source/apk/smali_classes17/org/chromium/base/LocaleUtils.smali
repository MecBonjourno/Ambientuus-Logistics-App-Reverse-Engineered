.class public Lorg/chromium/base/LocaleUtils;
.super Ljava/lang/Object;
.source "LocaleUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/LocaleUtils$ApisN;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;
    .locals 2
    .param p0, "languageTag"    # Ljava/lang/String;

    .line 113
    invoke-static {p0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    .line 114
    .local v0, "locale":Ljava/util/Locale;
    invoke-static {v0}, Lorg/chromium/base/LocaleUtils;->getUpdatedLocaleForAndroid(Ljava/util/Locale;)Ljava/util/Locale;

    move-result-object v1

    return-object v1
.end method

.method public static getConfigurationLanguage(Landroid/content/res/Configuration;)Ljava/lang/String;
    .locals 2
    .param p0, "config"    # Landroid/content/res/Configuration;

    .line 219
    iget-object v0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 220
    .local v0, "locale":Ljava/util/Locale;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    return-object v1
.end method

.method public static getContextLanguage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 229
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/LocaleUtils;->getConfigurationLanguage(Landroid/content/res/Configuration;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getDefaultCountryCode()Ljava/lang/String;
    .locals 3

    .line 204
    invoke-static {}, Lorg/chromium/base/CommandLine;->getInstance()Lorg/chromium/base/CommandLine;

    move-result-object v0

    .line 205
    .local v0, "commandLine":Lorg/chromium/base/CommandLine;
    const-string v1, "default-country-code"

    invoke-virtual {v0, v1}, Lorg/chromium/base/CommandLine;->hasSwitch(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 206
    invoke-virtual {v0, v1}, Lorg/chromium/base/CommandLine;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 207
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    .line 205
    :goto_0
    return-object v1
.end method

.method public static getDefaultLocaleListString()Ljava/lang/String;
    .locals 2

    .line 193
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    .line 194
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/LocaleUtils;->toLanguageTags(Landroid/os/LocaleList;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 196
    :cond_0
    invoke-static {}, Lorg/chromium/base/LocaleUtils;->getDefaultLocaleString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultLocaleString()Ljava/lang/String;
    .locals 1

    .line 183
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/LocaleUtils;->toLanguageTag(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUpdatedLanguageForAndroid(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "language"    # Ljava/lang/String;

    .line 83
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v0, "und"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :sswitch_1
    const-string v0, "fil"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 89
    return-object p0

    .line 87
    :pswitch_0
    const-string v0, "tl"

    return-object v0

    .line 85
    :pswitch_1
    const-string v0, ""

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x18c09 -> :sswitch_1
        0x1c4eb -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getUpdatedLanguageForChromium(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "language"    # Ljava/lang/String;

    .line 42
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v0, "gom"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :sswitch_1
    const-string v0, "tl"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_2
    const-string v0, "jw"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_3
    const-string v0, "ji"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_4
    const-string v0, "iw"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_5
    const-string v0, "in"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 56
    return-object p0

    .line 54
    :pswitch_0
    const-string v0, "fil"

    return-object v0

    .line 52
    :pswitch_1
    const-string v0, "jv"

    return-object v0

    .line 50
    :pswitch_2
    const-string v0, "yi"

    return-object v0

    .line 48
    :pswitch_3
    const-string v0, "he"

    return-object v0

    .line 46
    :pswitch_4
    const-string v0, "id"

    return-object v0

    .line 44
    :pswitch_5
    const-string v0, "kok"

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0xd25 -> :sswitch_5
        0xd2e -> :sswitch_4
        0xd3f -> :sswitch_3
        0xd4d -> :sswitch_2
        0xe78 -> :sswitch_1
        0x19085 -> :sswitch_0
    .end sparse-switch

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

.method public static getUpdatedLocaleForAndroid(Ljava/util/Locale;)Ljava/util/Locale;
    .locals 3
    .param p0, "locale"    # Ljava/util/Locale;

    .line 99
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "language":Ljava/lang/String;
    invoke-static {v0}, Lorg/chromium/base/LocaleUtils;->getUpdatedLanguageForAndroid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 101
    .local v1, "languageForAndroid":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 102
    return-object p0

    .line 104
    :cond_0
    new-instance v2, Ljava/util/Locale$Builder;

    invoke-direct {v2}, Ljava/util/Locale$Builder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/util/Locale$Builder;->setLocale(Ljava/util/Locale;)Ljava/util/Locale$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/Locale$Builder;->setLanguage(Ljava/lang/String;)Ljava/util/Locale$Builder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale$Builder;->build()Ljava/util/Locale;

    move-result-object v2

    return-object v2
.end method

.method public static getUpdatedLocaleForChromium(Ljava/util/Locale;)Ljava/util/Locale;
    .locals 3
    .param p0, "locale"    # Ljava/util/Locale;

    .line 66
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "language":Ljava/lang/String;
    invoke-static {v0}, Lorg/chromium/base/LocaleUtils;->getUpdatedLanguageForChromium(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "languageForChrome":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 69
    return-object p0

    .line 71
    :cond_0
    new-instance v2, Ljava/util/Locale$Builder;

    invoke-direct {v2}, Ljava/util/Locale$Builder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/util/Locale$Builder;->setLocale(Ljava/util/Locale;)Ljava/util/Locale$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/Locale$Builder;->setLanguage(Ljava/lang/String;)Ljava/util/Locale$Builder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale$Builder;->build()Ljava/util/Locale;

    move-result-object v2

    return-object v2
.end method

.method public static isBaseLanguageEqual(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "first"    # Ljava/lang/String;
    .param p1, "second"    # Ljava/lang/String;

    .line 173
    invoke-static {p0}, Lorg/chromium/base/LocaleUtils;->toBaseLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lorg/chromium/base/LocaleUtils;->toBaseLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static setDefaultLocalesFromConfiguration(Landroid/content/res/Configuration;)V
    .locals 2
    .param p0, "config"    # Landroid/content/res/Configuration;

    .line 251
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    .line 252
    invoke-static {p0}, Lorg/chromium/base/LocaleUtils$ApisN;->setLocaleList(Landroid/content/res/Configuration;)V

    goto :goto_0

    .line 254
    :cond_0
    iget-object v0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-static {v0}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 256
    :goto_0
    return-void
.end method

.method public static toBaseLanguage(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "languageTag"    # Ljava/lang/String;

    .line 160
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 161
    .local v0, "pos":I
    if-gez v0, :cond_0

    .line 162
    return-object p0

    .line 164
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static toLanguageTag(Ljava/util/Locale;)Ljava/lang/String;
    .locals 4
    .param p0, "locale"    # Ljava/util/Locale;

    .line 130
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/LocaleUtils;->getUpdatedLanguageForChromium(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    .local v0, "language":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    .line 132
    .local v1, "country":Ljava/lang/String;
    const-string v2, "no"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "NO"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NY"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 133
    const-string v2, "nn-NO"

    return-object v2

    .line 135
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v2, v0

    goto :goto_0

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    return-object v2
.end method

.method public static toLanguageTags(Landroid/os/LocaleList;)Ljava/lang/String;
    .locals 4
    .param p0, "localeList"    # Landroid/os/LocaleList;

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .local v0, "newLocaleList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/os/LocaleList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 148
    invoke-virtual {p0, v1}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object v2

    invoke-static {v2}, Lorg/chromium/base/LocaleUtils;->getUpdatedLocaleForChromium(Ljava/util/Locale;)Ljava/util/Locale;

    move-result-object v2

    .line 149
    .local v2, "locale":Ljava/util/Locale;
    invoke-static {v2}, Lorg/chromium/base/LocaleUtils;->toLanguageTag(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    .end local v2    # "locale":Ljava/util/Locale;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 151
    .end local v1    # "i":I
    :cond_0
    const-string v1, ","

    invoke-static {v1, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static updateConfig(Landroid/content/Context;Landroid/content/res/Configuration;Ljava/lang/String;)V
    .locals 2
    .param p0, "base"    # Landroid/content/Context;
    .param p1, "config"    # Landroid/content/res/Configuration;
    .param p2, "languageTag"    # Ljava/lang/String;

    .line 239
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    .line 240
    invoke-static {p0, p1, p2}, Lorg/chromium/base/LocaleUtils$ApisN;->setConfigLocales(Landroid/content/Context;Landroid/content/res/Configuration;Ljava/lang/String;)V

    goto :goto_0

    .line 242
    :cond_0
    invoke-static {p2}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 244
    :goto_0
    return-void
.end method
