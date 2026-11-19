package org.chromium.base;

import android.app.UiModeManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.FeatureInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Process;
import android.text.TextUtils;
import androidx.core.os.BuildCompat;
import org.chromium.base.compat.ApiHelperForP;
import org.chromium.build.BuildConfig;

/* carregado de: classes17.dex */
public class BuildInfo {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static final int MAX_FINGERPRINT_LENGTH = 128;
    private static final String TAG = "BuildInfo";
    private static ApplicationInfo sBrowserApplicationInfo;
    private static PackageInfo sBrowserPackageInfo;
    private static boolean sInitialized;
    public final String abiString;
    public final String androidBuildFingerprint;
    public final String customThemes;
    public final String gmsVersionCode;
    public final String hostPackageLabel;
    public final String hostPackageName;
    public final long hostVersionCode;
    public final String installerPackageName;
    public final boolean isAutomotive;
    public final boolean isTV;
    public final String packageName;
    public final String resourcesVersion;
    public final long versionCode;
    public final String versionName;
    public final int vulkanDeqpLevel;

    private static class Holder {
        private static final BuildInfo INSTANCE = new BuildInfo();

        private Holder() {
        }
    }

    private static String[] getAll() {
        return getInstance().getAllProperties();
    }

    private String[] getAllProperties() {
        String str;
        String str2;
        String str3;
        String str4;
        String str5;
        String str6;
        String str7;
        String str8;
        String str9;
        String str10;
        String str11;
        String str12 = Build.BRAND;
        String str13 = Build.DEVICE;
        String str14 = Build.ID;
        String str15 = Build.MANUFACTURER;
        String str16 = Build.MODEL;
        String valueOf = String.valueOf(Build.VERSION.SDK_INT);
        String str17 = Build.TYPE;
        String str18 = Build.BOARD;
        String str19 = this.hostPackageName;
        String valueOf2 = String.valueOf(this.hostVersionCode);
        String str20 = this.hostPackageLabel;
        String str21 = this.packageName;
        String valueOf3 = String.valueOf(this.versionCode);
        String str22 = this.versionName;
        String str23 = this.androidBuildFingerprint;
        String str24 = this.gmsVersionCode;
        String str25 = this.installerPackageName;
        String str26 = this.abiString;
        String str27 = this.customThemes;
        String str28 = this.resourcesVersion;
        String valueOf4 = String.valueOf(ContextUtils.getApplicationContext().getApplicationInfo().targetSdkVersion);
        String str29 = "1";
        if (isDebugAndroid()) {
            str = str12;
            str2 = str24;
            str3 = str25;
            str4 = str26;
            str5 = str27;
            str6 = str28;
            str7 = "1";
        } else {
            str = str12;
            str2 = str24;
            str3 = str25;
            str4 = str26;
            str5 = str27;
            str6 = str28;
            str7 = "0";
        }
        String str30 = str;
        if (this.isTV) {
            str8 = "1";
        } else {
            str8 = "1";
            str29 = "0";
        }
        String str31 = "0";
        String str32 = Build.VERSION.INCREMENTAL;
        String str33 = str8;
        String str34 = Build.HARDWARE;
        if (isAtLeastT()) {
            str9 = str31;
            str31 = str33;
        } else {
            str9 = str31;
        }
        if (this.isAutomotive) {
            str10 = str33;
        } else {
            str10 = str33;
            str33 = str9;
        }
        if (BuildCompat.isAtLeastU()) {
            str11 = str9;
            str9 = str10;
        } else {
            str11 = str9;
        }
        if (!targetsAtLeastU()) {
            str10 = str11;
        }
        return new String[]{str30, str13, str14, str15, str16, valueOf, str17, str18, str19, valueOf2, str20, str21, valueOf3, str22, str23, str2, str3, str4, str5, str6, valueOf4, str7, str29, str32, str34, str31, str33, str9, str10, Build.VERSION.CODENAME, String.valueOf(this.vulkanDeqpLevel)};
    }

    private static String nullToEmpty(CharSequence seq) {
        return seq == null ? "" : seq.toString();
    }

    public static long packageVersionCode(PackageInfo pi) {
        if (Build.VERSION.SDK_INT >= 28) {
            return ApiHelperForP.getLongVersionCode(pi);
        }
        return pi.versionCode;
    }

    public static void setBrowserPackageInfo(PackageInfo packageInfo) {
        if (sInitialized) {
            throw new AssertionError();
        }
        sBrowserPackageInfo = packageInfo;
    }

