.class public Lorg/chromium/base/PackageUtils;
.super Ljava/lang/Object;
.source "PackageUtils.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final HEX_CHAR_LOOKUP:[C

.field private static final TAG:Ljava/lang/String; = "PackageUtils"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    nop

    .line 31
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/chromium/base/PackageUtils;->HEX_CHAR_LOOKUP:[C

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    return-void
.end method

.method static byteArrayToHexString([B)Ljava/lang/String;
    .locals 4
    .param p0, "byteArray"    # [B

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x3

    add-int/lit8 v1, v1, -0x1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 125
    .local v0, "hexString":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 126
    sget-object v2, Lorg/chromium/base/PackageUtils;->HEX_CHAR_LOOKUP:[C

    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xf0

    ushr-int/lit8 v3, v3, 0x4

    aget-char v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 127
    sget-object v2, Lorg/chromium/base/PackageUtils;->HEX_CHAR_LOOKUP:[C

    aget-byte v3, p0, v1

    and-int/lit8 v3, v3, 0xf

    aget-char v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 125
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 130
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getApplicationPackageInfo(I)Landroid/content/pm/PackageInfo;
    .locals 2
    .param p0, "flags"    # I

    .line 76
    invoke-static {}, Lorg/chromium/base/BuildInfo;->getInstance()Lorg/chromium/base/BuildInfo;

    move-result-object v0

    iget-object v0, v0, Lorg/chromium/base/BuildInfo;->packageName:Ljava/lang/String;

    invoke-static {v0, p0}, Lorg/chromium/base/PackageUtils;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 77
    .local v0, "ret":Landroid/content/pm/PackageInfo;
    if-eqz v0, :cond_0

    .line 78
    return-object v0

    .line 77
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public static getCertificateSHA256FingerprintForPackage(Ljava/lang/String;)Ljava/util/List;
    .locals 12
    .param p0, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 91
    const/16 v0, 0x40

    invoke-static {p0, v0}, Lorg/chromium/base/PackageUtils;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 93
    .local v0, "packageInfo":Landroid/content/pm/PackageInfo;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 95
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v3, v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 97
    .local v2, "fingerprints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v3, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_1

    aget-object v6, v3, v5

    .line 98
    .local v6, "signature":Landroid/content/pm/Signature;
    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v6}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 99
    .local v7, "input":Ljava/io/InputStream;
    const/4 v8, 0x0

    .line 101
    .local v8, "hexString":Ljava/lang/String;
    :try_start_0
    const-string v9, "X509"

    .line 102
    invoke-static {v9}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v9

    .line 103
    invoke-virtual {v9, v7}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v9

    check-cast v9, Ljava/security/cert/X509Certificate;

    .line 104
    .local v9, "certificate":Ljava/security/cert/X509Certificate;
    const-string v10, "SHA256"

    .line 105
    invoke-static {v10}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v10

    invoke-virtual {v9}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v10

    .line 104
    invoke-static {v10}, Lorg/chromium/base/PackageUtils;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v10
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .end local v8    # "hexString":Ljava/lang/String;
    .end local v9    # "certificate":Ljava/security/cert/X509Certificate;
    .local v10, "hexString":Ljava/lang/String;
    nop

    .line 111
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    .end local v6    # "signature":Landroid/content/pm/Signature;
    .end local v7    # "input":Ljava/io/InputStream;
    .end local v10    # "hexString":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 106
    .restart local v6    # "signature":Landroid/content/pm/Signature;
    .restart local v7    # "input":Ljava/io/InputStream;
    .restart local v8    # "hexString":Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_1

    :catch_1
    move-exception v3

    .line 107
    .local v3, "e":Ljava/security/GeneralSecurityException;
    :goto_1
    const-string v4, "PackageUtils"

    const-string v5, "Exception"

    invoke-static {v4, v5, v3}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    return-object v1

    .line 114
    .end local v3    # "e":Ljava/security/GeneralSecurityException;
    .end local v6    # "signature":Landroid/content/pm/Signature;
    .end local v7    # "input":Ljava/io/InputStream;
    .end local v8    # "hexString":Ljava/lang/String;
    :cond_1
    return-object v2
.end method

.method public static getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    .locals 3
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "flags"    # I

    .line 37
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 39
    .local v0, "pm":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {v0, p0, p1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 40
    :catch_0
    move-exception v1

    .line 41
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, 0x0

    return-object v2
.end method

.method public static getPackageVersion(Landroid/content/Context;Ljava/lang/String;)I
    .locals 1
    .param p0, "unused"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .line 60
    invoke-static {p1}, Lorg/chromium/base/PackageUtils;->getPackageVersion(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getPackageVersion(Ljava/lang/String;)I
    .locals 2
    .param p0, "packageName"    # Ljava/lang/String;

    .line 53
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/PackageUtils;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 54
    .local v0, "packageInfo":Landroid/content/pm/PackageInfo;
    if-eqz v0, :cond_0

    iget v1, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    return v1

    .line 55
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static isPackageInstalled(Ljava/lang/String;)Z
    .locals 2
    .param p0, "packageName"    # Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/PackageUtils;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method
