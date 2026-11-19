package org.chromium.net.impl;

import android.content.Context;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Process;
import org.chromium.base.ContextUtils;
import org.chromium.base.Log;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.net.NetworkChangeNotifier;
import org.chromium.net.httpflags.BaseFeature;
import org.chromium.net.httpflags.Flags;
import org.chromium.net.httpflags.HttpFlagsLoader;
import org.chromium.net.httpflags.ResolvedFlags;

@JNINamespace("cronet")
/* carregado de: classes17.dex */
public class CronetLibraryLoader {
    static final /* sintético */ boolean $assertionsDisabled = false;
    public static final String LOG_FLAG_NAME = "Cronet_log_me";
    private static ResolvedFlags sHttpFlags;
    private static volatile boolean sInitThreadInitDone;
    private static volatile boolean sLibraryLoaded;
    private static final Object sLoadLock = new Object();
    private static final String LIBRARY_NAME = "cronet." + ImplVersion.getCronetVersion();
    public static final String TAG = CronetLibraryLoader.class.getSimpleName();
    private static final HandlerThread sInitThread = new HandlerThread("CronetInit");
    private static final ConditionVariable sWaitForLibLoad = new ConditionVariable();
    private static final ConditionVariable sHttpFlagsLoaded = new ConditionVariable();

    interface Natives {
        void cronetInitOnInitThread();

        String getCronetVersion();

        void setMinLogLevel(int i);
    }

    public static void ensureInitialized(Context applicationContext, CronetEngineBuilderImpl builder) {
        synchronized (sLoadLock) {
            if (!sInitThreadInitDone) {
                ContextUtils.initApplicationContext(applicationContext);
                if (!sInitThread.isAlive()) {
                    sInitThread.start();
                }
                postToInitThread(new Runnable() { // da classe: org.chromium.net.impl.CronetLibraryLoader.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CronetLibraryLoader.ensureInitializedOnInitThread();
                    }
                });
            }
            if (!sLibraryLoaded) {
                if (builder.libraryLoader() != null) {
                    builder.libraryLoader().loadLibrary(LIBRARY_NAME);
                } else {
                    System.loadLibrary(LIBRARY_NAME);
                }
                String implVersion = ImplVersion.getCronetVersion();
                if (!implVersion.equals(CronetLibraryLoaderJni.get().getCronetVersion())) {
                    throw new RuntimeException(String.format("Expected Cronet version number %s, actual version number %s.", implVersion, CronetLibraryLoaderJni.get().getCronetVersion()));
                }
                Log.i(TAG, "Cronet version: %s, arch: %s", implVersion, System.getProperty("os.arch"));
                setNativeLoggingLevel();
                sLibraryLoaded = true;
                sWaitForLibLoad.open();
            }
        }
    }

    private static void setNativeLoggingLevel() {
        int loggingLevel;
        if (Log.isLoggable("chromium", 2)) {
            loggingLevel = -2;
        } else if (Log.isLoggable("chromium", 3)) {
            loggingLevel = -1;
        } else {
            return;
        }
        CronetLibraryLoaderJni.get().setMinLogLevel(loggingLevel);
    }

    private static boolean onInitThread() {
        return sInitThread.getLooper() == Looper.myLooper();
    }

    static void ensureInitializedOnInitThread() {
        if (!onInitThread()) {
            throw new AssertionError();
        }
        if (sInitThreadInitDone) {
            return;
        }
        if (sHttpFlags != null) {
            throw new AssertionError();
        }
        Context applicationContext = ContextUtils.getApplicationContext();
        Flags flags = HttpFlagsLoader.load(applicationContext);
        sHttpFlags = ResolvedFlags.resolve(flags != null ? flags : Flags.newBuilder().build(), applicationContext.getPackageName(), ImplVersion.getCronetVersion());
        sHttpFlagsLoaded.open();
        ResolvedFlags.Value logMe = sHttpFlags.flags().get(LOG_FLAG_NAME);
        if (logMe != null) {
            Log.i(TAG, "HTTP flags log line: %s", logMe.getStringValue());
        }
        NetworkChangeNotifier.init();
        NetworkChangeNotifier.registerToReceiveNotificationsAlways();
        sWaitForLibLoad.block();
        if (!sLibraryLoaded) {
            throw new AssertionError();
        }
        CronetLibraryLoaderJni.get().cronetInitOnInitThread();
        sInitThreadInitDone = true;
    }

    public static void postToInitThread(Runnable r) {
        if (onInitThread()) {
            r.run();
        } else {
            new Handler(sInitThread.getLooper()).post(r);
        }
    }

    private static byte[] getBaseFeatureOverrides() {
        sHttpFlagsLoaded.block();
        return BaseFeature.getOverrides(sHttpFlags).toByteArray();
    }

    private static String getDefaultUserAgent() {
        return UserAgent.from(ContextUtils.getApplicationContext());
    }

    private static void ensureInitializedFromNative() {
        synchronized (sLoadLock) {
            sLibraryLoaded = true;
            sWaitForLibLoad.open();
        }
        Context applicationContext = ContextUtils.getApplicationContext();
        if (applicationContext == null) {
            throw new AssertionError();
        }
        ensureInitialized(applicationContext, null);
    }

    private static void setNetworkThreadPriorityOnNetworkThread(int priority) {
        Process.setThreadPriority(priority);
    }
}
