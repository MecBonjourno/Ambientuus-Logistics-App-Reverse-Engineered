.class public final Lorg/chromium/net/httpflags/HttpFlagsLoader;
.super Ljava/lang/Object;
.source "HttpFlagsLoader.java"


# static fields
.field static final FLAGS_FILE_DIR_NAME:Ljava/lang/String; = "app_httpflags"

.field static final FLAGS_FILE_NAME:Ljava/lang/String; = "flags.binarypb"

.field static final FLAGS_FILE_PROVIDER_INTENT_ACTION:Ljava/lang/String; = "android.net.http.FLAGS_FILE_PROVIDER"

.field private static final TAG:Ljava/lang/String; = "HttpFlagsLoader"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getFlagsFileFromProvider(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;)Ljava/io/File;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "providerApplicationInfo"    # Landroid/content/pm/ApplicationInfo;

    .line 117
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x18

    if-lt v3, v4, :cond_0

    .line 118
    iget-object v3, p1, Landroid/content/pm/ApplicationInfo;->deviceProtectedDataDir:Ljava/lang/String;

    goto :goto_0

    .line 119
    :cond_0
    iget-object v3, p1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    :goto_0
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v3, "app_httpflags"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v2, "flags.binarypb"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 117
    return-object v0
.end method

.method private static getProviderApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 99
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.net.http.FLAGS_FILE_PROVIDER"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x100000

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 105
    .local v0, "resolveInfo":Landroid/content/pm/ResolveInfo;
    if-nez v0, :cond_0

    .line 106
    const-string v1, "HttpFlagsLoader"

    const-string v2, "Unable to resolve the HTTP flags file provider package. This is expected if the host system is not set up to provide HTTP flags."

    invoke-static {v1, v2}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    const/4 v1, 0x0

    return-object v1

    .line 112
    :cond_0
    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v1, v1, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    return-object v1
.end method

.method public static load(Landroid/content/Context;)Lorg/chromium/net/httpflags/Flags;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .line 72
    invoke-static {p0}, Lorg/chromium/net/impl/CronetManifest;->shouldReadHttpFlags(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, "HttpFlagsLoader"

    if-nez v0, :cond_0

    .line 73
    const-string v0, "Not loading HTTP flags because they are disabled in the manifest"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3, v0, v2}, Lorg/chromium/base/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    return-object v1

    .line 78
    :cond_0
    :try_start_0
    invoke-static {p0}, Lorg/chromium/net/httpflags/HttpFlagsLoader;->getProviderApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 79
    .local v0, "providerApplicationInfo":Landroid/content/pm/ApplicationInfo;
    if-nez v0, :cond_1

    return-object v1

    .line 80
    :cond_1
    const-string v4, "Found application exporting HTTP flags: %s"

    iget-object v5, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Object;

    aput-object v5, v7, v2

    invoke-static {v3, v4, v7}, Lorg/chromium/base/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 83
    invoke-static {p0, v0}, Lorg/chromium/net/httpflags/HttpFlagsLoader;->getFlagsFileFromProvider(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;)Ljava/io/File;

    move-result-object v4

    .line 84
    .local v4, "flagsFile":Ljava/io/File;
    const-string v5, "HTTP flags file path: %s"

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    new-array v8, v6, [Ljava/lang/Object;

    aput-object v7, v8, v2

    invoke-static {v3, v5, v8}, Lorg/chromium/base/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 86
    invoke-static {v4}, Lorg/chromium/net/httpflags/HttpFlagsLoader;->loadFlagsFile(Ljava/io/File;)Lorg/chromium/net/httpflags/Flags;

    move-result-object v5

    .line 87
    .local v5, "flags":Lorg/chromium/net/httpflags/Flags;
    if-nez v5, :cond_2

    return-object v1

    .line 88
    :cond_2
    const-string v7, "Successfully loaded HTTP flags: %s"

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v5, v6, v2

    invoke-static {v3, v7, v6}, Lorg/chromium/base/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    return-object v5

    .line 91
    .end local v0    # "providerApplicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v4    # "flagsFile":Ljava/io/File;
    .end local v5    # "flags":Lorg/chromium/net/httpflags/Flags;
    :catch_0
    move-exception v0

    .line 92
    .local v0, "exception":Ljava/lang/RuntimeException;
    const-string v2, "Unable to load HTTP flags file"

    invoke-static {v3, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    return-object v1
.end method

.method private static loadFlagsFile(Ljava/io/File;)Lorg/chromium/net/httpflags/Flags;
    .locals 4
    .param p0, "file"    # Ljava/io/File;

    .line 126
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .local v0, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_1
    invoke-static {v0}, Lorg/chromium/net/httpflags/Flags;->parseDelimitedFrom(Ljava/io/InputStream;)Lorg/chromium/net/httpflags/Flags;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 127
    return-object v1

    .line 126
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "file":Ljava/io/File;
    :goto_0
    throw v1
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 134
    .end local v0    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local p0    # "file":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 135
    .local v0, "exception":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Unable to read HTTP flags file"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 128
    .end local v0    # "exception":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 129
    .local v0, "exception":Ljava/io/FileNotFoundException;
    nop

    .line 132
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 129
    const-string v2, "HttpFlagsLoader"

    const-string v3, "HTTP flags file `%s` is missing. This is expected if HTTP flags functionality is currently disabled in the host system."

    invoke-static {v2, v3, v1}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    const/4 v1, 0x0

    return-object v1
.end method
