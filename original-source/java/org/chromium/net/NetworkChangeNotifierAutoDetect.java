package org.chromium.net;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.net.NetworkRequest;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import java.io.IOException;
import java.net.Socket;
import java.util.Arrays;
import org.chromium.base.ApplicationStatus;
import org.chromium.base.ContextUtils;
import org.chromium.base.ResettersForTesting;
import org.chromium.base.StrictModeContext;
import org.chromium.base.TraceEvent;
import org.chromium.base.compat.ApiHelperForM;
import org.chromium.base.compat.ApiHelperForO;
import org.chromium.base.compat.ApiHelperForP;
import org.chromium.build.BuildConfig;

/* loaded from: classes17.dex */
public class NetworkChangeNotifierAutoDetect extends BroadcastReceiver {
    private static final String TAG = NetworkChangeNotifierAutoDetect.class.getSimpleName();
    private static final int UNKNOWN_LINK_SPEED = -1;
    private ConnectivityManager.NetworkCallback mDefaultNetworkCallback;
    private boolean mIgnoreNextBroadcast;
    private final NetworkConnectivityIntentFilter mIntentFilter;
    private NetworkState mNetworkState;
    private final Observer mObserver;
    private boolean mRegisterNetworkCallbackFailed;
    private boolean mRegistered;
    private final RegistrationPolicy mRegistrationPolicy;
    private boolean mShouldSignalObserver;
    private WifiManagerDelegate mWifiManagerDelegate;
    private final Looper mLooper = Looper.myLooper();
    private final Handler mHandler = new Handler(this.mLooper);
    private ConnectivityManagerDelegate mConnectivityManagerDelegate = new ConnectivityManagerDelegate(ContextUtils.getApplicationContext());
    private MyNetworkCallback mNetworkCallback = new MyNetworkCallback();
    private NetworkRequest mNetworkRequest = new NetworkRequest.Builder().addCapability(12).removeCapability(15).build();

    public interface Observer {
        void onConnectionCostChanged(int i);

        void onConnectionSubtypeChanged(int i);

        void onConnectionTypeChanged(int i);

        void onNetworkConnect(long j, int i);

        void onNetworkDisconnect(long j);

        void onNetworkSoonToDisconnect(long j);

        void purgeActiveNetworkList(long[] jArr);
    }

    public static class NetworkState {
        private final boolean mConnected;
        private final boolean mIsMetered;
        private final boolean mIsPrivateDnsActive;
        private final String mNetworkIdentifier;
        private final String mPrivateDnsServerName;
        private final int mSubtype;
        private final int mType;

        public NetworkState(boolean connected, int type, int subtype, boolean isMetered, String networkIdentifier, boolean isPrivateDnsActive, String privateDnsServerName) {
            this.mConnected = connected;
            this.mType = type;
            this.mSubtype = subtype;
            this.mIsMetered = isMetered;
            this.mNetworkIdentifier = networkIdentifier == null ? "" : networkIdentifier;
            this.mIsPrivateDnsActive = isPrivateDnsActive;
            this.mPrivateDnsServerName = privateDnsServerName != null ? privateDnsServerName : "";
        }

        public boolean isConnected() {
            return this.mConnected;
        }

        public int getNetworkType() {
            return this.mType;
        }

        public boolean isMetered() {
            return this.mIsMetered;
        }

        public int getNetworkSubType() {
            return this.mSubtype;
        }

        public String getNetworkIdentifier() {
            return this.mNetworkIdentifier;
        }

        public int getConnectionType() {
            if (!isConnected()) {
                return 6;
            }
            return NetworkChangeNotifierAutoDetect.convertToConnectionType(getNetworkType(), getNetworkSubType());
        }

        public int getConnectionCost() {
            if (isMetered()) {
                return 2;
            }
            return 1;
        }

        public int getConnectionSubtype() {
            if (!isConnected()) {
                return 1;
            }
            switch (getNetworkType()) {
                case 0:
                case 4:
                case 5:
                    switch (getNetworkSubType()) {
                    }
            }
            return 0;
        }

