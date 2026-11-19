package org.chromium.net;

import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.net.TrafficStats;
import android.net.TransportInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.telephony.TelephonyManager;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.net.SocketImpl;
import java.net.URLConnection;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.Enumeration;
import java.util.List;
import org.chromium.base.ApiCompatibilityUtils;
import org.chromium.base.ContextUtils;
import org.chromium.base.ResettersForTesting;
import org.chromium.base.compat.ApiHelperForM;
import org.chromium.base.compat.ApiHelperForN;
import org.chromium.base.compat.ApiHelperForP;
import org.chromium.base.compat.ApiHelperForQ;
import org.chromium.build.annotations.MainDex;
import org.chromium.net.AndroidNetworkLibrary;

@MainDex
/* carregado de: classes17.dex */
class AndroidNetworkLibrary {
    private static final String TAG = "AndroidNetworkLibrary";
    private static Boolean sHaveAccessNetworkState;
    private static Boolean sHaveAccessWifiState;

    AndroidNetworkLibrary() {
    }

    public static String getMimeTypeFromExtension(String extension) {
        return URLConnection.guessContentTypeFromName("foo." + extension);
    }

    public static boolean haveOnlyLoopbackAddresses() {
        try {
            Enumeration<NetworkInterface> list = NetworkInterface.getNetworkInterfaces();
            if (list == null) {
                return false;
            }
            while (list.hasMoreElements()) {
                NetworkInterface netIf = list.nextElement();
                try {
                    if (netIf.isUp() && !netIf.isLoopback()) {
                        return false;
                    }
                } catch (SocketException e) {
                }
            }
            return true;
        } catch (Exception e2) {
            Log.w(TAG, "could not get network interfaces: " + e2);
            return false;
        }
    }

    public static AndroidCertVerifyResult verifyServerCertificates(byte[][] certChain, String authType, String host) {
        try {
            return X509Util.verifyServerCertificates(certChain, authType, host);
        } catch (IllegalArgumentException e) {
            return new AndroidCertVerifyResult(-1);
        } catch (KeyStoreException e2) {
            return new AndroidCertVerifyResult(-1);
        } catch (NoSuchAlgorithmException e3) {
            return new AndroidCertVerifyResult(-1);
        }
    }

    public static byte[][] getUserAddedRoots() {
        return X509Util.getUserAddedRoots();
    }

    public static void addTestRootCertificate(byte[] rootCert) throws CertificateException, KeyStoreException, NoSuchAlgorithmException {
        X509Util.addTestRootCertificate(rootCert);
    }

    public static void clearTestRootCertificates() throws NoSuchAlgorithmException, CertificateException, KeyStoreException {
        X509Util.clearTestRootCertificates();
    }

    private static String getNetworkOperator() {
        TelephonyManager telephonyManager = (TelephonyManager) ContextUtils.getApplicationContext().getSystemService("phone");
        return telephonyManager == null ? "" : telephonyManager.getNetworkOperator();
    }

    private static boolean getIsRoaming() {
        ConnectivityManager connectivityManager = (ConnectivityManager) ContextUtils.getApplicationContext().getSystemService("connectivity");
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();
        if (networkInfo == null) {
            return false;
        }
        return networkInfo.isRoaming();
    }

    private static boolean getIsCaptivePortal() {
        Network network;
        NetworkCapabilities capabilities;
        ConnectivityManager connectivityManager = (ConnectivityManager) ContextUtils.getApplicationContext().getSystemService("connectivity");
        return (connectivityManager == null || (network = ApiHelperForM.getActiveNetwork(connectivityManager)) == null || (capabilities = connectivityManager.getNetworkCapabilities(network)) == null || !capabilities.hasCapability(17)) ? false : true;
    }

    private static WifiInfo getWifiInfo() {
        TransportInfo transportInfo;
        if (haveAccessWifiState()) {
            if (Build.VERSION.SDK_INT >= 31) {
                ConnectivityManager connectivityManager = (ConnectivityManager) ContextUtils.getApplicationContext().getSystemService("connectivity");
                Network[] allNetworks = connectivityManager.getAllNetworks();
                for (Network network : allNetworks) {
                    NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(network);
                    if (networkCapabilities != null && networkCapabilities.hasTransport(1) && (transportInfo = ApiHelperForQ.getTransportInfo(networkCapabilities)) != null && (transportInfo instanceof WifiInfo)) {
                        return (WifiInfo) transportInfo;
                    }
                }
                return null;
            }
            WifiManager wifiManager = (WifiManager) ContextUtils.getApplicationContext().getSystemService("wifi");
            return wifiManager.getConnectionInfo();
        }
        Intent intent = ContextUtils.registerProtectedBroadcastReceiver(ContextUtils.getApplicationContext(), null, new IntentFilter("android.net.wifi.STATE_CHANGE"));
        if (intent != null) {
            return (WifiInfo) intent.getParcelableExtra("wifiInfo");
        }
        return null;
    }

