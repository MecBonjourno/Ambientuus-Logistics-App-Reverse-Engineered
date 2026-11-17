.class public Lorg/chromium/base/BuildInfo;
.super Ljava/lang/Object;
.source "BuildInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/BuildInfo$Holder;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final MAX_FINGERPRINT_LENGTH:I = 0x80

.field private static final TAG:Ljava/lang/String; = "BuildInfo"

.field private static sBrowserApplicationInfo:Landroid/content/pm/ApplicationInfo;

.field private static sBrowserPackageInfo:Landroid/content/pm/PackageInfo;

.field private static sInitialized:Z


# instance fields
.field public final abiString:Ljava/lang/String;

.field public final androidBuildFingerprint:Ljava/lang/String;

.field public final customThemes:Ljava/lang/String;

.field public final gmsVersionCode:Ljava/lang/String;

.field public final hostPackageLabel:Ljava/lang/String;

.field public final hostPackageName:Ljava/lang/String;

.field public final hostVersionCode:J

.field public final installerPackageName:Ljava/lang/String;

.field public final isAutomotive:Z

.field public final isTV:Z

.field public final packageName:Ljava/lang/String;

.field public final resourcesVersion:Ljava/lang/String;

.field public final versionCode:J

.field public final versionName:Ljava/lang/String;

.field public final vulkanDeqpLevel:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 32
    return-void
.end method

