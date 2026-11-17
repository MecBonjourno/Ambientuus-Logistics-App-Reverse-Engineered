package org.chromium.net;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.ProxyInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import java.util.Locale;
import org.chromium.base.ContextUtils;
import org.chromium.base.Log;
import org.chromium.base.ResettersForTesting;
import org.chromium.base.TraceEvent;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.annotations.NativeClassQualifiedName;
import org.chromium.build.BuildConfig;
import org.chromium.net.ProxyChangeListener;

@JNINamespace("net")
/* loaded from: classes17.dex */
public class ProxyChangeListener {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String TAG = "ProxyChangeListener";
    private static boolean sEnabled = true;
    private Delegate mDelegate;
    private long mNativePtr;
    private ProxyReceiver mProxyReceiver;
    private BroadcastReceiver mRealProxyReceiver;
    private final Looper mLooper = Looper.myLooper();
    private final Handler mHandler = new Handler(this.mLooper);

    public interface Delegate {
        void proxySettingsChanged();
    }

    interface Natives {
        @NativeClassQualifiedName("ProxyConfigServiceAndroid::JNIDelegate")
        void proxySettingsChanged(long j, ProxyChangeListener proxyChangeListener);

        @NativeClassQualifiedName("ProxyConfigServiceAndroid::JNIDelegate")
        void proxySettingsChangedTo(long j, ProxyChangeListener proxyChangeListener, String str, int i, String str2, String[] strArr);
    }

    private static class ProxyConfig {
        public static final ProxyConfig DIRECT = new ProxyConfig("", 0, "", new String[0]);
        public final String[] mExclusionList;
        public final String mHost;
        public final String mPacUrl;
        public final int mPort;

        public ProxyConfig(String host, int port, String pacUrl, String[] exclusionList) {
            this.mHost = host;
            this.mPort = port;
            this.mPacUrl = pacUrl;
            this.mExclusionList = exclusionList;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static ProxyConfig fromProxyInfo(ProxyInfo proxyInfo) {
            if (proxyInfo == null) {
                return null;
            }
            String host = proxyInfo.getHost();
            Uri pacFileUrl = proxyInfo.getPacFileUrl();
            return new ProxyConfig(host == null ? "" : host, proxyInfo.getPort(), Uri.EMPTY.equals(pacFileUrl) ? null : pacFileUrl.toString(), proxyInfo.getExclusionList());
        }

        public String toString() {
            String possiblyRedactedHost = (this.mHost.equals("localhost") || this.mHost.isEmpty()) ? this.mHost : "<redacted>";
            return String.format(Locale.US, "ProxyConfig [mHost=\"%s\", mPort=%d, mPacUrl=%s]", possiblyRedactedHost, Integer.valueOf(this.mPort), this.mPacUrl == null ? "null" : "\"<redacted>\"");
        }
    }

    private ProxyChangeListener() {
    }

    public static void setEnabled(boolean enabled) {
        sEnabled = enabled;
    }

    public void setDelegateForTesting(Delegate delegate) {
        final Delegate oldValue = this.mDelegate;
        this.mDelegate = delegate;
        ResettersForTesting.register(new Runnable() { // from class: org.chromium.net.ProxyChangeListener$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ProxyChangeListener.this.m2570xee52497b(oldValue);
            }
        });
    }

    /* renamed from: lambda$setDelegateForTesting$0$org-chromium-net-ProxyChangeListener, reason: not valid java name */
    /* synthetic */ void m2570xee52497b(Delegate oldValue) {
        this.mDelegate = oldValue;
    }

    public static ProxyChangeListener create() {
        return new ProxyChangeListener();
    }

    public static String getProperty(String property) {
        return System.getProperty(property);
    }