    public static String getWifiSSID() {
        String ssid;
        WifiInfo wifiInfo = getWifiInfo();
        if (wifiInfo != null && (ssid = wifiInfo.getSSID()) != null && !ssid.equals("<unknown ssid>")) {
            return ssid;
        }
        return "";
    }

    public static void setWifiEnabledForTesting(boolean enabled) {
        final WifiManager wifiManager = (WifiManager) ContextUtils.getApplicationContext().getSystemService("wifi");
        final boolean oldValue = wifiManager.isWifiEnabled();
        wifiManager.setWifiEnabled(enabled);
        ResettersForTesting.register(new Runnable() { // da classe: org.chromium.net.AndroidNetworkLibrary$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                wifiManager.setWifiEnabled(oldValue);
            }
        });
    }

    public static int getWifiSignalLevel(int countBuckets) {
        int rssi;
        int signalLevel;
        if (ContextUtils.getApplicationContext() == null || ContextUtils.getApplicationContext().getContentResolver() == null) {
            return -1;
        }
        if (haveAccessWifiState()) {
            WifiInfo wifiInfo = getWifiInfo();
            if (wifiInfo == null) {
                return -1;
            }
            rssi = wifiInfo.getRssi();
        } else {
            try {
                Intent intent = ContextUtils.registerProtectedBroadcastReceiver(ContextUtils.getApplicationContext(), null, new IntentFilter("android.net.wifi.RSSI_CHANGED"));
                if (intent == null) {
                    return -1;
                }
                rssi = intent.getIntExtra("newRssi", Integer.MIN_VALUE);
            } catch (IllegalArgumentException e) {
                return -1;
            }
        }
        if (rssi != Integer.MIN_VALUE && (signalLevel = WifiManager.calculateSignalLevel(rssi, countBuckets)) >= 0 && signalLevel < countBuckets) {
            return signalLevel;
        }
        return -1;
    }

    public static class NetworkSecurityPolicyProxy {
        private static NetworkSecurityPolicyProxy sInstance = new NetworkSecurityPolicyProxy();

        public static NetworkSecurityPolicyProxy getInstance() {
            return sInstance;
        }

        public static void setInstanceForTesting(NetworkSecurityPolicyProxy networkSecurityPolicyProxy) {
            final NetworkSecurityPolicyProxy oldValue = sInstance;
            sInstance = networkSecurityPolicyProxy;
            ResettersForTesting.register(new Runnable() { // da classe: org.chromium.net.AndroidNetworkLibrary$NetworkSecurityPolicyProxy$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    AndroidNetworkLibrary.NetworkSecurityPolicyProxy.sInstance = AndroidNetworkLibrary.NetworkSecurityPolicyProxy.this;
                }
            });
        }

        public boolean isCleartextTrafficPermitted(String host) {
            if (Build.VERSION.SDK_INT < 24) {
                return isCleartextTrafficPermitted();
            }
            return ApiHelperForN.isCleartextTrafficPermitted(host);
        }

        public boolean isCleartextTrafficPermitted() {
            return ApiHelperForM.isCleartextTrafficPermitted();
        }
    }

    private static boolean isCleartextPermitted(String host) {
        try {
            return NetworkSecurityPolicyProxy.getInstance().isCleartextTrafficPermitted(host);
        } catch (IllegalArgumentException e) {
            return NetworkSecurityPolicyProxy.getInstance().isCleartextTrafficPermitted();
        }
    }

    private static boolean haveAccessNetworkState() {
        if (sHaveAccessNetworkState == null) {
            sHaveAccessNetworkState = Boolean.valueOf(ApiCompatibilityUtils.checkPermission(ContextUtils.getApplicationContext(), "android.permission.ACCESS_NETWORK_STATE", Process.myPid(), Process.myUid()) == 0);
        }
        return sHaveAccessNetworkState.booleanValue();
    }

    private static boolean haveAccessWifiState() {
        if (sHaveAccessWifiState == null) {
            sHaveAccessWifiState = Boolean.valueOf(ApiCompatibilityUtils.checkPermission(ContextUtils.getApplicationContext(), "android.permission.ACCESS_WIFI_STATE", Process.myPid(), Process.myUid()) == 0);
        }
        return sHaveAccessWifiState.booleanValue();
    }

    public static DnsStatus getDnsStatusForNetwork(long networkHandle) {
        try {
            Network network = Network.fromNetworkHandle(networkHandle);
            return getDnsStatus(network);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    public static DnsStatus getCurrentDnsStatus() {
        return getDnsStatus(null);
    }

    public static DnsStatus getDnsStatus(Network network) {
        ConnectivityManager connectivityManager;
        if (!haveAccessNetworkState() || (connectivityManager = (ConnectivityManager) ContextUtils.getApplicationContext().getSystemService("connectivity")) == null) {
            return null;
        }
        if (network == null) {
            network = ApiHelperForM.getActiveNetwork(connectivityManager);
        }
        if (network == null) {
            return null;
        }
        try {
            LinkProperties linkProperties = connectivityManager.getLinkProperties(network);
            if (linkProperties == null) {
                return null;
            }
            List<InetAddress> dnsServersList = linkProperties.getDnsServers();
            String searchDomains = linkProperties.getDomains();
            if (Build.VERSION.SDK_INT >= 28) {
                return new DnsStatus(dnsServersList, ApiHelperForP.isPrivateDnsActive(linkProperties), ApiHelperForP.getPrivateDnsServerName(linkProperties), searchDomains);
            }
            return new DnsStatus(dnsServersList, false, "", searchDomains);
        } catch (RuntimeException e) {
            return null;
        }
    }

    private static boolean reportBadDefaultNetwork() {
        ConnectivityManager connectivityManager = (ConnectivityManager) ContextUtils.getApplicationContext().getSystemService("connectivity");
        if (connectivityManager == null) {
            return false;
        }
        ApiHelperForM.reportNetworkConnectivity(connectivityManager, null, false);
        return true;
    }

    private static class SetFileDescriptor {
        private static final Method sFileDescriptorSetInt;

        private SetFileDescriptor() {
        }

        static {
            try {
                try {
                    sFileDescriptorSetInt = FileDescriptor.class.getMethod("setInt$", Integer.TYPE);
                } catch (NoSuchMethodException | SecurityException e) {
                    e = e;
                    throw new RuntimeException("Unable to get FileDescriptor.setInt$", e);
                }
            } catch (SecurityException e2) {
                e = e2;
                throw new RuntimeException("Unable to get FileDescriptor.setInt$", e);
            }
        }

        public static FileDescriptor createWithFd(int fd) {
            try {
                FileDescriptor fileDescriptor = new FileDescriptor();
                sFileDescriptorSetInt.invoke(fileDescriptor, Integer.valueOf(fd));
                return fileDescriptor;
            } catch (IllegalAccessException e) {
                throw new RuntimeException("FileDescriptor.setInt$() failed", e);
            } catch (InvocationTargetException e2) {
                throw new RuntimeException("FileDescriptor.setInt$() failed", e2);
            }
        }
    }

    private static class SocketFd extends Socket {

        private static class SocketImplFd extends SocketImpl {
            SocketImplFd(FileDescriptor fd) {
                this.fd = fd;
            }

            @Override // java.net.SocketImpl
            protected void accept(SocketImpl s) {
                throw new RuntimeException("accept not implemented");
            }

            @Override // java.net.SocketImpl
            protected int available() {
                throw new RuntimeException("accept not implemented");
            }

            @Override // java.net.SocketImpl
            protected void bind(InetAddress host, int port) {
                throw new RuntimeException("accept not implemented");
            }

            @Override // java.net.SocketImpl
            protected void close() {
            }

            @Override // java.net.SocketImpl
            protected void connect(InetAddress address, int port) {
                throw new RuntimeException("connect not implemented");
            }

            @Override // java.net.SocketImpl
            protected void connect(SocketAddress address, int timeout) {
                throw new RuntimeException("connect not implemented");
            }

            @Override // java.net.SocketImpl
            protected void connect(String host, int port) {
                throw new RuntimeException("connect not implemented");
            }

            @Override // java.net.SocketImpl
            protected void create(boolean stream) {
            }

            @Override // java.net.SocketImpl
            protected InputStream getInputStream() {
                throw new RuntimeException("getInputStream not implemented");
            }

            @Override // java.net.SocketImpl
            protected OutputStream getOutputStream() {
                throw new RuntimeException("getOutputStream not implemented");
            }

            @Override // java.net.SocketImpl
            protected void listen(int backlog) {
                throw new RuntimeException("listen not implemented");
            }

            @Override // java.net.SocketImpl
            protected void sendUrgentData(int data) {
                throw new RuntimeException("sendUrgentData not implemented");
            }

            @Override // java.net.SocketOptions
            public Object getOption(int optID) {
                throw new RuntimeException("getOption not implemented");
            }

            @Override // java.net.SocketOptions
            public void setOption(int optID, Object value) {
                throw new RuntimeException("setOption not implemented");
            }
        }

        SocketFd(FileDescriptor fd) throws IOException {
            super(new SocketImplFd(fd));
        }
    }

    private static void tagSocket(int ifd, int uid, int tag) throws IOException {
        int oldTag = TrafficStats.getThreadStatsTag();
        if (tag != oldTag) {
            TrafficStats.setThreadStatsTag(tag);
        }
        if (uid != -1) {
            ThreadStatsUid.set(uid);
        }
        ParcelFileDescriptor pfd = ParcelFileDescriptor.adoptFd(ifd);
        FileDescriptor fd = pfd.getFileDescriptor();
        Socket s = new SocketFd(fd);
        TrafficStats.tagSocket(s);
        s.close();
        if (pfd != null) {
            pfd.detachFd();
        }
        if (tag != oldTag) {
            TrafficStats.setThreadStatsTag(oldTag);
        }
        if (uid != -1) {
            ThreadStatsUid.clear();
        }
    }
}