.method private constructor <init>()V
    .locals 23

    .line 178
    move-object/from16 v1, p0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 179
    const/4 v2, 0x1

    sput-boolean v2, Lorg/chromium/base/BuildInfo;->sInitialized:Z

    .line 180
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    .line 181
    .local v3, "appContext":Landroid/content/Context;
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 182
    .local v4, "appContextPackageName":Ljava/lang/String;
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 184
    .local v5, "pm":Landroid/content/pm/PackageManager;
    const/4 v0, 0x0

    .line 185
    .local v0, "providedHostPackageName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 186
    .local v6, "providedHostPackageLabel":Ljava/lang/String;
    const/4 v7, 0x0

    .line 187
    .local v7, "providedPackageName":Ljava/lang/String;
    const/4 v8, 0x0

    .line 188
    .local v8, "providedPackageVersionName":Ljava/lang/String;
    const/4 v9, 0x0

    .line 189
    .local v9, "providedHostVersionCode":Ljava/lang/Long;
    const/4 v10, 0x0

    .line 194
    .local v10, "providedPackageVersionCode":Ljava/lang/Long;
    invoke-static {}, Lorg/chromium/base/CommandLine;->isInitialized()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 195
    invoke-static {}, Lorg/chromium/base/CommandLine;->getInstance()Lorg/chromium/base/CommandLine;

    move-result-object v11

    .line 196
    .local v11, "commandLine":Lorg/chromium/base/CommandLine;
    const-string v12, "host-package-name"

    invoke-virtual {v11, v12}, Lorg/chromium/base/CommandLine;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 197
    const-string v12, "host-package-label"

    invoke-virtual {v11, v12}, Lorg/chromium/base/CommandLine;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 198
    const-string v12, "package-name"

    invoke-virtual {v11, v12}, Lorg/chromium/base/CommandLine;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 199
    nop

    .line 200
    const-string v12, "package-version-name"

    invoke-virtual {v11, v12}, Lorg/chromium/base/CommandLine;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 202
    const-string v12, "host-version-code"

    invoke-virtual {v11, v12}, Lorg/chromium/base/CommandLine;->hasSwitch(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 203
    nop

    .line 204
    invoke-virtual {v11, v12}, Lorg/chromium/base/CommandLine;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 207
    :cond_0
    const-string v12, "package-version-code"

    invoke-virtual {v11, v12}, Lorg/chromium/base/CommandLine;->hasSwitch(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 208
    nop

    .line 209
    invoke-virtual {v11, v12}, Lorg/chromium/base/CommandLine;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 208
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    move-object v11, v10

    move-object v10, v9

    move-object v9, v8

    move-object v8, v7

    move-object v7, v6

    move-object v6, v0

    goto :goto_0

    .line 207
    :cond_1
    move-object v11, v10

    move-object v10, v9

    move-object v9, v8

    move-object v8, v7

    move-object v7, v6

    move-object v6, v0

    goto :goto_0

    .line 194
    .end local v11    # "commandLine":Lorg/chromium/base/CommandLine;
    :cond_2
    move-object v11, v10

    move-object v10, v9

    move-object v9, v8

    move-object v8, v7

    move-object v7, v6

    move-object v6, v0

    .line 213
    .end local v0    # "providedHostPackageName":Ljava/lang/String;
    .local v6, "providedHostPackageName":Ljava/lang/String;
    .local v7, "providedHostPackageLabel":Ljava/lang/String;
    .local v8, "providedPackageName":Ljava/lang/String;
    .local v9, "providedPackageVersionName":Ljava/lang/String;
    .local v10, "providedHostVersionCode":Ljava/lang/Long;
    .local v11, "providedPackageVersionCode":Ljava/lang/Long;
    :goto_0
    if-eqz v6, :cond_3

    if-eqz v7, :cond_3

    if-eqz v10, :cond_3

    if-eqz v8, :cond_3

    if-eqz v9, :cond_3

    if-eqz v11, :cond_3

    move v0, v2

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    move v13, v0

    .line 221
    .local v13, "hostInformationProvided":Z
    move-object v0, v4

    .line 223
    .local v0, "appInstalledPackageName":Ljava/lang/String;
    if-eqz v13, :cond_4

    .line 224
    iput-object v6, v1, Lorg/chromium/base/BuildInfo;->hostPackageName:Ljava/lang/String;

    .line 225
    iput-object v7, v1, Lorg/chromium/base/BuildInfo;->hostPackageLabel:Ljava/lang/String;

    .line 226
    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    iput-wide v14, v1, Lorg/chromium/base/BuildInfo;->hostVersionCode:J

    .line 227
    iput-object v9, v1, Lorg/chromium/base/BuildInfo;->versionName:Ljava/lang/String;

    .line 228
    iput-object v8, v1, Lorg/chromium/base/BuildInfo;->packageName:Ljava/lang/String;

    .line 229
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    iput-wide v14, v1, Lorg/chromium/base/BuildInfo;->versionCode:J

    .line 231
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v14

    sput-object v14, Lorg/chromium/base/BuildInfo;->sBrowserApplicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object v2, v6

    move-object v15, v7

    move-object v6, v0

    goto/16 :goto_4

    .line 236
    :cond_4
    move-object v14, v0

    .line 244
    .local v14, "sdkQualifiedName":Ljava/lang/String;
    invoke-static {}, Lorg/chromium/base/ContextUtils;->isSdkSandboxProcess()Z

    move-result v15

    if-eqz v15, :cond_6

    .line 245
    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v15

    add-int/lit16 v15, v15, -0x2710

    .line 246
    .local v15, "hostId":I
    invoke-virtual {v5, v15}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v2

    .line 248
    .local v2, "packageNames":[Ljava/lang/String;
    const/16 v17, 0x0

    array-length v12, v2

    if-lez v12, :cond_5

    .line 252
    aget-object v0, v2, v17

    .line 253
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v18, v2

    .end local v2    # "packageNames":[Ljava/lang/String;
    .local v18, "packageNames":[Ljava/lang/String;
    const-string v2, ":"

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    goto :goto_2

    .line 248
    .end local v18    # "packageNames":[Ljava/lang/String;
    .restart local v2    # "packageNames":[Ljava/lang/String;
    :cond_5
    move-object/from16 v18, v2

    .end local v2    # "packageNames":[Ljava/lang/String;
    .restart local v18    # "packageNames":[Ljava/lang/String;
    goto :goto_2

    .line 244
    .end local v15    # "hostId":I
    .end local v18    # "packageNames":[Ljava/lang/String;
    :cond_6
    const/16 v17, 0x0

    .line 257
    :goto_2
    move/from16 v2, v17

    invoke-static {v0, v2}, Lorg/chromium/base/PackageUtils;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v12

    .line 258
    .local v12, "pi":Landroid/content/pm/PackageInfo;
    iput-object v14, v1, Lorg/chromium/base/BuildInfo;->hostPackageName:Ljava/lang/String;

    .line 259
    iget-object v2, v12, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v5, v2}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Lorg/chromium/base/BuildInfo;->nullToEmpty(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lorg/chromium/base/BuildInfo;->hostPackageLabel:Ljava/lang/String;

    .line 260
    move-object v2, v6

    move-object v15, v7

    .end local v6    # "providedHostPackageName":Ljava/lang/String;
    .end local v7    # "providedHostPackageLabel":Ljava/lang/String;
    .local v2, "providedHostPackageName":Ljava/lang/String;
    .local v15, "providedHostPackageLabel":Ljava/lang/String;
    invoke-static {v12}, Lorg/chromium/base/BuildInfo;->packageVersionCode(Landroid/content/pm/PackageInfo;)J

    move-result-wide v6

    iput-wide v6, v1, Lorg/chromium/base/BuildInfo;->hostVersionCode:J

    .line 262
    sget-object v6, Lorg/chromium/base/BuildInfo;->sBrowserPackageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v6, :cond_7

    .line 263
    sget-object v6, Lorg/chromium/base/BuildInfo;->sBrowserPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    iput-object v6, v1, Lorg/chromium/base/BuildInfo;->packageName:Ljava/lang/String;

    .line 264
    sget-object v6, Lorg/chromium/base/BuildInfo;->sBrowserPackageInfo:Landroid/content/pm/PackageInfo;

    invoke-static {v6}, Lorg/chromium/base/BuildInfo;->packageVersionCode(Landroid/content/pm/PackageInfo;)J

    move-result-wide v6

    iput-wide v6, v1, Lorg/chromium/base/BuildInfo;->versionCode:J

    .line 265
    sget-object v6, Lorg/chromium/base/BuildInfo;->sBrowserPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-static {v6}, Lorg/chromium/base/BuildInfo;->nullToEmpty(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/chromium/base/BuildInfo;->versionName:Ljava/lang/String;

    .line 266
    sget-object v6, Lorg/chromium/base/BuildInfo;->sBrowserPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    sput-object v6, Lorg/chromium/base/BuildInfo;->sBrowserApplicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 267
    const/4 v6, 0x0

    sput-object v6, Lorg/chromium/base/BuildInfo;->sBrowserPackageInfo:Landroid/content/pm/PackageInfo;

    goto :goto_3

    .line 269
    :cond_7
    iput-object v4, v1, Lorg/chromium/base/BuildInfo;->packageName:Ljava/lang/String;

    .line 270
    iget-wide v6, v1, Lorg/chromium/base/BuildInfo;->hostVersionCode:J

    iput-wide v6, v1, Lorg/chromium/base/BuildInfo;->versionCode:J

    .line 271
    iget-object v6, v12, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-static {v6}, Lorg/chromium/base/BuildInfo;->nullToEmpty(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/chromium/base/BuildInfo;->versionName:Ljava/lang/String;

    .line 272
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    sput-object v6, Lorg/chromium/base/BuildInfo;->sBrowserApplicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 276
    .end local v12    # "pi":Landroid/content/pm/PackageInfo;
    .end local v14    # "sdkQualifiedName":Ljava/lang/String;
    :goto_3
    move-object v6, v0

    .end local v0    # "appInstalledPackageName":Ljava/lang/String;
    .local v6, "appInstalledPackageName":Ljava/lang/String;
    :goto_4
    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/BuildInfo;->nullToEmpty(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lorg/chromium/base/BuildInfo;->installerPackageName:Ljava/lang/String;

    .line 278
    const-string v0, "com.google.android.gms"

    const/4 v7, 0x0

    invoke-static {v0, v7}, Lorg/chromium/base/PackageUtils;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v12

    .line 279
    .local v12, "gmsPackageInfo":Landroid/content/pm/PackageInfo;
    if-eqz v12, :cond_8

    invoke-static {v12}, Lorg/chromium/base/BuildInfo;->packageVersionCode(Landroid/content/pm/PackageInfo;)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    .line 280
    :cond_8
    const-string v0, "gms versionCode not available."

    :goto_5
    iput-object v0, v1, Lorg/chromium/base/BuildInfo;->gmsVersionCode:Ljava/lang/String;

    .line 286
    const-string v0, "projekt.substratum"

    invoke-static {v0}, Lorg/chromium/base/PackageUtils;->isPackageInstalled(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lorg/chromium/base/BuildInfo;->customThemes:Ljava/lang/String;

    .line 288
    const-string v7, "Not Enabled"

    .line 290
    .local v7, "currentResourcesVersion":Ljava/lang/String;
    sget v0, Lorg/chromium/build/BuildConfig;->R_STRING_PRODUCT_VERSION:I

    if-eqz v0, :cond_9

    .line 296
    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget v14, Lorg/chromium/build/BuildConfig;->R_STRING_PRODUCT_VERSION:I

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v7, v0

    .line 300
    goto :goto_6

    .line 298
    :catch_0
    move-exception v0

    .line 299
    .local v0, "e":Ljava/lang/Exception;
    const-string v7, "Not found"

    .line 302
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_9
    :goto_6
    iput-object v7, v1, Lorg/chromium/base/BuildInfo;->resourcesVersion:Ljava/lang/String;

    .line 304
    const-string v0, ", "

    sget-object v14, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    invoke-static {v0, v14}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lorg/chromium/base/BuildInfo;->abiString:Ljava/lang/String;

    .line 307
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    sget-object v14, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 308
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    move-object/from16 v18, v2

    .end local v2    # "providedHostPackageName":Ljava/lang/String;
    .local v18, "providedHostPackageName":Ljava/lang/String;
    const/16 v2, 0x80

    invoke-static {v14, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 307
    const/4 v14, 0x0

    invoke-virtual {v0, v14, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lorg/chromium/base/BuildInfo;->androidBuildFingerprint:Ljava/lang/String;

    .line 311
    const-string v0, "uimode"

    invoke-virtual {v3, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/app/UiModeManager;

    .line 312
    .local v2, "uiModeManager":Landroid/app/UiModeManager;
    if-eqz v2, :cond_a

    .line 313
    invoke-virtual {v2}, Landroid/app/UiModeManager;->getCurrentModeType()I

    move-result v0

    const/4 v14, 0x4

    if-ne v0, v14, :cond_a

    const/4 v0, 0x1

    goto :goto_7

    :cond_a
    const/4 v0, 0x0

    :goto_7
    iput-boolean v0, v1, Lorg/chromium/base/BuildInfo;->isTV:Z

    .line 317
    :try_start_1
    const-string v0, "android.hardware.type.automotive"

    invoke-virtual {v5, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 325
    .local v0, "isAutomotive":Z
    move-object/from16 v16, v2

    goto :goto_8

    .line 318
    .end local v0    # "isAutomotive":Z
    :catch_1
    move-exception v0

    .line 319
    .local v0, "e":Ljava/lang/SecurityException;
    const-string v14, "BuildInfo"

    move-object/from16 v16, v2

    .end local v2    # "uiModeManager":Landroid/app/UiModeManager;
    .local v16, "uiModeManager":Landroid/app/UiModeManager;
    const-string v2, "Unable to query for Automotive system feature"

    invoke-static {v14, v2, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 324
    const/4 v2, 0x0

    move v0, v2

    .line 326
    .local v0, "isAutomotive":Z
    :goto_8
    iput-boolean v0, v1, Lorg/chromium/base/BuildInfo;->isAutomotive:Z

    .line 328
    const/4 v2, 0x0

    .line 329
    .local v2, "vulkanLevel":I
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    move/from16 v19, v0

    .end local v0    # "isAutomotive":Z
    .local v19, "isAutomotive":Z
    const/16 v0, 0x21

    if-lt v14, v0, :cond_e

    .line 330
    invoke-virtual {v5}, Landroid/content/pm/PackageManager;->getSystemAvailableFeatures()[Landroid/content/pm/FeatureInfo;

    move-result-object v0

    .line 331
    .local v0, "features":[Landroid/content/pm/FeatureInfo;
    if-eqz v0, :cond_d

    .line 332
    array-length v14, v0

    move-object/from16 v20, v0

    const/4 v0, 0x0

    .end local v0    # "features":[Landroid/content/pm/FeatureInfo;
    .local v20, "features":[Landroid/content/pm/FeatureInfo;
    :goto_9
    if-ge v0, v14, :cond_c

    move/from16 v17, v0

    aget-object v0, v20, v17

    .line 333
    .local v0, "feature":Landroid/content/pm/FeatureInfo;
    move/from16 v21, v2

    .end local v2    # "vulkanLevel":I
    .local v21, "vulkanLevel":I
    const-string v2, "android.software.vulkan.deqp.level"

    move-object/from16 v22, v3

    .end local v3    # "appContext":Landroid/content/Context;
    .local v22, "appContext":Landroid/content/Context;
    iget-object v3, v0, Landroid/content/pm/FeatureInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 334
    iget v2, v0, Landroid/content/pm/FeatureInfo;->version:I

    .line 335
    .end local v21    # "vulkanLevel":I
    .restart local v2    # "vulkanLevel":I
    goto :goto_b

    .line 332
    .end local v0    # "feature":Landroid/content/pm/FeatureInfo;
    .end local v2    # "vulkanLevel":I
    .restart local v21    # "vulkanLevel":I
    :cond_b
    add-int/lit8 v0, v17, 0x1

    move/from16 v2, v21

    move-object/from16 v3, v22

    goto :goto_9

    .end local v21    # "vulkanLevel":I
    .end local v22    # "appContext":Landroid/content/Context;
    .restart local v2    # "vulkanLevel":I
    .restart local v3    # "appContext":Landroid/content/Context;
    :cond_c
    move/from16 v21, v2

    move-object/from16 v22, v3

    .end local v2    # "vulkanLevel":I
    .end local v3    # "appContext":Landroid/content/Context;
    .restart local v21    # "vulkanLevel":I
    .restart local v22    # "appContext":Landroid/content/Context;
    goto :goto_a

    .line 331
    .end local v20    # "features":[Landroid/content/pm/FeatureInfo;
    .end local v21    # "vulkanLevel":I
    .end local v22    # "appContext":Landroid/content/Context;
    .local v0, "features":[Landroid/content/pm/FeatureInfo;
    .restart local v2    # "vulkanLevel":I
    .restart local v3    # "appContext":Landroid/content/Context;
    :cond_d
    move-object/from16 v20, v0

    move/from16 v21, v2

    move-object/from16 v22, v3

    .end local v0    # "features":[Landroid/content/pm/FeatureInfo;
    .end local v2    # "vulkanLevel":I
    .end local v3    # "appContext":Landroid/content/Context;
    .restart local v20    # "features":[Landroid/content/pm/FeatureInfo;
    .restart local v21    # "vulkanLevel":I
    .restart local v22    # "appContext":Landroid/content/Context;
    goto :goto_a

    .line 329
    .end local v20    # "features":[Landroid/content/pm/FeatureInfo;
    .end local v21    # "vulkanLevel":I
    .end local v22    # "appContext":Landroid/content/Context;
    .restart local v2    # "vulkanLevel":I
    .restart local v3    # "appContext":Landroid/content/Context;
    :cond_e
    move/from16 v21, v2

    move-object/from16 v22, v3

    .line 340
    .end local v2    # "vulkanLevel":I
    .end local v3    # "appContext":Landroid/content/Context;
    .restart local v21    # "vulkanLevel":I
    .restart local v22    # "appContext":Landroid/content/Context;
    :goto_a
    move/from16 v2, v21

    .end local v21    # "vulkanLevel":I
    .restart local v2    # "vulkanLevel":I
    :goto_b
    iput v2, v1, Lorg/chromium/base/BuildInfo;->vulkanDeqpLevel:I

    .line 341
    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/base/BuildInfo-IA;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/base/BuildInfo;-><init>()V

    return-void
.end method

.method private static getAll()[Ljava/lang/String;
    .locals 1

    .line 95
    invoke-static {}, Lorg/chromium/base/BuildInfo;->getInstance()Lorg/chromium/base/BuildInfo;

    move-result-object v0

    invoke-direct {v0}, Lorg/chromium/base/BuildInfo;->getAllProperties()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getAllProperties()[Ljava/lang/String;
    .locals 33

    .line 102
    move-object/from16 v0, p0

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    sget-object v3, Landroid/os/Build;->ID:Ljava/lang/String;

    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 108
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->TYPE:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->BOARD:Ljava/lang/String;

    iget-object v9, v0, Lorg/chromium/base/BuildInfo;->hostPackageName:Ljava/lang/String;

    iget-wide v10, v0, Lorg/chromium/base/BuildInfo;->hostVersionCode:J

    .line 112
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v0, Lorg/chromium/base/BuildInfo;->hostPackageLabel:Ljava/lang/String;

    iget-object v12, v0, Lorg/chromium/base/BuildInfo;->packageName:Ljava/lang/String;

    iget-wide v13, v0, Lorg/chromium/base/BuildInfo;->versionCode:J

    .line 115
    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    iget-object v14, v0, Lorg/chromium/base/BuildInfo;->versionName:Ljava/lang/String;

    iget-object v15, v0, Lorg/chromium/base/BuildInfo;->androidBuildFingerprint:Ljava/lang/String;

    move-object/from16 v16, v1

    iget-object v1, v0, Lorg/chromium/base/BuildInfo;->gmsVersionCode:Ljava/lang/String;

    move-object/from16 v17, v1

    iget-object v1, v0, Lorg/chromium/base/BuildInfo;->installerPackageName:Ljava/lang/String;

    move-object/from16 v18, v1

    iget-object v1, v0, Lorg/chromium/base/BuildInfo;->abiString:Ljava/lang/String;

    move-object/from16 v19, v1

    iget-object v1, v0, Lorg/chromium/base/BuildInfo;->customThemes:Ljava/lang/String;

    move-object/from16 v20, v1

    iget-object v1, v0, Lorg/chromium/base/BuildInfo;->resourcesVersion:Ljava/lang/String;

    .line 124
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v21

    move-object/from16 v22, v1

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 123
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v21

    .line 125
    invoke-static {}, Lorg/chromium/base/BuildInfo;->isDebugAndroid()Z

    move-result v1

    const-string v23, "1"

    const-string v24, "0"

    if-eqz v1, :cond_0

    move-object/from16 v1, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    move-object/from16 v20, v22

    move-object/from16 v22, v23

    goto :goto_0

    :cond_0
    move-object/from16 v1, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    move-object/from16 v20, v22

    move-object/from16 v22, v24

    .line 126
    :goto_0
    move-object/from16 v25, v1

    iget-boolean v1, v0, Lorg/chromium/base/BuildInfo;->isTV:Z

    if-eqz v1, :cond_1

    move-object/from16 v1, v23

    goto :goto_1

    :cond_1
    move-object/from16 v1, v23

    move-object/from16 v23, v24

    :goto_1
    move-object/from16 v26, v24

    sget-object v24, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    move-object/from16 v27, v1

    move-object/from16 v1, v25

    sget-object v25, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 129
    invoke-static {}, Lorg/chromium/base/BuildInfo;->isAtLeastT()Z

    move-result v28

    if-eqz v28, :cond_2

    move-object/from16 v28, v26

    move-object/from16 v26, v27

    goto :goto_2

    :cond_2
    move-object/from16 v28, v26

    .line 130
    :goto_2
    move-object/from16 v29, v1

    iget-boolean v1, v0, Lorg/chromium/base/BuildInfo;->isAutomotive:Z

    if-eqz v1, :cond_3

    move-object/from16 v1, v27

    goto :goto_3

    :cond_3
    move-object/from16 v1, v27

    move-object/from16 v27, v28

    .line 131
    :goto_3
    invoke-static {}, Landroidx/core/os/BuildCompat;->isAtLeastU()Z

    move-result v30

    if-eqz v30, :cond_4

    move-object/from16 v30, v28

    move-object/from16 v28, v1

    goto :goto_4

    :cond_4
    move-object/from16 v30, v28

    .line 132
    :goto_4
    invoke-static {}, Lorg/chromium/base/BuildInfo;->targetsAtLeastU()Z

    move-result v31

    if-eqz v31, :cond_5

    goto :goto_5

    :cond_5
    move-object/from16 v1, v30

    :goto_5
    sget-object v30, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    move-object/from16 v31, v1

    iget v1, v0, Lorg/chromium/base/BuildInfo;->vulkanDeqpLevel:I

    .line 134
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v32, v31

    move-object/from16 v31, v1

    move-object/from16 v1, v29

    move-object/from16 v29, v32

    filled-new-array/range {v1 .. v31}, [Ljava/lang/String;

    move-result-object v1

    .line 102
    return-object v1
.end method

.method public static getInstance()Lorg/chromium/base/BuildInfo;
    .locals 1

    .line 172
    sget-boolean v0, Lorg/chromium/build/BuildConfig;->IS_FOR_TEST:Z

    if-eqz v0, :cond_0

    .line 173
    new-instance v0, Lorg/chromium/base/BuildInfo;

    invoke-direct {v0}, Lorg/chromium/base/BuildInfo;-><init>()V

    return-object v0

    .line 175
    :cond_0
    invoke-static {}, Lorg/chromium/base/BuildInfo$Holder;->-$$Nest$sfgetINSTANCE()Lorg/chromium/base/BuildInfo;

    move-result-object v0

    return-object v0
.end method

.method public static isAtLeastT()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 376
    invoke-static {}, Landroidx/core/os/BuildCompat;->isAtLeastT()Z

    move-result v0

    return v0
.end method

.method public static isDebugAndroid()Z
    .locals 2

    .line 348
    const-string v0, "eng"

    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "userdebug"

    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isDebugAndroidOrApp()Z
    .locals 1

    .line 365
    invoke-static {}, Lorg/chromium/base/BuildInfo;->isDebugAndroid()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lorg/chromium/base/BuildInfo;->isDebugApp()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isDebugApp()Z
    .locals 2

    .line 356
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 357
    .local v0, "appFlags":I
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static nullToEmpty(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1
    .param p0, "seq"    # Ljava/lang/CharSequence;

    .line 139
    if-nez p0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static packageVersionCode(Landroid/content/pm/PackageInfo;)J
    .locals 2
    .param p0, "pi"    # Landroid/content/pm/PackageInfo;

    .line 147
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 148
    invoke-static {p0}, Lorg/chromium/base/compat/ApiHelperForP;->getLongVersionCode(Landroid/content/pm/PackageInfo;)J

    move-result-wide v0

    return-wide v0

    .line 150
    :cond_0
    iget v0, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public static setBrowserPackageInfo(Landroid/content/pm/PackageInfo;)V
    .locals 1
    .param p0, "packageInfo"    # Landroid/content/pm/PackageInfo;

    .line 158
    sget-boolean v0, Lorg/chromium/base/BuildInfo;->sInitialized:Z

    if-nez v0, :cond_0

    .line 159
    sput-object p0, Lorg/chromium/base/BuildInfo;->sBrowserPackageInfo:Landroid/content/pm/PackageInfo;

    .line 160
    return-void

    .line 158
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static targetsAtLeastT()Z
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 387
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 390
    .local v0, "target":I
    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static targetsAtLeastU()Z
    .locals 2

    .line 399
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 411
    .local v0, "target":I
    const/16 v1, 0x22

    if-lt v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method public getBrowserApplicationInfo()Landroid/content/pm/ApplicationInfo;
    .locals 1

    .line 166
    sget-object v0, Lorg/chromium/base/BuildInfo;->sBrowserApplicationInfo:Landroid/content/pm/ApplicationInfo;

    return-object v0
.end method
