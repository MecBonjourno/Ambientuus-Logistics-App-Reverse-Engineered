package org.chromium.base;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.Window;
import j$.util.DesugarCollections;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.build.BuildConfig;

@JNINamespace("base::android")
/* carregado de: classes17.dex */
public class ApplicationStatus {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static final String CACHE_ACTIVITY_TASKID_KEY = "cache_activity_taskid_enabled";
    private static final String TOOLBAR_CALLBACK_WRAPPER_CLASS = "androidx.appcompat.app.ToolbarActionBar$ToolbarCallbackWrapper";
    private static Activity sActivity;
    private static ObserverList<ApplicationStateListener> sApplicationStateListeners;
    private static ObserverList<ActivityStateListener> sGeneralActivityStateListeners;
    private static ApplicationStateListener sNativeApplicationStateListener;
    private static ObserverList<TaskVisibilityListener> sTaskVisibilityListeners;
    private static ObserverList<WindowFocusChangedListener> sWindowFocusListeners;
    private static final Map<Activity, ActivityInfo> sActivityInfo = DesugarCollections.synchronizedMap(new HashMap());
    public static final Map<Activity, Integer> sActivityTaskId = DesugarCollections.synchronizedMap(new HashMap());
    private static int sCurrentApplicationState = 0;

    public interface ActivityStateListener {
        void onActivityStateChange(Activity activity, int i);
    }

    public interface ApplicationStateListener {
        void onApplicationStateChange(int i);
    }

    interface Natives {
        void onApplicationStateChange(int i);
    }

    public interface TaskVisibilityListener {
        void onTaskVisibilityChanged(int i, boolean z);
    }

    public interface WindowFocusChangedListener {
        void onWindowFocusChanged(Activity activity, boolean z);
    }

    private static class ActivityInfo {
        private ObserverList<ActivityStateListener> mListeners;
        private int mStatus;

        private ActivityInfo() {
            this.mStatus = 6;
            this.mListeners = new ObserverList<>();
        }

        public int getStatus() {
            return this.mStatus;
        }

        public void setStatus(int status) {
            this.mStatus = status;
        }

        public ObserverList<ActivityStateListener> getListeners() {
            return this.mListeners;
        }
    }

    private ApplicationStatus() {
    }

    public static void registerWindowFocusChangedListener(WindowFocusChangedListener listener) {
        if (!isInitialized()) {
            throw new AssertionError();
        }
        if (sWindowFocusListeners == null) {
            sWindowFocusListeners = new ObserverList<>();
        }
        sWindowFocusListeners.addObserver(listener);
    }

    public static void unregisterWindowFocusChangedListener(WindowFocusChangedListener listener) {
        if (sWindowFocusListeners == null) {
            return;
        }
        sWindowFocusListeners.removeObserver(listener);
    }

    public static void registerTaskVisibilityListener(TaskVisibilityListener listener) {
        if (!isInitialized()) {
            throw new AssertionError();
        }
        if (sTaskVisibilityListeners == null) {
            sTaskVisibilityListeners = new ObserverList<>();
        }
        sTaskVisibilityListeners.addObserver(listener);
    }

    public static void unregisterTaskVisibilityListener(TaskVisibilityListener listener) {
        if (sTaskVisibilityListeners == null) {
            return;
        }
        sTaskVisibilityListeners.removeObserver(listener);
    }

    public static void setCachingEnabled(boolean enabled) {
        SharedPreferences.Editor editor = ContextUtils.getAppSharedPreferences().edit();
        editor.putBoolean(CACHE_ACTIVITY_TASKID_KEY, enabled).apply();
    }

