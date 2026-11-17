package androidx.camera.core.impl;

import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.IBinder;
import androidx.arch.core.util.Function;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.QuirkSettings;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* loaded from: classes.dex */
public class QuirkSettingsLoader implements Function<Context, QuirkSettings> {
    public static final String KEY_DEFAULT_QUIRK_ENABLED = "androidx.camera.core.quirks.DEFAULT_QUIRK_ENABLED";
    public static final String KEY_QUIRK_FORCE_DISABLED = "androidx.camera.core.quirks.FORCE_DISABLED";
    public static final String KEY_QUIRK_FORCE_ENABLED = "androidx.camera.core.quirks.FORCE_ENABLED";
    private static final String TAG = "QuirkSettingsLoader";

    @Override // androidx.arch.core.util.Function
    public QuirkSettings apply(Context context) {
        PackageManager packageManager = context.getPackageManager();
        try {
            Bundle metadata = packageManager.getServiceInfo(new ComponentName(context, (Class<?>) MetadataHolderService.class), 640).metaData;
            if (metadata == null) {
                Logger.w(TAG, "No metadata in MetadataHolderService.");
                return null;
            }
            return buildQuirkSettings(context, metadata);
        } catch (PackageManager.NameNotFoundException e) {
            Logger.d(TAG, "QuirkSettings$MetadataHolderService is not found.");
            return null;
        }
    }

    private static QuirkSettings buildQuirkSettings(Context context, Bundle metadata) {
        boolean defaultEnabled = metadata.getBoolean(KEY_DEFAULT_QUIRK_ENABLED, true);
        String[] forceEnabled = loadQuirks(context, metadata, KEY_QUIRK_FORCE_ENABLED);
        String[] forceDisabled = loadQuirks(context, metadata, KEY_QUIRK_FORCE_DISABLED);
        Logger.d(TAG, "Loaded quirk settings from metadata:");
        Logger.d(TAG, "  KEY_DEFAULT_QUIRK_ENABLED = " + defaultEnabled);
        Logger.d(TAG, "  KEY_QUIRK_FORCE_ENABLED = " + Arrays.toString(forceEnabled));
        Logger.d(TAG, "  KEY_QUIRK_FORCE_DISABLED = " + Arrays.toString(forceDisabled));
        return new QuirkSettings.Builder().setEnabledWhenDeviceHasQuirk(defaultEnabled).forceEnableQuirks(resolveQuirkNames(forceEnabled)).forceDisableQuirks(resolveQuirkNames(forceDisabled)).build();
    }

    private static String[] loadQuirks(Context context, Bundle metadata, String key) {
        if (!metadata.containsKey(key)) {
            return new String[0];
        }
        int resourceId = metadata.getInt(key, -1);
        if (resourceId == -1) {
            Logger.w(TAG, "Resource ID not found for key: " + key);
            return new String[0];
        }
        try {
            return context.getResources().getStringArray(resourceId);
        } catch (Resources.NotFoundException e) {
            Logger.w(TAG, "Quirk class names resource not found: " + resourceId, e);
            return new String[0];
        }
    }

    private static Set<Class<? extends Quirk>> resolveQuirkNames(String[] nameArray) {
        Set<Class<? extends Quirk>> quirkSet = new HashSet<>();
        for (String quirkName : nameArray) {
            Class<? extends Quirk> clazz = resolveQuirkName(quirkName);
            if (clazz != null) {
                quirkSet.add(clazz);
            }
        }
        return quirkSet;
    }

    private static Class<? extends Quirk> resolveQuirkName(String className) {
        try {
            Class cls = Class.forName(className);
            if (!Quirk.class.isAssignableFrom(cls)) {
                Logger.w(TAG, className + " does not implement the Quirk interface.");
                return null;
            }
            return cls;
        } catch (ClassNotFoundException e) {
            Logger.w(TAG, "Class not found: " + className, e);
            return null;
        }
    }

    public static class MetadataHolderService extends Service {
        private MetadataHolderService() {
        }

        @Override // android.app.Service
        public IBinder onBind(Intent intent) {
            throw new UnsupportedOperationException();
        }
    }
}