    public void start(long nativePtr) {
        TraceEvent e = TraceEvent.scoped("ProxyChangeListener.start");
        try {
            assertOnThread();
            if (this.mNativePtr != 0) {
                throw new AssertionError();
            }
            this.mNativePtr = nativePtr;
            registerBroadcastReceiver();
            if (e != null) {
                e.close();
            }
        } catch (Throwable th) {
            if (e != null) {
                try {
                    e.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public void stop() {
        assertOnThread();
        this.mNativePtr = 0L;
        unregisterBroadcastReceiver();
    }

    /* JADX INFO: Access modifiers changed from: private */
    class ProxyReceiver extends BroadcastReceiver {
        private ProxyReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, final Intent intent) {
            if (intent.getAction().equals("android.intent.action.PROXY_CHANGE")) {
                ProxyChangeListener.this.runOnThread(new Runnable() { // from class: org.chromium.net.ProxyChangeListener$ProxyReceiver$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProxyChangeListener.ProxyReceiver.this.m2573xb032109e(intent);
                    }
                });
            }
        }

        /* renamed from: lambda$onReceive$0$org-chromium-net-ProxyChangeListener$ProxyReceiver, reason: not valid java name */
        /* synthetic */ void m2573xb032109e(Intent intent) {
            ProxyChangeListener.this.proxySettingsChanged(ProxyChangeListener.extractNewProxy(intent));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static ProxyConfig extractNewProxy(Intent intent) {
        Bundle extras = intent.getExtras();
        if (extras == null) {
            return null;
        }
        return ProxyConfig.fromProxyInfo((ProxyInfo) extras.get("android.intent.extra.PROXY_INFO"));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void proxySettingsChanged(ProxyConfig cfg) {
        assertOnThread();
        if (!sEnabled) {
            return;
        }
        if (this.mDelegate != null) {
            this.mDelegate.proxySettingsChanged();
        }
        if (this.mNativePtr == 0) {
            return;
        }
        if (cfg != null) {
            ProxyChangeListenerJni.get().proxySettingsChangedTo(this.mNativePtr, this, cfg.mHost, cfg.mPort, cfg.mPacUrl, cfg.mExclusionList);
        } else {
            ProxyChangeListenerJni.get().proxySettingsChanged(this.mNativePtr, this);
        }
    }

    private ProxyConfig getProxyConfig(Intent intent) {
        ConnectivityManager connectivityManager = (ConnectivityManager) ContextUtils.getApplicationContext().getSystemService("connectivity");
        ProxyConfig configFromConnectivityManager = ProxyConfig.fromProxyInfo(connectivityManager.getDefaultProxy());
        if (configFromConnectivityManager == null) {
            return ProxyConfig.DIRECT;
        }
        if (Build.VERSION.SDK_INT >= 29 && configFromConnectivityManager.mHost.equals("localhost") && configFromConnectivityManager.mPort == -1) {
            ProxyConfig configFromIntent = extractNewProxy(intent);
            Log.i(TAG, "configFromConnectivityManager = %s, configFromIntent = %s", configFromConnectivityManager, configFromIntent);
            if (configFromIntent == null) {
                return null;
            }
            String correctHost = configFromIntent.mHost;
            int correctPort = configFromIntent.mPort;
            return new ProxyConfig(correctHost, correctPort, configFromConnectivityManager.mPacUrl, configFromConnectivityManager.mExclusionList);
        }
        return configFromConnectivityManager;
    }

    /* renamed from: lambda$updateProxyConfigFromConnectivityManager$1$org-chromium-net-ProxyChangeListener, reason: not valid java name */
    /* synthetic */ void m2571xf76e18e9(Intent intent) {
        proxySettingsChanged(getProxyConfig(intent));
    }

    void updateProxyConfigFromConnectivityManager(final Intent intent) {
        runOnThread(new Runnable() { // from class: org.chromium.net.ProxyChangeListener$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                ProxyChangeListener.this.m2571xf76e18e9(intent);
            }
        });
    }

    private void registerBroadcastReceiver() {
        assertOnThread();
        if (this.mProxyReceiver != null) {
            throw new AssertionError();
        }
        if (this.mRealProxyReceiver != null) {
            throw new AssertionError();
        }
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.PROXY_CHANGE");
        this.mProxyReceiver = new ProxyReceiver();
        if (!ContextUtils.isSdkSandboxProcess()) {
            ContextUtils.registerNonExportedBroadcastReceiver(ContextUtils.getApplicationContext(), this.mProxyReceiver, new IntentFilter());
        }
        this.mRealProxyReceiver = new ProxyBroadcastReceiver(this);
        ContextUtils.registerProtectedBroadcastReceiver(ContextUtils.getApplicationContext(), this.mRealProxyReceiver, filter);
    }

    private void unregisterBroadcastReceiver() {
        assertOnThread();
        if (this.mProxyReceiver == null) {
            throw new AssertionError();
        }
        ContextUtils.getApplicationContext().unregisterReceiver(this.mProxyReceiver);
        if (this.mRealProxyReceiver != null) {
            ContextUtils.getApplicationContext().unregisterReceiver(this.mRealProxyReceiver);
        }
        this.mProxyReceiver = null;
        this.mRealProxyReceiver = null;
    }

    private boolean onThread() {
        return this.mLooper == Looper.myLooper();
    }

    private void assertOnThread() {
        if (BuildConfig.ENABLE_ASSERTS && !onThread()) {
            throw new IllegalStateException("Must be called on ProxyChangeListener thread.");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void runOnThread(Runnable r) {
        if (onThread()) {
            r.run();
        } else {
            this.mHandler.post(r);
        }
    }
}
