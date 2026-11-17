.class public Lorg/chromium/net/X509Util;
.super Ljava/lang/Object;
.source "X509Util.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/X509Util$TrustStorageListener;,
        Lorg/chromium/net/X509Util$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "net"
.end annotation

.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final HEX_DIGITS:[C

.field private static final OID_ANY_EKU:Ljava/lang/String; = "2.5.29.37.0"

.field private static final OID_SERVER_GATED_MICROSOFT:Ljava/lang/String; = "1.3.6.1.4.1.311.10.3.3"

.field private static final OID_SERVER_GATED_NETSCAPE:Ljava/lang/String; = "2.16.840.1.113730.4.1"

.field private static final OID_TLS_SERVER_AUTH:Ljava/lang/String; = "1.3.6.1.5.5.7.3.1"

.field private static final TAG:Ljava/lang/String; = "X509Util"

.field private static sCertificateFactory:Ljava/security/cert/CertificateFactory;

.field private static sDefaultTrustManager:Landroid/net/http/X509TrustManagerExtensions;

.field private static sLoadedSystemKeyStore:Z

.field private static final sLock:Ljava/lang/Object;

.field private static sSystemCertificateDirectory:Ljava/io/File;

.field private static sSystemKeyStore:Ljava/security/KeyStore;

.field private static sSystemTrustAnchorCache:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/util/Pair<",
            "Ljavax/security/auth/x500/X500Principal;",
            "Ljava/security/PublicKey;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sTestKeyStore:Ljava/security/KeyStore;

.field private static sTestRoot:Ljava/security/cert/X509Certificate;

.field private static sTestTrustManager:Landroid/net/http/X509TrustManagerExtensions;

.field private static sTrustStorageListener:Lorg/chromium/net/X509Util$TrustStorageListener;


# direct methods
.method static bridge synthetic -$$Nest$smreloadDefaultTrustManager()V
    .locals 0

    invoke-static {}, Lorg/chromium/net/X509Util;->reloadDefaultTrustManager()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 52
    nop

    .line 174
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    .line 375
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/chromium/net/X509Util;->HEX_DIGITS:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addTestRootCertificate([B)V
    .locals 6
    .param p0, "rootCertBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 333
    invoke-static {p0}, Lorg/chromium/net/X509Util;->createCertificateFromBytes([B)Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 334
    .local v0, "rootCert":Ljava/security/cert/X509Certificate;
    sget-object v1, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 335
    :try_start_0
    invoke-static {}, Lorg/chromium/net/X509Util;->ensureTestInitializedLocked()V

    .line 337
    sget-object v2, Lorg/chromium/net/X509Util;->sTestKeyStore:Ljava/security/KeyStore;

    sget-object v3, Lorg/chromium/net/X509Util;->sTestKeyStore:Ljava/security/KeyStore;

    .line 338
    invoke-virtual {v3}, Ljava/security/KeyStore;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "root_cert_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 337
    invoke-virtual {v2, v3, v0}, Ljava/security/KeyStore;->setCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V

    .line 339
    invoke-static {}, Lorg/chromium/net/X509Util;->reloadTestTrustManager()V

    .line 340
    monitor-exit v1

    .line 341
    return-void

    .line 340
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private static checkServerTrustedIgnoringRuntimeException(Landroid/net/http/X509TrustManagerExtensions;[Ljava/security/cert/X509Certificate;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p0, "tm"    # Landroid/net/http/X509TrustManagerExtensions;
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .param p3, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/http/X509TrustManagerExtensions;",
            "[",
            "Ljava/security/cert/X509Certificate;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .line 102
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Landroid/net/http/X509TrustManagerExtensions;->checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 103
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/RuntimeException;
    const-string v1, "X509Util"

    const-string v2, "checkServerTrusted() unexpectedly threw: %s"

    invoke-static {v1, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 107
    new-instance v1, Ljava/security/cert/CertificateException;

    invoke-direct {v1, v0}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static clearTestRootCertificates()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/cert/CertificateException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .line 348
    sget-object v0, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 349
    :try_start_0
    invoke-static {}, Lorg/chromium/net/X509Util;->ensureTestInitializedLocked()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 351
    :try_start_1
    sget-object v1, Lorg/chromium/net/X509Util;->sTestKeyStore:Ljava/security/KeyStore;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 352
    invoke-static {}, Lorg/chromium/net/X509Util;->reloadTestTrustManager()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 355
    goto :goto_0

    .line 353
    :catch_0
    move-exception v1

    .line 356
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 357
    return-void

    .line 356
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public static createCertificateFromBytes([B)Ljava/security/cert/X509Certificate;
    .locals 2
    .param p0, "derBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 323
    invoke-static {}, Lorg/chromium/net/X509Util;->ensureInitialized()V

    .line 324
    sget-object v0, Lorg/chromium/net/X509Util;->sCertificateFactory:Ljava/security/cert/CertificateFactory;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method private static createTrustManager(Ljava/security/KeyStore;)Landroid/net/http/X509TrustManagerExtensions;
    .locals 11
    .param p0, "keyStore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 266
    const-string v0, "X509Util"

    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v1

    .line 267
    .local v1, "algorithm":Ljava/lang/String;
    invoke-static {v1}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v2

    .line 268
    .local v2, "tmf":Ljavax/net/ssl/TrustManagerFactory;
    invoke-virtual {v2, p0}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 270
    const/4 v3, 0x0

    .line 272
    .local v3, "trustManagers":[Ljavax/net/ssl/TrustManager;
    :try_start_0
    invoke-virtual {v2}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 278
    .end local v3    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    .local v4, "trustManagers":[Ljavax/net/ssl/TrustManager;
    nop

    .line 280
    array-length v3, v4

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v6, v4, v5

    .line 281
    .local v6, "tm":Ljavax/net/ssl/TrustManager;
    instance-of v7, v6, Ljavax/net/ssl/X509TrustManager;

    if-eqz v7, :cond_0

    .line 283
    :try_start_1
    new-instance v7, Landroid/net/http/X509TrustManagerExtensions;

    move-object v8, v6

    check-cast v8, Ljavax/net/ssl/X509TrustManager;

    invoke-direct {v7, v8}, Landroid/net/http/X509TrustManagerExtensions;-><init>(Ljavax/net/ssl/X509TrustManager;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v7

    .line 284
    :catch_0
    move-exception v7

    .line 285
    .local v7, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    .line 286
    .local v8, "className":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error creating trust manager ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "): "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    .end local v6    # "tm":Ljavax/net/ssl/TrustManager;
    .end local v7    # "e":Ljava/lang/IllegalArgumentException;
    .end local v8    # "className":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 290
    :cond_1
    const-string v3, "Could not find suitable trust manager"

    invoke-static {v0, v3}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    const/4 v0, 0x0

    return-object v0

    .line 273
    .end local v4    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    .restart local v3    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    :catch_1
    move-exception v4

    .line 276
    .local v4, "e":Ljava/lang/RuntimeException;
    const-string v5, "TrustManagerFactory.getTrustManagers() unexpectedly threw: %s"

    invoke-static {v0, v5, v4}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 277
    new-instance v0, Ljava/security/KeyStoreException;

    invoke-direct {v0, v4}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static ensureInitialized()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 181
    sget-object v0, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 182
    :try_start_0
    invoke-static {}, Lorg/chromium/net/X509Util;->ensureInitializedLocked()V

    .line 183
    monitor-exit v0

    .line 184
    return-void

    .line 183
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static ensureInitializedLocked()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 194
    sget-object v0, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 196
    sget-object v0, Lorg/chromium/net/X509Util;->sCertificateFactory:Ljava/security/cert/CertificateFactory;

    if-nez v0, :cond_0

    .line 197
    const-string v0, "X.509"

    invoke-static {v0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/X509Util;->sCertificateFactory:Ljava/security/cert/CertificateFactory;

    .line 199
    :cond_0
    sget-object v0, Lorg/chromium/net/X509Util;->sDefaultTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 200
    invoke-static {v1}, Lorg/chromium/net/X509Util;->createTrustManager(Ljava/security/KeyStore;)Landroid/net/http/X509TrustManagerExtensions;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/X509Util;->sDefaultTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    .line 202
    :cond_1
    sget-boolean v0, Lorg/chromium/net/X509Util;->sLoadedSystemKeyStore:Z

    if-nez v0, :cond_2

    .line 204
    :try_start_0
    const-string v0, "AndroidCAStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/X509Util;->sSystemKeyStore:Ljava/security/KeyStore;
    :try_end_0
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_1

    .line 206
    :try_start_1
    sget-object v0, Lorg/chromium/net/X509Util;->sSystemKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_1} :catch_1

    .line 209
    goto :goto_0

    .line 207
    :catch_0
    move-exception v0

    .line 210
    :goto_0
    :try_start_2
    new-instance v0, Ljava/io/File;

    const-string v2, "ANDROID_ROOT"

    .line 211
    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/etc/security/cacerts"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/chromium/net/X509Util;->sSystemCertificateDirectory:Ljava/io/File;
    :try_end_2
    .catch Ljava/security/KeyStoreException; {:try_start_2 .. :try_end_2} :catch_1

    .line 215
    goto :goto_1

    .line 212
    :catch_1
    move-exception v0

    .line 216
    :goto_1
    const/4 v0, 0x1

    sput-boolean v0, Lorg/chromium/net/X509Util;->sLoadedSystemKeyStore:Z

    .line 218
    :cond_2
    sget-object v0, Lorg/chromium/net/X509Util;->sSystemTrustAnchorCache:Ljava/util/Set;

    if-nez v0, :cond_3

    .line 219
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/chromium/net/X509Util;->sSystemTrustAnchorCache:Ljava/util/Set;

    .line 221
    :cond_3
    sget-object v0, Lorg/chromium/net/X509Util;->sTrustStorageListener:Lorg/chromium/net/X509Util$TrustStorageListener;

    if-nez v0, :cond_5

    .line 222
    new-instance v0, Lorg/chromium/net/X509Util$TrustStorageListener;

    invoke-direct {v0, v1}, Lorg/chromium/net/X509Util$TrustStorageListener;-><init>(Lorg/chromium/net/X509Util-IA;)V

    sput-object v0, Lorg/chromium/net/X509Util;->sTrustStorageListener:Lorg/chromium/net/X509Util$TrustStorageListener;

    .line 223
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 224
    .local v0, "filter":Landroid/content/IntentFilter;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_4

    .line 225
    const-string v1, "android.security.action.KEYCHAIN_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 226
    const-string v1, "android.security.action.KEY_ACCESS_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 227
    const-string v1, "android.security.action.TRUST_STORE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    goto :goto_2

    .line 230
    :cond_4
    const-string v1, "android.security.STORAGE_CHANGED"

    .line 231
    .local v1, "action":Ljava/lang/String;
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 234
    .end local v1    # "action":Ljava/lang/String;
    :goto_2
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lorg/chromium/net/X509Util;->sTrustStorageListener:Lorg/chromium/net/X509Util$TrustStorageListener;

    .line 233
    invoke-static {v1, v2, v0}, Lorg/chromium/base/ContextUtils;->registerProtectedBroadcastReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 236
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_5
    return-void

    .line 194
    :cond_6
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static ensureTestInitializedLocked()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 244
    sget-object v0, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 245
    sget-object v0, Lorg/chromium/net/X509Util;->sTestKeyStore:Ljava/security/KeyStore;

    if-nez v0, :cond_0

    .line 246
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/X509Util;->sTestKeyStore:Ljava/security/KeyStore;

    .line 248
    :try_start_0
    sget-object v0, Lorg/chromium/net/X509Util;->sTestKeyStore:Ljava/security/KeyStore;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    goto :goto_0

    .line 249
    :catch_0
    move-exception v0

    .line 253
    :cond_0
    :goto_0
    sget-object v0, Lorg/chromium/net/X509Util;->sTestTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    if-nez v0, :cond_1

    .line 254
    sget-object v0, Lorg/chromium/net/X509Util;->sTestKeyStore:Ljava/security/KeyStore;

    invoke-static {v0}, Lorg/chromium/net/X509Util;->createTrustManager(Ljava/security/KeyStore;)Landroid/net/http/X509TrustManagerExtensions;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/X509Util;->sTestTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    .line 256
    :cond_1
    return-void

    .line 244
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static getUserAddedRoots()[[B
    .locals 9

    .line 487
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 488
    .local v0, "userRootBytes":Ljava/util/List;, "Ljava/util/List<[B>;"
    sget-object v1, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 490
    const/4 v2, 0x0

    :try_start_0
    invoke-static {}, Lorg/chromium/net/X509Util;->ensureInitialized()V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 493
    nop

    .line 495
    :try_start_1
    sget-object v3, Lorg/chromium/net/X509Util;->sSystemKeyStore:Ljava/security/KeyStore;

    if-nez v3, :cond_0

    .line 496
    new-array v2, v2, [[B

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v2

    .line 500
    :cond_0
    :try_start_2
    sget-object v3, Lorg/chromium/net/X509Util;->sSystemKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v3}, Ljava/security/KeyStore;->aliases()Ljava/util/Enumeration;

    move-result-object v3

    .line 501
    .local v3, "aliases":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 502
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 515
    .local v4, "alias":Ljava/lang/String;
    const-string v5, "user:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5
    :try_end_2
    .catch Ljava/security/KeyStoreException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v5, :cond_2

    .line 517
    :try_start_3
    sget-object v5, Lorg/chromium/net/X509Util;->sSystemKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v5, v4}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v5

    .line 518
    .local v5, "anchor":Ljava/security/cert/Certificate;
    instance-of v6, v5, Ljava/security/cert/X509Certificate;

    if-nez v6, :cond_1

    .line 519
    const-string v6, "X509Util"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "alias: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is not a X509 Cert, skipping"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 520
    goto :goto_0

    .line 522
    :cond_1
    move-object v6, v5

    check-cast v6, Ljava/security/cert/X509Certificate;

    .line 523
    .local v6, "anchorX509":Ljava/security/cert/X509Certificate;
    invoke-virtual {v6}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/security/KeyStoreException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 526
    .end local v5    # "anchor":Ljava/security/cert/Certificate;
    .end local v6    # "anchorX509":Ljava/security/cert/X509Certificate;
    :catch_0
    move-exception v5

    .line 527
    .local v5, "e":Ljava/security/cert/CertificateEncodingException;
    :try_start_4
    const-string v6, "X509Util"

    const-string v7, "Error encoding cert with alias %s, error: %s"

    invoke-static {v6, v7, v4, v5}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    .line 524
    .end local v5    # "e":Ljava/security/cert/CertificateEncodingException;
    :catch_1
    move-exception v5

    .line 525
    .local v5, "e":Ljava/security/KeyStoreException;
    const-string v6, "X509Util"

    const-string v7, "Error reading cert with alias %s, error: %s"

    invoke-static {v6, v7, v4, v5}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/security/KeyStoreException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 528
    .end local v5    # "e":Ljava/security/KeyStoreException;
    :goto_1
    nop

    .line 530
    .end local v4    # "alias":Ljava/lang/String;
    :cond_2
    :goto_2
    goto :goto_0

    .line 534
    .end local v3    # "aliases":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :cond_3
    nop

    .line 536
    :try_start_5
    sget-object v3, Lorg/chromium/net/X509Util;->sTestRoot:Ljava/security/cert/X509Certificate;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v3, :cond_4

    .line 538
    :try_start_6
    sget-object v3, Lorg/chromium/net/X509Util;->sTestRoot:Ljava/security/cert/X509Certificate;

    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 541
    goto :goto_3

    .line 539
    :catch_2
    move-exception v3

    .line 540
    .local v3, "e":Ljava/security/cert/CertificateEncodingException;
    :try_start_7
    const-string v4, "X509Util"

    const-string v5, "Error encoding test root cert, error %s"

    invoke-static {v4, v5, v3}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 543
    .end local v3    # "e":Ljava/security/cert/CertificateEncodingException;
    :cond_4
    :goto_3
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 545
    new-array v1, v2, [[B

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    return-object v1

    .line 531
    :catch_3
    move-exception v3

    .line 532
    .local v3, "e":Ljava/security/KeyStoreException;
    :try_start_8
    const-string v4, "X509Util"

    const-string v5, "Error reading cert aliases: %s"

    invoke-static {v4, v5, v3}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 533
    new-array v2, v2, [[B

    monitor-exit v1

    return-object v2

    .line 543
    .end local v3    # "e":Ljava/security/KeyStoreException;
    :catchall_0
    move-exception v2

    goto :goto_5

    .line 491
    :catch_4
    move-exception v3

    goto :goto_4

    :catch_5
    move-exception v3

    goto :goto_4

    :catch_6
    move-exception v3

    .line 492
    .local v3, "e":Ljava/security/GeneralSecurityException;
    :goto_4
    new-array v2, v2, [[B

    monitor-exit v1

    return-object v2

    .line 543
    .end local v3    # "e":Ljava/security/GeneralSecurityException;
    :goto_5
    monitor-exit v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    throw v2
.end method

.method private static hashPrincipal(Ljavax/security/auth/x500/X500Principal;)Ljava/lang/String;
    .locals 7
    .param p0, "principal"    # Ljavax/security/auth/x500/X500Principal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 383
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {p0}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 384
    .local v0, "digest":[B
    const/16 v1, 0x8

    new-array v1, v1, [C

    .line 385
    .local v1, "hexChars":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    .line 386
    mul-int/lit8 v4, v2, 0x2

    sget-object v5, Lorg/chromium/net/X509Util;->HEX_DIGITS:[C

    rsub-int/lit8 v6, v2, 0x3

    aget-byte v6, v0, v6

    shr-int/lit8 v3, v6, 0x4

    and-int/lit8 v3, v3, 0xf

    aget-char v3, v5, v3

    aput-char v3, v1, v4

    .line 387
    mul-int/lit8 v3, v2, 0x2

    add-int/lit8 v3, v3, 0x1

    sget-object v4, Lorg/chromium/net/X509Util;->HEX_DIGITS:[C

    rsub-int/lit8 v5, v2, 0x3

    aget-byte v5, v0, v5

    and-int/lit8 v5, v5, 0xf

    aget-char v4, v4, v5

    aput-char v4, v1, v3

    .line 385
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 389
    .end local v2    # "i":I
    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method

.method private static isKnownRoot(Ljava/security/cert/X509Certificate;)Z
    .locals 10
    .param p0, "root"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .line 394
    sget-object v0, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 397
    sget-object v0, Lorg/chromium/net/X509Util;->sSystemKeyStore:Ljava/security/KeyStore;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 401
    :cond_0
    new-instance v0, Landroid/util/Pair;

    .line 402
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v2

    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 404
    .local v0, "key":Landroid/util/Pair;, "Landroid/util/Pair<Ljavax/security/auth/x500/X500Principal;Ljava/security/PublicKey;>;"
    sget-object v2, Lorg/chromium/net/X509Util;->sSystemTrustAnchorCache:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    return v3

    .line 416
    :cond_1
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v2

    invoke-static {v2}, Lorg/chromium/net/X509Util;->hashPrincipal(Ljavax/security/auth/x500/X500Principal;)Ljava/lang/String;

    move-result-object v2

    .line 417
    .local v2, "hash":Ljava/lang/String;
    const/4 v4, 0x0

    .line 418
    .local v4, "i":I
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 419
    .local v5, "alias":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    sget-object v7, Lorg/chromium/net/X509Util;->sSystemCertificateDirectory:Ljava/io/File;

    invoke-direct {v6, v7, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2

    .line 444
    .end local v4    # "i":I
    .end local v5    # "alias":Ljava/lang/String;
    return v1

    .line 421
    .restart local v4    # "i":I
    .restart local v5    # "alias":Ljava/lang/String;
    :cond_2
    sget-object v6, Lorg/chromium/net/X509Util;->sSystemKeyStore:Ljava/security/KeyStore;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "system:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v6

    .line 426
    .local v6, "anchor":Ljava/security/cert/Certificate;
    if-nez v6, :cond_3

    goto :goto_1

    .line 428
    :cond_3
    instance-of v7, v6, Ljava/security/cert/X509Certificate;

    if-nez v7, :cond_4

    .line 430
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    .line 431
    .local v7, "className":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Anchor "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " not an X509Certificate: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "X509Util"

    invoke-static {v9, v8}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    goto :goto_1

    .line 436
    .end local v7    # "className":Ljava/lang/String;
    :cond_4
    move-object v7, v6

    check-cast v7, Ljava/security/cert/X509Certificate;

    .line 437
    .local v7, "anchorX509":Ljava/security/cert/X509Certificate;
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v8

    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 438
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v8

    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 439
    sget-object v1, Lorg/chromium/net/X509Util;->sSystemTrustAnchorCache:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 440
    return v3

    .line 417
    .end local v5    # "alias":Ljava/lang/String;
    .end local v6    # "anchor":Ljava/security/cert/Certificate;
    .end local v7    # "anchorX509":Ljava/security/cert/X509Certificate;
    :cond_5
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 394
    .end local v0    # "key":Landroid/util/Pair;, "Landroid/util/Pair<Ljavax/security/auth/x500/X500Principal;Ljava/security/PublicKey;>;"
    .end local v2    # "hash":Ljava/lang/String;
    .end local v4    # "i":I
    :cond_6
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static reloadDefaultTrustManager()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .line 310
    sget-object v0, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 311
    const/4 v1, 0x0

    :try_start_0
    sput-object v1, Lorg/chromium/net/X509Util;->sDefaultTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    .line 312
    sput-object v1, Lorg/chromium/net/X509Util;->sSystemTrustAnchorCache:Ljava/util/Set;

    .line 313
    invoke-static {}, Lorg/chromium/net/X509Util;->ensureInitializedLocked()V

    .line 314
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 315
    invoke-static {}, Lorg/chromium/net/X509UtilJni;->get()Lorg/chromium/net/X509Util$Natives;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/net/X509Util$Natives;->notifyTrustStoreChanged()V

    .line 316
    return-void

    .line 314
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static reloadTestTrustManager()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .line 299
    sget-object v0, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 300
    invoke-static {}, Lorg/chromium/net/X509Util;->ensureTestInitializedLocked()V

    .line 302
    sget-object v0, Lorg/chromium/net/X509Util;->sTestKeyStore:Ljava/security/KeyStore;

    invoke-static {v0}, Lorg/chromium/net/X509Util;->createTrustManager(Ljava/security/KeyStore;)Landroid/net/http/X509TrustManagerExtensions;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/X509Util;->sTestTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    .line 303
    return-void

    .line 299
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static setTestRootCertificateForBuiltin([B)V
    .locals 3
    .param p0, "rootCertBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/cert/CertificateException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .line 364
    invoke-static {p0}, Lorg/chromium/net/X509Util;->createCertificateFromBytes([B)Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 365
    .local v0, "rootCert":Ljava/security/cert/X509Certificate;
    sget-object v1, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 371
    :try_start_0
    sput-object v0, Lorg/chromium/net/X509Util;->sTestRoot:Ljava/security/cert/X509Certificate;

    .line 372
    monitor-exit v1

    .line 373
    return-void

    .line 372
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method static verifyKeyUsage(Ljava/security/cert/X509Certificate;)Z
    .locals 6
    .param p0, "certificate"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .line 460
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getExtendedKeyUsage()Ljava/util/List;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 466
    .local v1, "ekuOids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    nop

    .line 467
    const/4 v2, 0x1

    if-nez v1, :cond_0

    return v2

    .line 469
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 470
    .local v4, "ekuOid":Ljava/lang/String;
    const-string v5, "1.3.6.1.5.5.7.3.1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 471
    const-string v5, "2.5.29.37.0"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 472
    const-string v5, "2.16.840.1.113730.4.1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 473
    const-string v5, "1.3.6.1.4.1.311.10.3.3"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    .line 476
    .end local v4    # "ekuOid":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 474
    .restart local v4    # "ekuOid":Ljava/lang/String;
    :cond_2
    :goto_1
    return v2

    .line 478
    .end local v4    # "ekuOid":Ljava/lang/String;
    :cond_3
    return v0

    .line 461
    .end local v1    # "ekuOids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 465
    .local v1, "e":Ljava/lang/NullPointerException;
    return v0
.end method

.method public static verifyServerCertificates([[BLjava/lang/String;Ljava/lang/String;)Lorg/chromium/net/AndroidCertVerifyResult;
    .locals 9
    .param p0, "certChain"    # [[B
    .param p1, "authType"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 552
    if-eqz p0, :cond_6

    array-length v0, p0

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    aget-object v1, p0, v0

    if-eqz v1, :cond_6

    .line 559
    const/4 v1, -0x1

    :try_start_0
    invoke-static {}, Lorg/chromium/net/X509Util;->ensureInitialized()V
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_7

    .line 562
    nop

    .line 564
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 566
    .local v2, "serverCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :try_start_1
    aget-object v3, p0, v0

    invoke-static {v3}, Lorg/chromium/net/X509Util;->createCertificateFromBytes([B)Ljava/security/cert/X509Certificate;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_6

    .line 569
    nop

    .line 570
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    array-length v4, p0

    if-ge v3, v4, :cond_0

    .line 572
    :try_start_2
    aget-object v4, p0, v3

    invoke-static {v4}, Lorg/chromium/net/X509Util;->createCertificateFromBytes([B)Ljava/security/cert/X509Certificate;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/security/cert/CertificateException; {:try_start_2 .. :try_end_2} :catch_0

    .line 575
    goto :goto_1

    .line 573
    :catch_0
    move-exception v4

    .line 574
    .local v4, "e":Ljava/security/cert/CertificateException;
    const-string v5, "X509Util"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "intermediate "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " failed parsing"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 570
    .end local v4    # "e":Ljava/security/cert/CertificateException;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 577
    .end local v3    # "i":I
    :cond_0
    nop

    .line 578
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/security/cert/X509Certificate;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/security/cert/X509Certificate;

    .line 585
    .local v3, "serverCertificates":[Ljava/security/cert/X509Certificate;
    :try_start_3
    aget-object v4, v3, v0

    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->checkValidity()V

    .line 586
    aget-object v4, v3, v0

    invoke-static {v4}, Lorg/chromium/net/X509Util;->verifyKeyUsage(Ljava/security/cert/X509Certificate;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 587
    new-instance v0, Lorg/chromium/net/AndroidCertVerifyResult;

    const/4 v4, -0x6

    invoke-direct {v0, v4}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(I)V
    :try_end_3
    .catch Ljava/security/cert/CertificateExpiredException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/security/cert/CertificateNotYetValidException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/security/cert/CertificateException; {:try_start_3 .. :try_end_3} :catch_3

    return-object v0

    .line 596
    :cond_1
    nop

    .line 598
    sget-object v4, Lorg/chromium/net/X509Util;->sLock:Ljava/lang/Object;

    monitor-enter v4

    .line 600
    :try_start_4
    sget-object v5, Lorg/chromium/net/X509Util;->sDefaultTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    if-nez v5, :cond_2

    .line 601
    new-instance v0, Lorg/chromium/net/AndroidCertVerifyResult;

    invoke-direct {v0, v1}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(I)V

    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    return-object v0

    .line 604
    :cond_2
    const/4 v1, 0x0

    .line 606
    .local v1, "verifiedChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :try_start_5
    sget-object v5, Lorg/chromium/net/X509Util;->sDefaultTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    invoke-static {v5, v3, p1, p2}, Lorg/chromium/net/X509Util;->checkServerTrustedIgnoringRuntimeException(Landroid/net/http/X509TrustManagerExtensions;[Ljava/security/cert/X509Certificate;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5
    :try_end_5
    .catch Ljava/security/cert/CertificateException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 626
    .end local v1    # "verifiedChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .local v5, "verifiedChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    goto :goto_3

    .line 608
    .end local v5    # "verifiedChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .restart local v1    # "verifiedChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :catch_1
    move-exception v5

    .line 609
    .local v5, "eDefaultManager":Ljava/security/cert/CertificateException;
    :try_start_6
    sget-object v6, Lorg/chromium/net/X509Util;->sTestTrustManager:Landroid/net/http/X509TrustManagerExtensions;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v6, :cond_3

    .line 611
    :try_start_7
    sget-object v6, Lorg/chromium/net/X509Util;->sTestTrustManager:Landroid/net/http/X509TrustManagerExtensions;

    invoke-static {v6, v3, p1, p2}, Lorg/chromium/net/X509Util;->checkServerTrustedIgnoringRuntimeException(Landroid/net/http/X509TrustManagerExtensions;[Ljava/security/cert/X509Certificate;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v6
    :try_end_7
    .catch Ljava/security/cert/CertificateException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-object v1, v6

    .line 615
    goto :goto_2

    .line 613
    :catch_2
    move-exception v6

    .line 618
    :cond_3
    :goto_2
    if-nez v1, :cond_4

    .line 621
    :try_start_8
    const-string v0, "X509Util"

    .line 622
    invoke-virtual {v5}, Ljava/security/cert/CertificateException;->getMessage()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to validate the certificate chain, error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 621
    invoke-static {v0, v6}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    new-instance v0, Lorg/chromium/net/AndroidCertVerifyResult;

    const/4 v6, -0x2

    invoke-direct {v0, v6}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(I)V

    monitor-exit v4

    return-object v0

    .line 618
    :cond_4
    move-object v5, v1

    .line 628
    .end local v1    # "verifiedChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .local v5, "verifiedChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :goto_3
    const/4 v1, 0x0

    .line 629
    .local v1, "isIssuedByKnownRoot":Z
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_5

    .line 630
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/security/cert/X509Certificate;

    .line 631
    .local v6, "root":Ljava/security/cert/X509Certificate;
    invoke-static {v6}, Lorg/chromium/net/X509Util;->isKnownRoot(Ljava/security/cert/X509Certificate;)Z

    move-result v7

    move v1, v7

    .line 634
    .end local v6    # "root":Ljava/security/cert/X509Certificate;
    :cond_5
    new-instance v6, Lorg/chromium/net/AndroidCertVerifyResult;

    invoke-direct {v6, v0, v1, v5}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(IZLjava/util/List;)V

    monitor-exit v4

    return-object v6

    .line 636
    .end local v1    # "isIssuedByKnownRoot":Z
    .end local v5    # "verifiedChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :catchall_0
    move-exception v0

    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    throw v0

    .line 594
    :catch_3
    move-exception v0

    .line 595
    .local v0, "e":Ljava/security/cert/CertificateException;
    new-instance v4, Lorg/chromium/net/AndroidCertVerifyResult;

    invoke-direct {v4, v1}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(I)V

    return-object v4

    .line 592
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :catch_4
    move-exception v0

    .line 593
    .local v0, "e":Ljava/security/cert/CertificateNotYetValidException;
    new-instance v1, Lorg/chromium/net/AndroidCertVerifyResult;

    const/4 v4, -0x4

    invoke-direct {v1, v4}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(I)V

    return-object v1

    .line 590
    .end local v0    # "e":Ljava/security/cert/CertificateNotYetValidException;
    :catch_5
    move-exception v0

    .line 591
    .local v0, "e":Ljava/security/cert/CertificateExpiredException;
    new-instance v1, Lorg/chromium/net/AndroidCertVerifyResult;

    const/4 v4, -0x3

    invoke-direct {v1, v4}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(I)V

    return-object v1

    .line 567
    .end local v0    # "e":Ljava/security/cert/CertificateExpiredException;
    .end local v3    # "serverCertificates":[Ljava/security/cert/X509Certificate;
    :catch_6
    move-exception v0

    .line 568
    .local v0, "e":Ljava/security/cert/CertificateException;
    new-instance v1, Lorg/chromium/net/AndroidCertVerifyResult;

    const/4 v3, -0x5

    invoke-direct {v1, v3}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(I)V

    return-object v1

    .line 560
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    .end local v2    # "serverCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :catch_7
    move-exception v0

    .line 561
    .restart local v0    # "e":Ljava/security/cert/CertificateException;
    new-instance v2, Lorg/chromium/net/AndroidCertVerifyResult;

    invoke-direct {v2, v1}, Lorg/chromium/net/AndroidCertVerifyResult;-><init>(I)V

    return-object v2

    .line 553
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 554
    invoke-static {p0}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected non-null and non-empty certificate chain passed as |certChain|. |certChain|="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
