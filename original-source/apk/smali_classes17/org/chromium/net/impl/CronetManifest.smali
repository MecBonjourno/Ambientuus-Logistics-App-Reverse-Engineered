.class public final Lorg/chromium/net/impl/CronetManifest;
.super Ljava/lang/Object;
.source "CronetManifest.java"


# static fields
.field static final ENABLE_TELEMETRY_META_DATA_KEY:Ljava/lang/String; = "android.net.http.EnableTelemetry"

.field static final META_DATA_HOLDER_SERVICE_NAME:Ljava/lang/String; = "android.net.http.MetaDataHolder"

.field public static final READ_HTTP_FLAGS_META_DATA_KEY:Ljava/lang/String; = "android.net.http.EXPERIMENTAL_ReadHttpFlags"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getMetaData(Landroid/content/Context;)Landroid/os/Bundle;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 83
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "android.net.http.MetaDataHolder"

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const v2, 0xc0280

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .local v0, "serviceInfo":Landroid/content/pm/ServiceInfo;
    goto :goto_0

    .line 88
    .end local v0    # "serviceInfo":Landroid/content/pm/ServiceInfo;
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v1, 0x0

    move-object v0, v1

    .line 91
    .local v0, "serviceInfo":Landroid/content/pm/ServiceInfo;
    :goto_0
    if-eqz v0, :cond_0

    iget-object v1, v0, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    goto :goto_1

    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    :goto_1
    return-object v1
.end method

.method public static isAppOptedInForTelemetry(Landroid/content/Context;Lorg/chromium/net/impl/CronetLogger$CronetSource;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "source"    # Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 59
    sget-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_PLATFORM:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    if-eq p1, v0, :cond_1

    sget-object v0, Lorg/chromium/net/impl/CronetLogger$CronetSource;->CRONET_SOURCE_PLAY_SERVICES:Lorg/chromium/net/impl/CronetLogger$CronetSource;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 61
    .local v0, "telemetryIsDefaultEnabled":Z
    :goto_1
    invoke-static {p0}, Lorg/chromium/net/impl/CronetManifest;->getMetaData(Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "android.net.http.EnableTelemetry"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static shouldReadHttpFlags(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 73
    invoke-static {p0}, Lorg/chromium/net/impl/CronetManifest;->getMetaData(Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "android.net.http.EXPERIMENTAL_ReadHttpFlags"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
