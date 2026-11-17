package org.chromium.base;

import android.app.Activity;
import java.util.Iterator;
import org.chromium.base.memory.MemoryPressureCallback;
import org.chromium.build.annotations.MainDex;

@MainDex
/* loaded from: classes17.dex */
public class MemoryPressureListener {
    private static final String ACTION_LOW_MEMORY = "org.chromium.base.ACTION_LOW_MEMORY";
    private static final String ACTION_TRIM_MEMORY = "org.chromium.base.ACTION_TRIM_MEMORY";
    private static final String ACTION_TRIM_MEMORY_MODERATE = "org.chromium.base.ACTION_TRIM_MEMORY_MODERATE";
    private static final String ACTION_TRIM_MEMORY_RUNNING_CRITICAL = "org.chromium.base.ACTION_TRIM_MEMORY_RUNNING_CRITICAL";
    private static ObserverList<MemoryPressureCallback> sCallbacks;

    interface Natives {
        void onMemoryPressure(int i);
    }

    private static void addNativeCallback() {
        ThreadUtils.assertOnUiThread();
        addCallback(new MemoryPressureCallback() { // from class: org.chromium.base.MemoryPressureListener$$ExternalSyntheticLambda0
            @Override // org.chromium.base.memory.MemoryPressureCallback
            public final void onPressure(int i) {
                MemoryPressureListenerJni.get().onMemoryPressure(i);
            }
        });
    }

    public static void addCallback(MemoryPressureCallback callback) {
        ThreadUtils.assertOnUiThread();
        if (sCallbacks == null) {
            sCallbacks = new ObserverList<>();
        }
        sCallbacks.addObserver(callback);
    }

    public static void removeCallback(MemoryPressureCallback callback) {
        ThreadUtils.assertOnUiThread();
        if (sCallbacks == null) {
            return;
        }
        sCallbacks.removeObserver(callback);
    }

    public static void notifyMemoryPressure(int pressure) {
        ThreadUtils.assertOnUiThread();
        if (sCallbacks == null) {
            return;
        }
        Iterator<MemoryPressureCallback> it = sCallbacks.iterator();
        while (it.hasNext()) {
            MemoryPressureCallback callback = it.next();
            callback.onPressure(pressure);
        }
    }

    public static boolean handleDebugIntent(Activity activity, String action) {
        ThreadUtils.assertOnUiThread();
        if (ACTION_LOW_MEMORY.equals(action)) {
            simulateLowMemoryPressureSignal(activity);
            return true;
        }
        if (ACTION_TRIM_MEMORY.equals(action)) {
            simulateTrimMemoryPressureSignal(activity, 80);
            return true;
        }
        if (ACTION_TRIM_MEMORY_RUNNING_CRITICAL.equals(action)) {
            simulateTrimMemoryPressureSignal(activity, 15);
            return true;
        }
        if (ACTION_TRIM_MEMORY_MODERATE.equals(action)) {
            simulateTrimMemoryPressureSignal(activity, 60);
            return true;
        }
        return false;
    }

    private static void simulateLowMemoryPressureSignal(Activity activity) {
        activity.getApplication().onLowMemory();
        activity.onLowMemory();
    }

    private static void simulateTrimMemoryPressureSignal(Activity activity, int level) {
        activity.getApplication().onTrimMemory(level);
        activity.onTrimMemory(level);
    }
}
