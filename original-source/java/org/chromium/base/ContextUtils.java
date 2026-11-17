package org.chromium.base;

import android.app.Activity;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.os.Build;
import android.os.Handler;
import android.os.Process;
import android.preference.PreferenceManager;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.compat.ApiHelperForM;
import org.chromium.base.compat.ApiHelperForO;
import org.chromium.build.BuildConfig;

@JNINamespace("base::android")
/* loaded from: classes17.dex */
public class ContextUtils {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final int RECEIVER_EXPORTED = 2;
    public static final int RECEIVER_NOT_EXPORTED = 4;
    private static final String TAG = "ContextUtils";
    private static Context sApplicationContext;

    private static class Holder {
        private static SharedPreferences sSharedPreferences = ContextUtils.fetchAppSharedPreferences();

        private Holder() {
        }
    }

    public static Context getApplicationContext() {
        return sApplicationContext;
    }

    public static void initApplicationContext(Context appContext) {
        if (sApplicationContext != null && sApplicationContext != appContext && ((ContextWrapper) sApplicationContext).getBaseContext() != appContext) {
            throw new AssertionError();
        }
        initJavaSideApplicationContext(appContext);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static SharedPreferences fetchAppSharedPreferences() {
        StrictModeContext ignored = StrictModeContext.allowDiskWrites();
        try {
            SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(sApplicationContext);
            if (ignored != null) {
                ignored.close();
            }
            return defaultSharedPreferences;
        } catch (Throwable th) {
            if (ignored != null) {
                try {
                    ignored.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static SharedPreferences getAppSharedPreferences() {
        return Holder.sSharedPreferences;
    }

    public static void initApplicationContextForTests(Context appContext) {
        initJavaSideApplicationContext(appContext);
        Holder.sSharedPreferences = fetchAppSharedPreferences();
    }

    public static void clearApplicationContextForTests() {
        sApplicationContext = null;
        Holder.sSharedPreferences = null;
    }

    private static void initJavaSideApplicationContext(Context appContext) {
        if (appContext == null) {
            throw new AssertionError();
        }
        if (BuildConfig.ENABLE_ASSERTS && (appContext instanceof Application)) {
            appContext = new ContextWrapper(appContext);
        }
        sApplicationContext = appContext;
    }

    public static AssetManager getApplicationAssets() {
        Context context = getApplicationContext();
        while (context instanceof ContextWrapper) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        return context.getAssets();
    }

    public static boolean isIsolatedProcess() {
        return Process.isIsolated();
    }

    public static boolean isSdkSandboxProcess() {
        if (Build.VERSION.SDK_INT >= 33) {
            return Process.isSdkSandbox();
        }
        return false;
    }

    public static String getProcessName() {
        return ApiCompatibilityUtils.getProcessName();
    }

    public static boolean isProcess64Bit() {
        return ApiHelperForM.isProcess64Bit();
    }

    public static Activity activityFromContext(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                return (Activity) context;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    public static Intent registerProtectedBroadcastReceiver(Context context, BroadcastReceiver receiver, IntentFilter filter) {
        return registerBroadcastReceiver(context, receiver, filter, null, null, 0);
    }

    public static Intent registerProtectedBroadcastReceiver(Context context, BroadcastReceiver receiver, IntentFilter filter, Handler scheduler) {
        return registerBroadcastReceiver(context, receiver, filter, null, scheduler, 0);
    }

    public static Intent registerExportedBroadcastReceiver(Context context, BroadcastReceiver receiver, IntentFilter filter, String permission) {
        return registerBroadcastReceiver(context, receiver, filter, permission, null, 2);
    }

    public static Intent registerNonExportedBroadcastReceiver(Context context, BroadcastReceiver receiver, IntentFilter filter) {
        return registerBroadcastReceiver(context, receiver, filter, null, null, 4);
    }

    public static Intent registerNonExportedBroadcastReceiver(Context context, BroadcastReceiver receiver, IntentFilter filter, Handler scheduler) {
        return registerBroadcastReceiver(context, receiver, filter, null, scheduler, 4);
    }

    private static Intent registerBroadcastReceiver(Context context, BroadcastReceiver receiver, IntentFilter filter, String permission, Handler scheduler, int flags) {
        if (Build.VERSION.SDK_INT >= 26) {
            return ApiHelperForO.registerReceiver(context, receiver, filter, permission, scheduler, flags);
        }
        return context.registerReceiver(receiver, filter, permission, scheduler);
    }
}