    public ApplicationInfo getBrowserApplicationInfo() {
        return sBrowserApplicationInfo;
    }

    public static BuildInfo getInstance() {
        if (BuildConfig.IS_FOR_TEST) {
            return new BuildInfo();
        }
        return Holder.INSTANCE;
    }

    private BuildInfo() {
        Long providedPackageVersionCode;
        Long providedPackageVersionCode2;
        String providedPackageVersionName;
        String providedPackageVersionName2;
        String providedPackageName;
        String providedHostPackageLabel;
        int i;
        String providedHostPackageName;
        String providedHostPackageName2;
        boolean isAutomotive;
        int vulkanLevel;
        int vulkanLevel2;
        sInitialized = true;
        Context appContext = ContextUtils.getApplicationContext();
        String appContextPackageName = appContext.getPackageName();
        PackageManager pm = appContext.getPackageManager();
        if (!CommandLine.isInitialized()) {
            providedPackageVersionCode = null;
            providedPackageVersionCode2 = null;
            providedPackageVersionName = null;
            providedPackageVersionName2 = null;
            providedPackageName = null;
            providedHostPackageLabel = null;
        } else {
            CommandLine commandLine = CommandLine.getInstance();
            String providedHostPackageName3 = commandLine.getSwitchValue(BaseSwitches.HOST_PACKAGE_NAME);
            String providedHostPackageLabel2 = commandLine.getSwitchValue(BaseSwitches.HOST_PACKAGE_LABEL);
            String providedPackageName2 = commandLine.getSwitchValue(BaseSwitches.PACKAGE_NAME);
            String providedPackageVersionName3 = commandLine.getSwitchValue(BaseSwitches.PACKAGE_VERSION_NAME);
            Long providedHostVersionCode = commandLine.hasSwitch(BaseSwitches.HOST_VERSION_CODE) ? Long.valueOf(Long.parseLong(commandLine.getSwitchValue(BaseSwitches.HOST_VERSION_CODE))) : null;
            if (!commandLine.hasSwitch(BaseSwitches.PACKAGE_VERSION_CODE)) {
                providedPackageVersionCode = null;
                providedPackageVersionCode2 = providedHostVersionCode;
                providedPackageVersionName = providedPackageVersionName3;
                providedPackageVersionName2 = providedPackageName2;
                providedPackageName = providedHostPackageLabel2;
                providedHostPackageLabel = providedHostPackageName3;
            } else {
                Long providedPackageVersionCode3 = Long.valueOf(Long.parseLong(commandLine.getSwitchValue(BaseSwitches.PACKAGE_VERSION_CODE)));
                providedPackageVersionCode = providedPackageVersionCode3;
                providedPackageVersionCode2 = providedHostVersionCode;
                providedPackageVersionName = providedPackageVersionName3;
                providedPackageVersionName2 = providedPackageName2;
                providedPackageName = providedHostPackageLabel2;
                providedHostPackageLabel = providedHostPackageName3;
            }
        }
        boolean hostInformationProvided = (providedHostPackageLabel == null || providedPackageName == null || providedPackageVersionCode2 == null || providedPackageVersionName2 == null || providedPackageVersionName == null || providedPackageVersionCode == null) ? false : true;
        String appInstalledPackageName = appContextPackageName;
        if (hostInformationProvided) {
            this.hostPackageName = providedHostPackageLabel;
            this.hostPackageLabel = providedPackageName;
            this.hostVersionCode = providedPackageVersionCode2.longValue();
            this.versionName = providedPackageVersionName;
            this.packageName = providedPackageVersionName2;
            this.versionCode = providedPackageVersionCode.longValue();
            sBrowserApplicationInfo = appContext.getApplicationInfo();
            providedHostPackageName = providedHostPackageLabel;
            providedHostPackageName2 = appInstalledPackageName;
        } else {
            String sdkQualifiedName = appInstalledPackageName;
            if (!ContextUtils.isSdkSandboxProcess()) {
                i = 0;
            } else {
                int hostId = Process.myUid() - 10000;
                String[] packageNames = pm.getPackagesForUid(hostId);
                i = 0;
                if (packageNames.length > 0) {
                    appInstalledPackageName = packageNames[0];
                    sdkQualifiedName = sdkQualifiedName + ":" + appInstalledPackageName;
                }
            }
            PackageInfo pi = PackageUtils.getPackageInfo(appInstalledPackageName, i);
            this.hostPackageName = sdkQualifiedName;
            this.hostPackageLabel = nullToEmpty(pm.getApplicationLabel(pi.applicationInfo));
            providedHostPackageName = providedHostPackageLabel;
            this.hostVersionCode = packageVersionCode(pi);
            if (sBrowserPackageInfo != null) {
                this.packageName = sBrowserPackageInfo.packageName;
                this.versionCode = packageVersionCode(sBrowserPackageInfo);
                this.versionName = nullToEmpty(sBrowserPackageInfo.versionName);
                sBrowserApplicationInfo = sBrowserPackageInfo.applicationInfo;
                sBrowserPackageInfo = null;
            } else {
                this.packageName = appContextPackageName;
                this.versionCode = this.hostVersionCode;
                this.versionName = nullToEmpty(pi.versionName);
                sBrowserApplicationInfo = appContext.getApplicationInfo();
            }
            providedHostPackageName2 = appInstalledPackageName;
        }
        this.installerPackageName = nullToEmpty(pm.getInstallerPackageName(providedHostPackageName2));
        PackageInfo gmsPackageInfo = PackageUtils.getPackageInfo("com.google.android.gms", 0);
        this.gmsVersionCode = gmsPackageInfo != null ? String.valueOf(packageVersionCode(gmsPackageInfo)) : "gms versionCode not available.";
        this.customThemes = String.valueOf(PackageUtils.isPackageInstalled("projekt.substratum"));
        String currentResourcesVersion = "Not Enabled";
        if (BuildConfig.R_STRING_PRODUCT_VERSION != 0) {
            try {
                currentResourcesVersion = ContextUtils.getApplicationContext().getString(BuildConfig.R_STRING_PRODUCT_VERSION);
            } catch (Exception e) {
                currentResourcesVersion = "Not found";
            }
        }
        this.resourcesVersion = currentResourcesVersion;
        this.abiString = TextUtils.join(", ", Build.SUPPORTED_ABIS);
        this.androidBuildFingerprint = Build.FINGERPRINT.substring(0, Math.min(Build.FINGERPRINT.length(), 128));
        UiModeManager uiModeManager = (UiModeManager) appContext.getSystemService("uimode");
        this.isTV = uiModeManager != null && uiModeManager.getCurrentModeType() == 4;
        try {
            isAutomotive = pm.hasSystemFeature("android.hardware.type.automotive");
        } catch (SecurityException e2) {
            Log.e(TAG, "Unable to query for Automotive system feature", (Throwable) e2);
            isAutomotive = false;
        }
        this.isAutomotive = isAutomotive;
        int vulkanLevel3 = 0;
        if (Build.VERSION.SDK_INT < 33) {
            vulkanLevel = 0;
        } else {
            FeatureInfo[] features = pm.getSystemAvailableFeatures();
            if (features == null) {
                vulkanLevel = 0;
            } else {
                int length = features.length;
                int i2 = 0;
                while (i2 < length) {
                    int i3 = i2;
                    FeatureInfo feature = features[i3];
                    int vulkanLevel4 = vulkanLevel3;
                    Context appContext2 = appContext;
                    if (!"android.software.vulkan.deqp.level".equals(feature.name)) {
                        i2 = i3 + 1;
                        vulkanLevel3 = vulkanLevel4;
                        appContext = appContext2;
                    } else {
                        vulkanLevel2 = feature.version;
                        break;
                    }
                }
                vulkanLevel = vulkanLevel3;
            }
        }
        vulkanLevel2 = vulkanLevel;
        this.vulkanDeqpLevel = vulkanLevel2;
    }

    public static boolean isDebugAndroid() {
        return "eng".equals(Build.TYPE) || "userdebug".equals(Build.TYPE);
    }

    public static boolean isDebugApp() {
        int appFlags = ContextUtils.getApplicationContext().getApplicationInfo().flags;
        return (appFlags & 2) != 0;
    }

    public static boolean isDebugAndroidOrApp() {
        return isDebugAndroid() || isDebugApp();
    }

    @Deprecated
    public static boolean isAtLeastT() {
        return BuildCompat.isAtLeastT();
    }

    @Deprecated
    public static boolean targetsAtLeastT() {
        int target = ContextUtils.getApplicationContext().getApplicationInfo().targetSdkVersion;
        return target >= 33;
    }

    public static boolean targetsAtLeastU() {
        int target = ContextUtils.getApplicationContext().getApplicationInfo().targetSdkVersion;
        return target >= 34;
    }
}