    public static boolean isCachingEnabled() {
        StrictModeContext ignored = StrictModeContext.allowDiskReads();
        try {
            boolean z = ContextUtils.getAppSharedPreferences().getBoolean(CACHE_ACTIVITY_TASKID_KEY, false);
            if (ignored != null) {
                ignored.close();
            }
            return z;
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

    public static int getTaskId(Activity activity) {
        if (!isCachingEnabled()) {
            return activity.getTaskId();
        }
        if (!sActivityTaskId.containsKey(activity)) {
            synchronized (sActivityTaskId) {
                sActivityTaskId.put(activity, Integer.valueOf(activity.getTaskId()));
            }
        }
        return sActivityTaskId.get(activity).intValue();
    }

    static class WindowCallbackProxy implements InvocationHandler {
        private final Activity mActivity;
        private final Window.Callback mCallback;

        public WindowCallbackProxy(Activity activity, Window.Callback callback) {
            this.mCallback = callback;
            this.mActivity = activity;
        }

        @Override // java.lang.reflect.InvocationHandler
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            if (method.getName().equals("onWindowFocusChanged") && args.length == 1 && (args[0] instanceof Boolean)) {
                onWindowFocusChanged(((Boolean) args[0]).booleanValue());
                return null;
            }
            try {
                return method.invoke(this.mCallback, args);
            } catch (InvocationTargetException e) {
                if (e.getCause() instanceof AbstractMethodError) {
                    throw e.getCause();
                }
                throw e;
            }
        }

        public void onWindowFocusChanged(boolean hasFocus) {
            this.mCallback.onWindowFocusChanged(hasFocus);
            if (ApplicationStatus.sWindowFocusListeners != null) {
                Iterator it = ApplicationStatus.sWindowFocusListeners.iterator();
                while (it.hasNext()) {
                    WindowFocusChangedListener listener = (WindowFocusChangedListener) it.next();
                    listener.onWindowFocusChanged(this.mActivity, hasFocus);
                }
            }
        }
    }

    public static boolean isInitialized() {
        boolean z;
        synchronized (sActivityInfo) {
            z = sCurrentApplicationState != 0;
        }
        return z;
    }

    public static void initialize(Application application) {
        if (isInitialized()) {
            throw new AssertionError();
        }
        synchronized (sActivityInfo) {
            sCurrentApplicationState = 4;
        }
        registerWindowFocusChangedListener(new WindowFocusChangedListener() { // da classe: org.chromium.base.ApplicationStatus.1
            @Override // org.chromium.base.ApplicationStatus.WindowFocusChangedListener
            public void onWindowFocusChanged(Activity activity, boolean hasFocus) {
                int state;
                if (hasFocus && activity != ApplicationStatus.sActivity && (state = ApplicationStatus.getStateForActivity(activity)) != 6 && state != 5) {
                    ApplicationStatus.sActivity = activity;
                }
            }
        });
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() { // da classe: org.chromium.base.ApplicationStatus.2
            static final /* sintético */ boolean $assertionsDisabled = false;

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                ApplicationStatus.onStateChange(activity, 1);
                Window.Callback callback = activity.getWindow().getCallback();
                activity.getWindow().setCallback(ApplicationStatus.createWindowCallbackProxy(activity, callback));
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityDestroyed(Activity activity) {
                ApplicationStatus.onStateChange(activity, 6);
                checkCallback(activity);
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityPaused(Activity activity) {
                ApplicationStatus.onStateChange(activity, 4);
                checkCallback(activity);
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityResumed(Activity activity) {
                ApplicationStatus.onStateChange(activity, 3);
                checkCallback(activity);
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                checkCallback(activity);
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityStarted(Activity activity) {
                ApplicationStatus.onStateChange(activity, 2);
                checkCallback(activity);
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityStopped(Activity activity) {
                ApplicationStatus.onStateChange(activity, 5);
                checkCallback(activity);
            }

            private void checkCallback(Activity activity) {
                if (BuildConfig.ENABLE_ASSERTS && !ApplicationStatus.reachesWindowCallback(activity.getWindow().getCallback())) {
                    throw new AssertionError();
                }
            }
        });
    }

    static Window.Callback createWindowCallbackProxy(Activity activity, Window.Callback callback) {
        return (Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(), new Class[]{Window.Callback.class}, new WindowCallbackProxy(activity, callback));
    }

    static boolean reachesWindowCallback(Window.Callback callback) {
        if (callback == null) {
            return false;
        }
        if (callback.getClass().getName().equals(TOOLBAR_CALLBACK_WRAPPER_CLASS)) {
            return true;
        }
        if (Proxy.isProxyClass(callback.getClass())) {
            return Proxy.getInvocationHandler(callback) instanceof WindowCallbackProxy;
        }
        for (Class<?> c = callback.getClass(); c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (f.getType().isAssignableFrom(Window.Callback.class)) {
                    boolean isAccessible = f.isAccessible();
                    f.setAccessible(true);
                    try {
                        Window.Callback fieldCb = (Window.Callback) f.get(callback);
                        f.setAccessible(isAccessible);
                        if (reachesWindowCallback(fieldCb)) {
                            return true;
                        }
                    } catch (IllegalAccessException e) {
                        f.setAccessible(isAccessible);
                    } catch (Throwable th) {
                        f.setAccessible(isAccessible);
                        throw th;
                    }
                }
            }
        }
        return false;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static void onStateChange(Activity activity, int newState) {
        ActivityInfo info;
        if (activity == null) {
            throw new IllegalArgumentException("null activity is not supported");
        }
        if (sActivity == null || newState == 1 || newState == 3 || newState == 2) {
            sActivity = activity;
        }
        int oldApplicationState = getStateForApplication();
        boolean oldTaskVisibility = isTaskVisible(getTaskId(activity));
        synchronized (sActivityInfo) {
            if (newState == 1) {
                if (sActivityInfo.containsKey(activity)) {
                    throw new AssertionError();
                }
                sActivityInfo.put(activity, new ActivityInfo());
            }
            info = sActivityInfo.get(activity);
            info.setStatus(newState);
            if (newState == 6) {
                sActivityInfo.remove(activity);
                if (activity == sActivity) {
                    sActivity = null;
                }
            }
            sCurrentApplicationState = determineApplicationStateLocked();
        }
        Iterator<ActivityStateListener> it = info.getListeners().iterator();
        while (it.hasNext()) {
            ActivityStateListener listener = it.next();
            listener.onActivityStateChange(activity, newState);
        }
        if (sGeneralActivityStateListeners != null) {
            Iterator<ActivityStateListener> it2 = sGeneralActivityStateListeners.iterator();
            while (it2.hasNext()) {
                ActivityStateListener listener2 = it2.next();
                listener2.onActivityStateChange(activity, newState);
            }
        }
        boolean taskVisibility = isTaskVisible(getTaskId(activity));
        if (taskVisibility != oldTaskVisibility && sTaskVisibilityListeners != null) {
            Iterator<TaskVisibilityListener> it3 = sTaskVisibilityListeners.iterator();
            while (it3.hasNext()) {
                TaskVisibilityListener listener3 = it3.next();
                listener3.onTaskVisibilityChanged(getTaskId(activity), taskVisibility);
            }
        }
        int applicationState = getStateForApplication();
        if (applicationState != oldApplicationState && sApplicationStateListeners != null) {
            Iterator<ApplicationStateListener> it4 = sApplicationStateListeners.iterator();
            while (it4.hasNext()) {
                ApplicationStateListener listener4 = it4.next();
                listener4.onApplicationStateChange(applicationState);
            }
        }
        synchronized (sActivityTaskId) {
            if (newState == 6) {
                sActivityTaskId.remove(activity);
            }
        }
    }

    public static void onStateChangeForTesting(Activity activity, int newState) {
        onStateChange(activity, newState);
    }

    public static Activity getLastTrackedFocusedActivity() {
        return sActivity;
    }

    public static List<Activity> getRunningActivities() {
        ArrayList arrayList;
        if (!isInitialized()) {
            throw new AssertionError();
        }
        synchronized (sActivityInfo) {
            arrayList = new ArrayList(sActivityInfo.keySet());
        }
        return arrayList;
    }

    public static int getStateForActivity(Activity activity) {
        ActivityInfo info;
        if (!isInitialized()) {
            throw new AssertionError();
        }
        if (activity == null || (info = sActivityInfo.get(activity)) == null) {
            return 6;
        }
        return info.getStatus();
    }

    public static int getStateForApplication() {
        int i;
        synchronized (sActivityInfo) {
            i = sCurrentApplicationState;
        }
        return i;
    }

    public static boolean hasVisibleActivities() {
        if (!isInitialized()) {
            throw new AssertionError();
        }
        int state = getStateForApplication();
        return state == 1 || state == 2;
    }

    public static boolean isEveryActivityDestroyed() {
        if (!isInitialized()) {
            throw new AssertionError();
        }
        return sActivityInfo.isEmpty();
    }

    public static boolean isTaskVisible(int taskId) {
        int state;
        if (!isInitialized()) {
            throw new AssertionError();
        }
        for (Map.Entry<Activity, ActivityInfo> entry : sActivityInfo.entrySet()) {
            if (getTaskId(entry.getKey()) == taskId && ((state = entry.getValue().getStatus()) == 3 || state == 4)) {
                return true;
            }
        }
        return false;
    }

    public static void registerStateListenerForAllActivities(ActivityStateListener listener) {
        if (!isInitialized()) {
            throw new AssertionError();
        }
        if (sGeneralActivityStateListeners == null) {
            sGeneralActivityStateListeners = new ObserverList<>();
        }
        sGeneralActivityStateListeners.addObserver(listener);
    }

    public static void registerStateListenerForActivity(ActivityStateListener listener, Activity activity) {
        if (!isInitialized()) {
            throw new AssertionError();
        }
        if (activity == null) {
            throw new AssertionError();
        }
        ActivityInfo info = sActivityInfo.get(activity);
        if (info.getStatus() == 6) {
            throw new AssertionError();
        }
        info.getListeners().addObserver(listener);
    }

    public static void unregisterActivityStateListener(ActivityStateListener listener) {
        if (sGeneralActivityStateListeners != null) {
            sGeneralActivityStateListeners.removeObserver(listener);
        }
        synchronized (sActivityInfo) {
            for (ActivityInfo info : sActivityInfo.values()) {
                info.getListeners().removeObserver(listener);
            }
        }
    }

    public static void registerApplicationStateListener(ApplicationStateListener listener) {
        if (sApplicationStateListeners == null) {
            sApplicationStateListeners = new ObserverList<>();
        }
        sApplicationStateListeners.addObserver(listener);
    }

    public static void unregisterApplicationStateListener(ApplicationStateListener listener) {
        if (sApplicationStateListeners == null) {
            return;
        }
        sApplicationStateListeners.removeObserver(listener);
    }

    public static void destroyForJUnitTests() {
        synchronized (sActivityInfo) {
            if (sApplicationStateListeners != null) {
                sApplicationStateListeners.clear();
            }
            if (sGeneralActivityStateListeners != null) {
                sGeneralActivityStateListeners.clear();
            }
            if (sTaskVisibilityListeners != null) {
                sTaskVisibilityListeners.clear();
            }
            sActivityInfo.clear();
            if (sWindowFocusListeners != null) {
                sWindowFocusListeners.clear();
            }
            sCurrentApplicationState = 0;
            sActivity = null;
            sNativeApplicationStateListener = null;
        }
    }

    public static void resetActivitiesForInstrumentationTests() {
        if (!ThreadUtils.runningOnUiThread()) {
            throw new AssertionError();
        }
        synchronized (sActivityInfo) {
            Iterator it = new HashSet(sActivityInfo.keySet()).iterator();
            while (it.hasNext()) {
                Activity activity = (Activity) it.next();
                if (activity.getApplication() != null) {
                    throw new AssertionError("Real activities that are launched should be closed by test code and not rely on this cleanup of mocks.");
                }
                onStateChangeForTesting(activity, 6);
            }
        }
    }

    private static void registerThreadSafeNativeApplicationStateListener() {
        ThreadUtils.runOnUiThread(new Runnable() { // da classe: org.chromium.base.ApplicationStatus.3
            @Override // java.lang.Runnable
            public void run() {
                if (ApplicationStatus.sNativeApplicationStateListener != null) {
                    return;
                }
                ApplicationStatus.sNativeApplicationStateListener = new ApplicationStateListener() { // da classe: org.chromium.base.ApplicationStatus.3.1
                    @Override // org.chromium.base.ApplicationStatus.ApplicationStateListener
                    public void onApplicationStateChange(int newState) {
                        ApplicationStatusJni.get().onApplicationStateChange(newState);
                    }
                };
                ApplicationStatus.registerApplicationStateListener(ApplicationStatus.sNativeApplicationStateListener);
            }
        });
    }

    private static int determineApplicationStateLocked() {
        boolean hasPausedActivity = false;
        boolean hasStoppedActivity = false;
        for (ActivityInfo info : sActivityInfo.values()) {
            int state = info.getStatus();
            if (state != 4 && state != 5 && state != 6) {
                return 1;
            }
            if (state == 4) {
                hasPausedActivity = true;
            } else if (state == 5) {
                hasStoppedActivity = true;
            }
        }
        if (hasPausedActivity) {
            return 2;
        }
        return hasStoppedActivity ? 3 : 4;
    }
}