        public boolean isPrivateDnsActive() {
            return this.mIsPrivateDnsActive;
        }

        public String getPrivateDnsServerName() {
            return this.mPrivateDnsServerName;
        }
    }

    static class ConnectivityManagerDelegate {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private final ConnectivityManager mConnectivityManager;

        ConnectivityManagerDelegate(Context context) {
            this.mConnectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        }

        ConnectivityManagerDelegate() {
            this.mConnectivityManager = null;
        }

        private NetworkInfo processActiveNetworkInfo(NetworkInfo networkInfo) {
            if (networkInfo == null) {
                return null;
            }
            if (networkInfo.isConnected()) {
                return networkInfo;
            }
            if (networkInfo.getDetailedState() != NetworkInfo.DetailedState.BLOCKED || ApplicationStatus.getStateForApplication() != 1) {
                return null;
            }
            return networkInfo;
        }

        NetworkState getNetworkState(WifiManagerDelegate wifiManagerDelegate) {
            Network network = getDefaultNetwork();
            NetworkInfo networkInfo = processActiveNetworkInfo(getNetworkInfo(network));
            if (networkInfo == null) {
                return new NetworkState(false, -1, -1, false, null, false, "");
            }
            if (network != null) {
                NetworkCapabilities capabilities = getNetworkCapabilities(network);
                boolean isMetered = (capabilities == null || capabilities.hasCapability(11)) ? false : true;
                DnsStatus dnsStatus = AndroidNetworkLibrary.getDnsStatus(network);
                if (dnsStatus == null) {
                    return new NetworkState(true, networkInfo.getType(), networkInfo.getSubtype(), isMetered, String.valueOf(NetworkChangeNotifierAutoDetect.networkToNetId(network)), false, "");
                }
                return new NetworkState(true, networkInfo.getType(), networkInfo.getSubtype(), isMetered, String.valueOf(NetworkChangeNotifierAutoDetect.networkToNetId(network)), dnsStatus.getPrivateDnsActive(), dnsStatus.getPrivateDnsServerName());
            }
            throw new AssertionError();
        }

        NetworkInfo getRawNetworkInfo(Network network) {
            try {
                return this.mConnectivityManager.getNetworkInfo(network);
            } catch (NullPointerException e) {
                try {
                    return this.mConnectivityManager.getNetworkInfo(network);
                } catch (NullPointerException e2) {
                    return null;
                }
            }
        }

        NetworkInfo getNetworkInfo(Network network) {
            NetworkInfo networkInfo = getRawNetworkInfo(network);
            if (networkInfo != null && networkInfo.getType() == 17) {
                return this.mConnectivityManager.getActiveNetworkInfo();
            }
            return networkInfo;
        }

        int getConnectionType(Network network) {
            NetworkInfo networkInfo = getNetworkInfo(network);
            if (networkInfo != null && networkInfo.isConnected()) {
                return NetworkChangeNotifierAutoDetect.convertToConnectionType(networkInfo.getType(), networkInfo.getSubtype());
            }
            return 6;
        }

        protected Network[] getAllNetworksUnfiltered() {
            Network[] networks = this.mConnectivityManager.getAllNetworks();
            return networks == null ? new Network[0] : networks;
        }

        protected boolean vpnAccessible(Network network) {
            Socket s = new Socket();
            try {
                StrictModeContext ignored = StrictModeContext.allowAllVmPolicies();
                try {
                    network.bindSocket(s);
                    if (ignored != null) {
                        ignored.close();
                    }
                    try {
                        s.close();
                        return true;
                    } catch (IOException e) {
                        return true;
                    }
                } finally {
                }
            } catch (IOException e2) {
                try {
                    s.close();
                    return false;
                } catch (IOException e3) {
                    return false;
                }
            } catch (Throwable th) {
                try {
                    s.close();
                } catch (IOException e4) {
                }
                throw th;
            }
        }

        protected NetworkCapabilities getNetworkCapabilities(Network network) {
            for (int i = 0; i < 2; i++) {
                try {
                    return this.mConnectivityManager.getNetworkCapabilities(network);
                } catch (SecurityException e) {
                }
            }
            return null;
        }

