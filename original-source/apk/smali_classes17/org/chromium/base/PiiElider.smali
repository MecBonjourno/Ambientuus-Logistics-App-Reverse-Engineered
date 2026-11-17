.class public Lorg/chromium/base/PiiElider;
.super Ljava/lang/Object;
.source "PiiElider.java"


# static fields
.field private static final APP_NAMESPACE:[Ljava/lang/String;

.field private static final CHROME_VARIANT_INFO:Ljava/lang/String; = "chromium-[^\\.]+\\.aab"

.field private static final CONSOLE_ELISION:Ljava/lang/String; = "[ELIDED:CONSOLE(0)] ELIDED CONSOLE MESSAGE"

.field private static final CONSOLE_MSG:Ljava/util/regex/Pattern;

.field private static final DOMAIN_NAME:Ljava/lang/String; = "(([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef-]{0,61}[a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]){0,1}\\.)+[a-zA-Z\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]{2,63}|((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[0-9])))"

.field private static final EMAIL_ELISION:Ljava/lang/String; = "XXX@EMAIL.ELIDED"

.field private static final GOOD_GTLD_CHAR:Ljava/lang/String; = "a-zA-Z\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef"

.field private static final GOOD_IRI_CHAR:Ljava/lang/String; = "a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef"

.field private static final GTLD:Ljava/lang/String; = "[a-zA-Z\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]{2,63}"

.field private static final HOST_NAME:Ljava/lang/String; = "([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef-]{0,61}[a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]){0,1}\\.)+[a-zA-Z\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]{2,63}"

.field private static final INTENT:Ljava/lang/String; = "([a-zA-Z][a-zA-Z0-9+.-]+://((([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef;/?:@&=#~.+!*\'(),_-])|(%[a-fA-F0-9]{2}))+))"

.field private static final INTENT_SCHEME:Ljava/lang/String; = "[a-zA-Z][a-zA-Z0-9+.-]+://"

.field private static final IP_ADDRESS:Ljava/lang/String; = "((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[0-9]))"

.field private static final IP_ELISION:Ljava/lang/String; = "1.2.3.4"

.field private static final IRI:Ljava/lang/String; = "[a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef-]{0,61}[a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]){0,1}"

.field private static final LIKELY_EXCEPTION_LOG:Ljava/util/regex/Pattern;

.field private static final MAC_ADDRESS:Ljava/util/regex/Pattern;

.field private static final MAC_ELISION:Ljava/lang/String; = "01:23:45:67:89:AB"

.field private static final PATH_CHAR:Ljava/lang/String; = "(([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef;/?:@&=#~.+!*\'(),_-])|(%[a-fA-F0-9]{2}))"

.field private static final PATH_COMPONENT:Ljava/lang/String; = "((([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef;/?:@&=#~.+!*\'(),_-])|(%[a-fA-F0-9]{2}))+)"

.field private static final PORT:Ljava/lang/String; = "(:\\d{1,5})"

.field private static final SYSTEM_NAMESPACE:[Ljava/lang/String;

.field private static final URI_CHAR:Ljava/lang/String; = "([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2}))"

.field private static final URI_ENCODED_CHAR:Ljava/lang/String; = "(%[a-fA-F0-9]{2})"

.field private static final URI_SCHEME:Ljava/lang/String; = "((http|https|Http|Https|rtsp|Rtsp)://(([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2})){1,64}(:([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2})){1,25})?@)?)"

.field private static final URL_ELISION:Ljava/lang/String; = "HTTP://WEBADDRESS.ELIDED"

.field private static final URL_OR_INTENT:Ljava/lang/String; = "((((http|https|Http|Https|rtsp|Rtsp)://(([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2})){1,64}(:([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2})){1,25})?@)?)?(([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef-]{0,61}[a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]){0,1}\\.)+[a-zA-Z\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]{2,63}|((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[0-9])))(:\\d{1,5})?)|([a-zA-Z][a-zA-Z0-9+.-]+://((([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef;/?:@&=#~.+!*\'(),_-])|(%[a-fA-F0-9]{2}))+)))"

.field private static final URL_WITH_OPTIONAL_SCHEME_AND_PORT:Ljava/lang/String; = "(((http|https|Http|Https|rtsp|Rtsp)://(([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2})){1,64}(:([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2})){1,25})?@)?)?(([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef-]{0,61}[a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]){0,1}\\.)+[a-zA-Z\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]{2,63}|((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[0-9])))(:\\d{1,5})?)"

.field private static final WEB_URL:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 66
    nop

    .line 67
    const-string v0, "(\\b|^)(((((http|https|Http|Https|rtsp|Rtsp)://(([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2})){1,64}(:([a-zA-Z0-9$_.+!*\'(),;?&=-]|(%[a-fA-F0-9]{2})){1,25})?@)?)?(([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef-]{0,61}[a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]){0,1}\\.)+[a-zA-Z\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef]{2,63}|((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[0-9])))(:\\d{1,5})?)|([a-zA-Z][a-zA-Z0-9+.-]+://((([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef;/?:@&=#~.+!*\'(),_-])|(%[a-fA-F0-9]{2}))+))))(/(([a-zA-Z0-9\u00a0-\ud7ff\uf900-\ufdcf\ufdf0-\uffef;/?:@&=#~.+!*\'(),_-])|(%[a-fA-F0-9]{2}))*)?(\\b|$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/PiiElider;->WEB_URL:Ljava/util/regex/Pattern;

    .line 74
    const-string v0, "\\sat\\s(org\\.chromium|com\\.google|java|android|com\\.android)\\.[^ ]+.|\\(chromium-[^\\.]+\\.aab[^:]+:\\d+\\)|Caused by: java\\.lang\\.(ClassNotFoundException|NoClassDefFoundError):"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/PiiElider;->LIKELY_EXCEPTION_LOG:Ljava/util/regex/Pattern;

    .line 91
    nop

    .line 92
    const-string v0, "([0-9a-fA-F]{2}[-:]+){5}[0-9a-fA-F]{2}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/PiiElider;->MAC_ADDRESS:Ljava/util/regex/Pattern;

    .line 94
    const-string v0, "\\[\\w*:CONSOLE.*\\].*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/PiiElider;->CONSOLE_MSG:Ljava/util/regex/Pattern;

    .line 96
    const-string v0, "com.google."

    const-string v1, "com.chrome."

    const-string v2, "org.chromium."

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/PiiElider;->APP_NAMESPACE:[Ljava/lang/String;

    .line 99
    const-string v10, "org.xmlpull."

    const-string v11, "System."

    const-string v1, "android."

    const-string v2, "com.android."

    const-string v3, "dalvik."

    const-string v4, "java."

    const-string v5, "javax."

    const-string v6, "org.apache."

    const-string v7, "org.json."

    const-string v8, "org.w3c.dom."

    const-string v9, "org.xml."

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/PiiElider;->SYSTEM_NAMESPACE:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static elideConsole(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "original"    # Ljava/lang/String;

    .line 210
    sget-object v0, Lorg/chromium/base/PiiElider;->CONSOLE_MSG:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, "[ELIDED:CONSOLE(0)] ELIDED CONSOLE MESSAGE"

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static elideEmail(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "original"    # Ljava/lang/String;

    .line 111
    sget-object v0, Landroid/util/Patterns;->EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, "XXX@EMAIL.ELIDED"

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static elideIp(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "original"    # Ljava/lang/String;

    .line 188
    sget-object v0, Landroid/util/Patterns;->IP_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, "1.2.3.4"

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static elideMac(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "original"    # Ljava/lang/String;

    .line 199
    sget-object v0, Lorg/chromium/base/PiiElider;->MAC_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, "01:23:45:67:89:AB"

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static elideUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "original"    # Ljava/lang/String;

    .line 123
    sget-object v0, Lorg/chromium/base/PiiElider;->LIKELY_EXCEPTION_LOG:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 124
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .local v0, "buffer":Ljava/lang/StringBuilder;
    sget-object v1, Lorg/chromium/base/PiiElider;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 126
    .local v1, "matcher":Ljava/util/regex/Matcher;
    const/4 v2, 0x0

    .line 127
    .local v2, "start":I
    :goto_0
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 128
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    .line 129
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    .line 130
    .local v3, "end":I
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 131
    .local v4, "url":Ljava/lang/String;
    invoke-static {v4}, Lorg/chromium/base/PiiElider;->likelyToBeAppNamespace(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-static {v4}, Lorg/chromium/base/PiiElider;->likelyToBeSystemNamespace(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 132
    invoke-static {v4}, Lorg/chromium/base/PiiElider;->likelyToBeClassOrMethodName(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 133
    const-string v5, "HTTP://WEBADDRESS.ELIDED"

    invoke-virtual {v0, v2, v3, v5}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int v3, v2, v5

    .line 135
    sget-object v5, Lorg/chromium/base/PiiElider;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 137
    :cond_1
    move v2, v3

    .line 138
    .end local v3    # "end":I
    .end local v4    # "url":Ljava/lang/String;
    goto :goto_0

    .line 139
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getSanitizedStacktrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 242
    invoke-static {p0}, Lorg/chromium/base/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/PiiElider;->sanitizeStacktrace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static isClassName(Ljava/lang/String;)Z
    .locals 2
    .param p0, "url"    # Ljava/lang/String;

    .line 154
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {p0, v0, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    const/4 v0, 0x1

    return v0

    .line 156
    :catchall_0
    move-exception v1

    .line 159
    return v0
.end method

.method private static likelyToBeAppNamespace(Ljava/lang/String;)Z
    .locals 6
    .param p0, "url"    # Ljava/lang/String;

    .line 163
    sget-object v0, Lorg/chromium/base/PiiElider;->APP_NAMESPACE:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 164
    .local v4, "ns":Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 165
    const/4 v0, 0x1

    return v0

    .line 163
    .end local v4    # "ns":Ljava/lang/String;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 168
    :cond_1
    return v2
.end method

.method private static likelyToBeClassOrMethodName(Ljava/lang/String;)Z
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .line 143
    invoke-static {p0}, Lorg/chromium/base/PiiElider;->isClassName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 147
    :cond_0
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 148
    .local v0, "indexOfLastPeriod":I
    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    return v2

    .line 149
    :cond_1
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/base/PiiElider;->isClassName(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method private static likelyToBeSystemNamespace(Ljava/lang/String;)Z
    .locals 6
    .param p0, "url"    # Ljava/lang/String;

    .line 172
    sget-object v0, Lorg/chromium/base/PiiElider;->SYSTEM_NAMESPACE:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 173
    .local v4, "ns":Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 174
    const/4 v0, 0x1

    return v0

    .line 172
    .end local v4    # "ns":Ljava/lang/String;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 177
    :cond_1
    return v2
.end method

.method public static sanitizeStacktrace(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "stacktrace"    # Ljava/lang/String;

    .line 221
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    const-string v0, ""

    return-object v0

    .line 224
    :cond_0
    const-string v0, "\\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 226
    .local v0, "frames":[Ljava/lang/String;
    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-static {v2}, Lorg/chromium/base/PiiElider;->elideUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 227
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_2

    .line 229
    aget-object v2, v0, v1

    const-string v3, "Caused by:"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 230
    aget-object v2, v0, v1

    invoke-static {v2}, Lorg/chromium/base/PiiElider;->elideUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 227
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 233
    .end local v1    # "i":I
    :cond_2
    const-string v1, "\n"

    invoke-static {v1, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