        void registerNetworkCallback(NetworkRequest networkRequest, ConnectivityManager.NetworkCallback networkCallback, Handler handler) {
            if (Build.VERSION.SDK_INT >= 26) {
                StrictModeContext ignored = StrictModeContext.allowDiskReads();
                try {
                    this.mConnectivityManager.registerNetworkCallback(networkRequest, networkCallback, handler);
                    if (ignored != null) {
                        ignored.close();
                        return;
                    }
                    return;
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
            this.mConnectivityManager.registerNetworkCallback(networkRequest, networkCallback);
        }

        void registerDefaultNetworkCallback(ConnectivityManager.NetworkCallback networkCallback, Handler handler) {
            ApiHelperForO.registerDefaultNetworkCallback(this.mConnectivityManager, networkCallback, handler);
        }

        void unregisterNetworkCallback(ConnectivityManager.NetworkCallback networkCallback) {
            this.mConnectivityManager.unregisterNetworkCallback(networkCallback);
        }

        Network getDefaultNetwork() {
            Network defaultNetwork = ApiHelperForM.getActiveNetwork(this.mConnectivityManager);
            if (defaultNetwork != null) {
                return defaultNetwork;
            }
            NetworkInfo defaultNetworkInfo = this.mConnectivityManager.getActiveNetworkInfo();
            if (defaultNetworkInfo == null) {
                return null;
            }
            Network[] networks = NetworkChangeNotifierAutoDetect.getAllNetworksFiltered(this, null);
            for (Network network : networks) {
                NetworkInfo networkInfo = getRawNetworkInfo(network);
                if (networkInfo != null && (networkInfo.getType() == defaultNetworkInfo.getType() || networkInfo.getType() == 17)) {
                    if (defaultNetwork != null && Build.VERSION.SDK_INT >= 29) {
                        if (networkInfo.getDetailedState() != NetworkInfo.DetailedState.CONNECTING) {
                            NetworkInfo prevDefaultNetworkInfo = getRawNetworkInfo(defaultNetwork);
                            if (prevDefaultNetworkInfo != null && prevDefaultNetworkInfo.getDetailedState() == NetworkInfo.DetailedState.CONNECTING) {
                                defaultNetwork = null;
                            }
                        } else {
                            continue;
                        }
                    }
                    if (defaultNetwork != null) {
                        throw new AssertionError();
                    }
                    defaultNetwork = network;
                }
            }
            return defaultNetwork;
        }
    }

    static class WifiManagerDelegate {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private final Context mContext;
        private boolean mHasWifiPermission;
        private boolean mHasWifiPermissionComputed;
        private final Object mLock;
        private WifiManager mWifiManager;

        WifiManagerDelegate(Context context) {
            this.mLock = new Object();
            throw new AssertionError();
        }

        WifiManagerDelegate() {
            this.mLock = new Object();
            this.mContext = null;
        }

        private boolean hasPermissionLocked() {
            WifiManager wifiManager;
            if (this.mHasWifiPermissionComputed) {
                return this.mHasWifiPermission;
            }
            this.mHasWifiPermission = this.mContext.getPackageManager().checkPermission("android.permission.ACCESS_WIFI_STATE", this.mContext.getPackageName()) == 0;
            if (this.mHasWifiPermission) {
                wifiManager = (WifiManager) this.mContext.getSystemService("wifi");
            } else {
                wifiManager = null;
            }
            this.mWifiManager = wifiManager;
            this.mHasWifiPermissionComputed = true;
            return this.mHasWifiPermission;
        }

        String getWifiSsid() {
            synchronized (this.mLock) {
                if (hasPermissionLocked()) {
                    WifiInfo wifiInfo = getWifiInfoLocked();
                    if (wifiInfo != null) {
                        return wifiInfo.getSSID();
                    }
                    return "";
                }
                return AndroidNetworkLibrary.getWifiSSID();
            }
        }

        private WifiInfo getWifiInfoLocked() {
            try {
                return this.mWifiManager.getConnectionInfo();
            } catch (NullPointerException e) {
                try {
                    return this.mWifiManager.getConnectionInfo();
                } catch (NullPointerException e2) {
                    return null;
                }
            }
        }
    }

    private class DefaultNetworkCallback extends ConnectivityManager.NetworkCallback {
        private DefaultNetworkCallback() {
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onAvailable(Network network) {
            if (NetworkChangeNotifierAutoDetect.this.mRegistered) {
                NetworkChangeNotifierAutoDetect.this.connectionTypeChanged();
            }
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onLost(Network network) {
            onAvailable(null);
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onLinkPropertiesChanged(Network network, LinkProperties linkProperties) {
            onAvailable(null);
        }
    }

    private class AndroidRDefaultNetworkCallback extends ConnectivityManager.NetworkCallback {
        LinkProperties mLinkProperties;
        NetworkCapabilities mNetworkCapabilities;

        private AndroidRDefaultNetworkCallback() {
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onAvailable(Network network) {
            this.mLinkProperties = null;
            this.mNetworkCapabilities = null;
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onLost(Network network) {
            this.mLinkProperties = null;
            this.mNetworkCapabilities = null;
            if (NetworkChangeNotifierAutoDetect.this.mRegistered) {
                NetworkChangeNotifierAutoDetect.this.connectionTypeChangedTo(new NetworkState(false, -1, -1, false, null, false, ""));
            }
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onLinkPropertiesChanged(Network network, LinkProperties linkProperties) {
            this.mLinkProperties = linkProperties;
            if (NetworkChangeNotifierAutoDetect.this.mRegistered && this.mLinkProperties != null && this.mNetworkCapabilities != null) {
                NetworkChangeNotifierAutoDetect.this.connectionTypeChangedTo(getNetworkState(network));
            }
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
            this.mNetworkCapabilities = networkCapabilities;
            if (NetworkChangeNotifierAutoDetect.this.mRegistered && this.mLinkProperties != null && this.mNetworkCapabilities != null) {
                NetworkChangeNotifierAutoDetect.this.connectionTypeChangedTo(getNetworkState(network));
            }
        }

        private NetworkState getNetworkState(Network network) {
            int type;
            int subtype;
            int subtype2 = -1;
            if (this.mNetworkCapabilities.hasTransport(1) || this.mNetworkCapabilities.hasTransport(5)) {
                type = 1;
                subtype = -1;
            } else if (this.mNetworkCapabilities.hasTransport(0)) {
                NetworkInfo networkInfo = NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate.getRawNetworkInfo(network);
                if (networkInfo != null) {
                    subtype2 = networkInfo.getSubtype();
                }
                type = 0;
                subtype = subtype2;
            } else if (this.mNetworkCapabilities.hasTransport(3)) {
                type = 9;
                subtype = -1;
            } else if (this.mNetworkCapabilities.hasTransport(2)) {
                type = 7;
                subtype = -1;
            } else if (!this.mNetworkCapabilities.hasTransport(4)) {
                type = -1;
                subtype = -1;
            } else {
                NetworkInfo networkInfo2 = NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate.getNetworkInfo(network);
                int type2 = networkInfo2 != null ? networkInfo2.getType() : 17;
                type = type2;
                subtype = -1;
            }
            boolean isMetered = !this.mNetworkCapabilities.hasCapability(11);
            return new NetworkState(true, type, subtype, isMetered, String.valueOf(NetworkChangeNotifierAutoDetect.networkToNetId(network)), ApiHelperForP.isPrivateDnsActive(this.mLinkProperties), ApiHelperForP.getPrivateDnsServerName(this.mLinkProperties));
        }
    }

    private class MyNetworkCallback extends ConnectivityManager.NetworkCallback {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private Network mVpnInPlace;

        private MyNetworkCallback() {
        }

        void initializeVpnInPlace() {
            NetworkCapabilities capabilities;
            Network[] networks = NetworkChangeNotifierAutoDetect.getAllNetworksFiltered(NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate, null);
            this.mVpnInPlace = null;
            if (networks.length == 1 && (capabilities = NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate.getNetworkCapabilities(networks[0])) != null && capabilities.hasTransport(4)) {
                this.mVpnInPlace = networks[0];
            }
        }

        private boolean ignoreNetworkDueToVpn(Network network) {
            return (this.mVpnInPlace == null || this.mVpnInPlace.equals(network)) ? false : true;
        }

        private boolean ignoreConnectedInaccessibleVpn(Network network, NetworkCapabilities capabilities) {
            if (capabilities == null) {
                capabilities = NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate.getNetworkCapabilities(network);
            }
            return capabilities == null || (capabilities.hasTransport(4) && !NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate.vpnAccessible(network));
        }

        private boolean ignoreConnectedNetwork(Network network, NetworkCapabilities capabilities) {
            return ignoreNetworkDueToVpn(network) || ignoreConnectedInaccessibleVpn(network, capabilities);
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onAvailable(Network network) {
            TraceEvent e = TraceEvent.scoped("NetworkChangeNotifierCallback::onAvailable");
            try {
                NetworkCapabilities capabilities = NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate.getNetworkCapabilities(network);
                if (!ignoreConnectedNetwork(network, capabilities)) {
                    final boolean makeVpnDefault = capabilities.hasTransport(4) && (this.mVpnInPlace == null || !network.equals(this.mVpnInPlace));
                    if (makeVpnDefault) {
                        this.mVpnInPlace = network;
                    }
                    final long netId = NetworkChangeNotifierAutoDetect.networkToNetId(network);
                    final int connectionType = NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate.getConnectionType(network);
                    NetworkChangeNotifierAutoDetect.this.runOnThread(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect.MyNetworkCallback.1
                        @Override // java.lang.Runnable
                        public void run() {
                            NetworkChangeNotifierAutoDetect.this.mObserver.onNetworkConnect(netId, connectionType);
                            if (makeVpnDefault) {
                                NetworkChangeNotifierAutoDetect.this.mObserver.onConnectionTypeChanged(connectionType);
                                NetworkChangeNotifierAutoDetect.this.mObserver.purgeActiveNetworkList(new long[]{netId});
                            }
                        }
                    });
                    if (e != null) {
                        e.close();
                        return;
                    }
                    return;
                }
                if (e != null) {
                    e.close();
                }
            } catch (Throwable th) {
                if (e == null) {
                    throw th;
                }
                try {
                    e.close();
                    throw th;
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                    throw th;
                }
            }
        }

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
            TraceEvent e = TraceEvent.scoped("NetworkChangeNotifierCallback::onCapabilitiesChanged");
            try {
                if (!ignoreConnectedNetwork(network, networkCapabilities)) {
                    final long netId = NetworkChangeNotifierAutoDetect.networkToNetId(network);
                    final int connectionType = NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate.getConnectionType(network);
                    NetworkChangeNotifierAutoDetect.this.runOnThread(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect.MyNetworkCallback.2
                        @Override // java.lang.Runnable
                        public void run() {
                            NetworkChangeNotifierAutoDetect.this.mObserver.onNetworkConnect(netId, connectionType);
                        }
                    });
                    if (e != null) {
                        e.close();
                        return;
                    }
                    return;
                }
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

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onLosing(Network network, int maxMsToLive) {
            TraceEvent e = TraceEvent.scoped("NetworkChangeNotifierCallback::onLosing");
            try {
                if (!ignoreConnectedNetwork(network, null)) {
                    final long netId = NetworkChangeNotifierAutoDetect.networkToNetId(network);
                    NetworkChangeNotifierAutoDetect.this.runOnThread(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect.MyNetworkCallback.3
                        @Override // java.lang.Runnable
                        public void run() {
                            NetworkChangeNotifierAutoDetect.this.mObserver.onNetworkSoonToDisconnect(netId);
                        }
                    });
                    if (e != null) {
                        e.close();
                        return;
                    }
                    return;
                }
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

        @Override // android.net.ConnectivityManager.NetworkCallback
        public void onLost(final Network network) {
            TraceEvent e = TraceEvent.scoped("NetworkChangeNotifierCallback::onLost");
            try {
                if (!ignoreNetworkDueToVpn(network)) {
                    NetworkChangeNotifierAutoDetect.this.runOnThread(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect.MyNetworkCallback.4
                        @Override // java.lang.Runnable
                        public void run() {
                            NetworkChangeNotifierAutoDetect.this.mObserver.onNetworkDisconnect(NetworkChangeNotifierAutoDetect.networkToNetId(network));
                        }
                    });
                    if (this.mVpnInPlace != null) {
                        if (!network.equals(this.mVpnInPlace)) {
                            throw new AssertionError();
                        }
                        this.mVpnInPlace = null;
                        for (Network newNetwork : NetworkChangeNotifierAutoDetect.getAllNetworksFiltered(NetworkChangeNotifierAutoDetect.this.mConnectivityManagerDelegate, network)) {
                            onAvailable(newNetwork);
                        }
                        final int newConnectionType = NetworkChangeNotifierAutoDetect.this.getCurrentNetworkState().getConnectionType();
                        NetworkChangeNotifierAutoDetect.this.runOnThread(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect.MyNetworkCallback.5
                            @Override // java.lang.Runnable
                            public void run() {
                                NetworkChangeNotifierAutoDetect.this.mObserver.onConnectionTypeChanged(newConnectionType);
                            }
                        });
                    }
                    if (e != null) {
                        e.close();
                        return;
                    }
                    return;
                }
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
    }

    public static abstract class RegistrationPolicy {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private NetworkChangeNotifierAutoDetect mNotifier;

        protected abstract void destroy();

        protected final void register() {
            if (this.mNotifier == null) {
                throw new AssertionError();
            }
            this.mNotifier.register();
        }

        protected final void unregister() {
            if (this.mNotifier == null) {
                throw new AssertionError();
            }
            this.mNotifier.unregister();
        }

        protected void init(NetworkChangeNotifierAutoDetect notifier) {
            this.mNotifier = notifier;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public NetworkChangeNotifierAutoDetect(Observer observer, RegistrationPolicy registrationPolicy) {
        this.mObserver = observer;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        if (Build.VERSION.SDK_INT >= 30) {
            this.mDefaultNetworkCallback = new AndroidRDefaultNetworkCallback();
        } else {
            this.mDefaultNetworkCallback = Build.VERSION.SDK_INT >= 28 ? new DefaultNetworkCallback() : null;
        }
        this.mNetworkState = getCurrentNetworkState();
        this.mIntentFilter = new NetworkConnectivityIntentFilter();
        this.mIgnoreNextBroadcast = false;
        this.mShouldSignalObserver = false;
        this.mRegistrationPolicy = registrationPolicy;
        this.mRegistrationPolicy.init(this);
        this.mShouldSignalObserver = true;
    }

    private boolean onThread() {
        return this.mLooper == Looper.myLooper();
    }

    private void assertOnThread() {
        if (BuildConfig.ENABLE_ASSERTS && !onThread()) {
            throw new IllegalStateException("Must be called on NetworkChangeNotifierAutoDetect thread.");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void runOnThread(final Runnable r) {
        if (onThread()) {
            r.run();
        } else {
            this.mHandler.post(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    NetworkChangeNotifierAutoDetect.this.m2563x7a563379(r);
                }
            });
        }
    }

    /* renamed from: lambda$runOnThread$0$org-chromium-net-NetworkChangeNotifierAutoDetect, reason: not valid java name */
    /* synthetic */ void m2563x7a563379(Runnable r) {
        if (this.mRegistered) {
            r.run();
        }
    }

    void setConnectivityManagerDelegateForTests(ConnectivityManagerDelegate delegate) {
        final ConnectivityManagerDelegate oldValue = this.mConnectivityManagerDelegate;
        this.mConnectivityManagerDelegate = delegate;
        ResettersForTesting.register(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                NetworkChangeNotifierAutoDetect.this.m2564x188c6201(oldValue);
            }
        });
    }

    /* renamed from: lambda$setConnectivityManagerDelegateForTests$1$org-chromium-net-NetworkChangeNotifierAutoDetect, reason: not valid java name */
    /* synthetic */ void m2564x188c6201(ConnectivityManagerDelegate oldValue) {
        this.mConnectivityManagerDelegate = oldValue;
    }

    void setWifiManagerDelegateForTests(WifiManagerDelegate delegate) {
        final WifiManagerDelegate oldValue = this.mWifiManagerDelegate;
        this.mWifiManagerDelegate = delegate;
        ResettersForTesting.register(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                NetworkChangeNotifierAutoDetect.this.m2565x3e3cf4fe(oldValue);
            }
        });
    }

    /* renamed from: lambda$setWifiManagerDelegateForTests$2$org-chromium-net-NetworkChangeNotifierAutoDetect, reason: not valid java name */
    /* synthetic */ void m2565x3e3cf4fe(WifiManagerDelegate oldValue) {
        this.mWifiManagerDelegate = oldValue;
    }

    RegistrationPolicy getRegistrationPolicy() {
        return this.mRegistrationPolicy;
    }

    boolean isReceiverRegisteredForTesting() {
        return this.mRegistered;
    }

    public void destroy() {
        assertOnThread();
        this.mRegistrationPolicy.destroy();
        unregister();
    }

    public void register() {
        assertOnThread();
        if (this.mRegistered) {
            connectionTypeChanged();
            return;
        }
        if (this.mShouldSignalObserver) {
            connectionTypeChanged();
        }
        if (this.mDefaultNetworkCallback != null) {
            try {
                this.mConnectivityManagerDelegate.registerDefaultNetworkCallback(this.mDefaultNetworkCallback, this.mHandler);
            } catch (RuntimeException e) {
                this.mDefaultNetworkCallback = null;
            }
        }
        if (this.mDefaultNetworkCallback == null) {
            this.mIgnoreNextBroadcast = ContextUtils.registerProtectedBroadcastReceiver(ContextUtils.getApplicationContext(), this, this.mIntentFilter) != null;
        }
        this.mRegistered = true;
        if (this.mNetworkCallback != null) {
            this.mNetworkCallback.initializeVpnInPlace();
            try {
                this.mConnectivityManagerDelegate.registerNetworkCallback(this.mNetworkRequest, this.mNetworkCallback, this.mHandler);
            } catch (RuntimeException e2) {
                this.mRegisterNetworkCallbackFailed = true;
                this.mNetworkCallback = null;
            }
            if (!this.mRegisterNetworkCallbackFailed && this.mShouldSignalObserver) {
                Network[] networks = getAllNetworksFiltered(this.mConnectivityManagerDelegate, null);
                long[] netIds = new long[networks.length];
                for (int i = 0; i < networks.length; i++) {
                    netIds[i] = networkToNetId(networks[i]);
                }
                this.mObserver.purgeActiveNetworkList(netIds);
            }
        }
    }

    public void unregister() {
        assertOnThread();
        if (this.mRegistered) {
            this.mRegistered = false;
            if (this.mNetworkCallback != null) {
                this.mConnectivityManagerDelegate.unregisterNetworkCallback(this.mNetworkCallback);
            }
            if (this.mDefaultNetworkCallback != null) {
                this.mConnectivityManagerDelegate.unregisterNetworkCallback(this.mDefaultNetworkCallback);
            } else {
                ContextUtils.getApplicationContext().unregisterReceiver(this);
            }
        }
    }

    public NetworkState getCurrentNetworkState() {
        return this.mConnectivityManagerDelegate.getNetworkState(this.mWifiManagerDelegate);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Network[] getAllNetworksFiltered(ConnectivityManagerDelegate connectivityManagerDelegate, Network ignoreNetwork) {
        NetworkCapabilities capabilities;
        Network[] networks = connectivityManagerDelegate.getAllNetworksUnfiltered();
        int filteredIndex = 0;
        for (Network network : networks) {
            if (!network.equals(ignoreNetwork) && (capabilities = connectivityManagerDelegate.getNetworkCapabilities(network)) != null && capabilities.hasCapability(12)) {
                if (capabilities.hasTransport(4)) {
                    if (connectivityManagerDelegate.vpnAccessible(network)) {
                        return new Network[]{network};
                    }
                } else {
                    networks[filteredIndex] = network;
                    filteredIndex++;
                }
            }
        }
        return (Network[]) Arrays.copyOf(networks, filteredIndex);
    }

    public Network[] getNetworksForTesting() {
        return getAllNetworksFiltered(this.mConnectivityManagerDelegate, null);
    }

    public long[] getNetworksAndTypes() {
        Network[] networks = getAllNetworksFiltered(this.mConnectivityManagerDelegate, null);
        long[] networksAndTypes = new long[networks.length * 2];
        int index = 0;
        for (Network network : networks) {
            int index2 = index + 1;
            networksAndTypes[index] = networkToNetId(network);
            index = index2 + 1;
            networksAndTypes[index2] = this.mConnectivityManagerDelegate.getConnectionType(network);
        }
        return networksAndTypes;
    }

    public Network getDefaultNetwork() {
        return this.mConnectivityManagerDelegate.getDefaultNetwork();
    }

    public long getDefaultNetId() {
        Network network = getDefaultNetwork();
        if (network == null) {
            return -1L;
        }
        return networkToNetId(network);
    }

    public boolean registerNetworkCallbackFailed() {
        return this.mRegisterNetworkCallbackFailed;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int convertToConnectionType(int type, int subtype) {
        switch (type) {
            case 0:
            case 4:
            case 5:
                switch (subtype) {
                    case 1:
                    case 2:
                    case 4:
                    case 7:
                    case 11:
                        return 3;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                    case 9:
                    case 10:
                    case 12:
                    case 14:
                    case 15:
                        return 4;
                    case 13:
                        return 5;
                    case 16:
                    case 17:
                    case 18:
                    case 19:
                    default:
                        return 0;
                    case 20:
                        return 8;
                }
            case 1:
                return 2;
            case 2:
            case 3:
            case 8:
            default:
                return 0;
            case 6:
                return 5;
            case 7:
                return 7;
            case 9:
                return 1;
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        runOnThread(new Runnable() { // from class: org.chromium.net.NetworkChangeNotifierAutoDetect.1
            @Override // java.lang.Runnable
            public void run() {
                if (NetworkChangeNotifierAutoDetect.this.mIgnoreNextBroadcast) {
                    NetworkChangeNotifierAutoDetect.this.mIgnoreNextBroadcast = false;
                } else {
                    NetworkChangeNotifierAutoDetect.this.connectionTypeChanged();
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void connectionTypeChanged() {
        connectionTypeChangedTo(getCurrentNetworkState());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void connectionTypeChangedTo(NetworkState networkState) {
        if (networkState.getConnectionType() != this.mNetworkState.getConnectionType() || !networkState.getNetworkIdentifier().equals(this.mNetworkState.getNetworkIdentifier()) || networkState.isPrivateDnsActive() != this.mNetworkState.isPrivateDnsActive() || !networkState.getPrivateDnsServerName().equals(this.mNetworkState.getPrivateDnsServerName())) {
            this.mObserver.onConnectionTypeChanged(networkState.getConnectionType());
        }
        if (networkState.getConnectionType() != this.mNetworkState.getConnectionType() || networkState.getConnectionSubtype() != this.mNetworkState.getConnectionSubtype()) {
            this.mObserver.onConnectionSubtypeChanged(networkState.getConnectionSubtype());
        }
        if (networkState.getConnectionCost() != this.mNetworkState.getConnectionCost()) {
            this.mObserver.onConnectionCostChanged(networkState.getConnectionCost());
        }
        this.mNetworkState = networkState;
    }

    private static class NetworkConnectivityIntentFilter extends IntentFilter {
        NetworkConnectivityIntentFilter() {
            addAction("android.net.conn.CONNECTIVITY_CHANGE");
        }
    }

    public static long networkToNetId(Network network) {
        return ApiHelperForM.getNetworkHandle(network);
    }
}
