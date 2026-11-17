package org.chromium.net;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.http.X509TrustManagerExtensions;
import android.os.Build;
import android.util.Pair;
import com.google.common.base.Ascii;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.cert.Certificate;
import java.security.cert.CertificateEncodingException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateExpiredException;
import java.security.cert.CertificateFactory;
import java.security.cert.CertificateNotYetValidException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;
import javax.security.auth.x500.X500Principal;
import org.chromium.base.ContextUtils;
import org.chromium.base.Log;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.build.annotations.MainDex;

@JNINamespace("net")
@MainDex
/* loaded from: classes17.dex */
public class X509Util {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String OID_ANY_EKU = "2.5.29.37.0";
    private static final String OID_SERVER_GATED_MICROSOFT = "1.3.6.1.4.1.311.10.3.3";
    private static final String OID_SERVER_GATED_NETSCAPE = "2.16.840.1.113730.4.1";
    private static final String OID_TLS_SERVER_AUTH = "1.3.6.1.5.5.7.3.1";
    private static final String TAG = "X509Util";
    private static CertificateFactory sCertificateFactory;
    private static X509TrustManagerExtensions sDefaultTrustManager;
    private static boolean sLoadedSystemKeyStore;
    private static File sSystemCertificateDirectory;
    private static KeyStore sSystemKeyStore;
    private static Set<Pair<X500Principal, PublicKey>> sSystemTrustAnchorCache;
    private static KeyStore sTestKeyStore;
    private static X509Certificate sTestRoot;
    private static X509TrustManagerExtensions sTestTrustManager;
    private static TrustStorageListener sTrustStorageListener;
    private static final Object sLock = new Object();
    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    interface Natives {
        void notifyClientCertStoreChanged();

        void notifyTrustStoreChanged();
    }

    private static final class TrustStorageListener extends BroadcastReceiver {
        private TrustStorageListener() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            boolean shouldReloadTrustManager = false;
            if (Build.VERSION.SDK_INT >= 26) {
                if ("android.security.action.TRUST_STORE_CHANGED".equals(intent.getAction())) {
                    shouldReloadTrustManager = true;
                } else if ("android.security.action.KEYCHAIN_CHANGED".equals(intent.getAction())) {
                    X509UtilJni.get().notifyClientCertStoreChanged();
                } else if ("android.security.action.KEY_ACCESS_CHANGED".equals(intent.getAction()) && !intent.getBooleanExtra("android.security.extra.KEY_ACCESSIBLE", false)) {
                    X509UtilJni.get().notifyClientCertStoreChanged();
                }
            } else if ("android.security.STORAGE_CHANGED".equals(intent.getAction())) {
                shouldReloadTrustManager = true;
                X509UtilJni.get().notifyClientCertStoreChanged();
            }
            if (shouldReloadTrustManager) {
                try {
                    X509Util.reloadDefaultTrustManager();
                } catch (KeyStoreException e) {
                    Log.e(X509Util.TAG, "Unable to reload the default TrustManager", (Throwable) e);
                } catch (NoSuchAlgorithmException e2) {
                    Log.e(X509Util.TAG, "Unable to reload the default TrustManager", (Throwable) e2);
                } catch (CertificateException e3) {
                    Log.e(X509Util.TAG, "Unable to reload the default TrustManager", (Throwable) e3);
                }
            }
        }
    }

    private static List<X509Certificate> checkServerTrustedIgnoringRuntimeException(X509TrustManagerExtensions tm, X509Certificate[] chain, String authType, String host) throws CertificateException {
        try {
            return tm.checkServerTrusted(chain, authType, host);
        } catch (RuntimeException e) {
            Log.e(TAG, "checkServerTrusted() unexpectedly threw: %s", (Throwable) e);
            throw new CertificateException(e);
        }
    }

    private static void ensureInitialized() throws CertificateException, KeyStoreException, NoSuchAlgorithmException {
        synchronized (sLock) {
            ensureInitializedLocked();
        }
    }

    private static void ensureInitializedLocked() throws CertificateException, KeyStoreException, NoSuchAlgorithmException {
        if (!Thread.holdsLock(sLock)) {
            throw new AssertionError();
        }
        if (sCertificateFactory == null) {
            sCertificateFactory = CertificateFactory.getInstance("X.509");
        }
        if (sDefaultTrustManager == null) {
            sDefaultTrustManager = createTrustManager(null);
        }
        if (!sLoadedSystemKeyStore) {
            try {
                sSystemKeyStore = KeyStore.getInstance("AndroidCAStore");
                try {
                    sSystemKeyStore.load(null);
                } catch (IOException e) {
                }
                sSystemCertificateDirectory = new File(System.getenv("ANDROID_ROOT") + "/etc/security/cacerts");
            } catch (KeyStoreException e2) {
            }
            sLoadedSystemKeyStore = true;
        }
        if (sSystemTrustAnchorCache == null) {
            sSystemTrustAnchorCache = new HashSet();
        }
        if (sTrustStorageListener == null) {
            sTrustStorageListener = new TrustStorageListener();
            IntentFilter filter = new IntentFilter();
            if (Build.VERSION.SDK_INT >= 26) {
                filter.addAction("android.security.action.KEYCHAIN_CHANGED");
                filter.addAction("android.security.action.KEY_ACCESS_CHANGED");
                filter.addAction("android.security.action.TRUST_STORE_CHANGED");
            } else {
                filter.addAction("android.security.STORAGE_CHANGED");
            }
            ContextUtils.registerProtectedBroadcastReceiver(ContextUtils.getApplicationContext(), sTrustStorageListener, filter);
        }
    }

    private static void ensureTestInitializedLocked() throws CertificateException, KeyStoreException, NoSuchAlgorithmException {
        if (!Thread.holdsLock(sLock)) {
            throw new AssertionError();
        }
        if (sTestKeyStore == null) {
            sTestKeyStore = KeyStore.getInstance(KeyStore.getDefaultType());
            try {
                sTestKeyStore.load(null);
            } catch (IOException e) {
            }
        }
        if (sTestTrustManager == null) {
            sTestTrustManager = createTrustManager(sTestKeyStore);
        }
    }

    private static X509TrustManagerExtensions createTrustManager(KeyStore keyStore) throws KeyStoreException, NoSuchAlgorithmException {
        String algorithm = TrustManagerFactory.getDefaultAlgorithm();
        TrustManagerFactory tmf = TrustManagerFactory.getInstance(algorithm);
        tmf.init(keyStore);
        try {
            TrustManager[] trustManagers = tmf.getTrustManagers();
            for (TrustManager tm : trustManagers) {
                if (tm instanceof X509TrustManager) {
                    try {
                        return new X509TrustManagerExtensions((X509TrustManager) tm);
                    } catch (IllegalArgumentException e) {
                        String className = tm.getClass().getName();
                        Log.e(TAG, "Error creating trust manager (" + className + "): " + e);
                    }
                }
            }
            Log.e(TAG, "Could not find suitable trust manager");
            return null;
        } catch (RuntimeException e2) {
            Log.e(TAG, "TrustManagerFactory.getTrustManagers() unexpectedly threw: %s", (Throwable) e2);
            throw new KeyStoreException(e2);
        }
    }

    private static void reloadTestTrustManager() throws KeyStoreException, NoSuchAlgorithmException, CertificateException {
        if (!Thread.holdsLock(sLock)) {
            throw new AssertionError();
        }
        ensureTestInitializedLocked();
        sTestTrustManager = createTrustManager(sTestKeyStore);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void reloadDefaultTrustManager() throws KeyStoreException, NoSuchAlgorithmException, CertificateException {
        synchronized (sLock) {
            sDefaultTrustManager = null;
            sSystemTrustAnchorCache = null;
            ensureInitializedLocked();
        }
        X509UtilJni.get().notifyTrustStoreChanged();
    }

    public static X509Certificate createCertificateFromBytes(byte[] derBytes) throws CertificateException, KeyStoreException, NoSuchAlgorithmException {
        ensureInitialized();
        return (X509Certificate) sCertificateFactory.generateCertificate(new ByteArrayInputStream(derBytes));
    }

    public static void addTestRootCertificate(byte[] rootCertBytes) throws CertificateException, KeyStoreException, NoSuchAlgorithmException {
        X509Certificate rootCert = createCertificateFromBytes(rootCertBytes);
        synchronized (sLock) {
            ensureTestInitializedLocked();
            sTestKeyStore.setCertificateEntry("root_cert_" + Integer.toString(sTestKeyStore.size()), rootCert);
            reloadTestTrustManager();
        }
    }

    public static void clearTestRootCertificates() throws NoSuchAlgorithmException, CertificateException, KeyStoreException {
        synchronized (sLock) {
            ensureTestInitializedLocked();
            try {
                sTestKeyStore.load(null);
                reloadTestTrustManager();
            } catch (IOException e) {
            }
        }
    }

    public static void setTestRootCertificateForBuiltin(byte[] rootCertBytes) throws NoSuchAlgorithmException, CertificateException, KeyStoreException {
        X509Certificate rootCert = createCertificateFromBytes(rootCertBytes);
        synchronized (sLock) {
            sTestRoot = rootCert;
        }
    }

    private static String hashPrincipal(X500Principal principal) throws NoSuchAlgorithmException {
        byte[] digest = MessageDigest.getInstance("MD5").digest(principal.getEncoded());
        char[] hexChars = new char[8];
        for (int i = 0; i < 4; i++) {
            hexChars[i * 2] = HEX_DIGITS[(digest[3 - i] >> 4) & 15];
            hexChars[(i * 2) + 1] = HEX_DIGITS[digest[3 - i] & Ascii.SI];
        }
        return new String(hexChars);
    }

    private static boolean isKnownRoot(X509Certificate root) throws NoSuchAlgorithmException, KeyStoreException {
        if (!Thread.holdsLock(sLock)) {
            throw new AssertionError();
        }
        if (sSystemKeyStore == null) {
            return false;
        }
        Pair<X500Principal, PublicKey> key = new Pair<>(root.getSubjectX500Principal(), root.getPublicKey());
        if (sSystemTrustAnchorCache.contains(key)) {
            return true;
        }
        String hash = hashPrincipal(root.getSubjectX500Principal());
        int i = 0;
        while (true) {
            String alias = hash + "." + i;
            if (!new File(sSystemCertificateDirectory, alias).exists()) {
                return false;
            }
            Certificate anchor = sSystemKeyStore.getCertificate("system:" + alias);
            if (anchor != null) {
                if (!(anchor instanceof X509Certificate)) {
                    String className = anchor.getClass().getName();
                    Log.e(TAG, "Anchor " + alias + " not an X509Certificate: " + className);
                } else {
                    X509Certificate anchorX509 = (X509Certificate) anchor;
                    if (root.getSubjectX500Principal().equals(anchorX509.getSubjectX500Principal()) && root.getPublicKey().equals(anchorX509.getPublicKey())) {
                        sSystemTrustAnchorCache.add(key);
                        return true;
                    }
                }
            }
            i++;
        }
    }

    static boolean verifyKeyUsage(X509Certificate certificate) throws CertificateException {
        try {
            List<String> ekuOids = certificate.getExtendedKeyUsage();
            if (ekuOids == null) {
                return true;
            }
            for (String ekuOid : ekuOids) {
                if (ekuOid.equals(OID_TLS_SERVER_AUTH) || ekuOid.equals(OID_ANY_EKU) || ekuOid.equals(OID_SERVER_GATED_NETSCAPE) || ekuOid.equals(OID_SERVER_GATED_MICROSOFT)) {
                    return true;
                }
            }
            return false;
        } catch (NullPointerException e) {
            return false;
        }
    }

    public static byte[][] getUserAddedRoots() {
        List<byte[]> userRootBytes = new ArrayList<>();
        synchronized (sLock) {
            try {
                try {
                    ensureInitialized();
                    if (sSystemKeyStore == null) {
                        return new byte[0][];
                    }
                    try {
                        Enumeration<String> aliases = sSystemKeyStore.aliases();
                        while (aliases.hasMoreElements()) {
                            String alias = aliases.nextElement();
                            if (alias.startsWith("user:")) {
                                try {
                                    Certificate anchor = sSystemKeyStore.getCertificate(alias);
                                    if (!(anchor instanceof X509Certificate)) {
                                        Log.w(TAG, "alias: " + alias + " is not a X509 Cert, skipping");
                                    } else {
                                        X509Certificate anchorX509 = (X509Certificate) anchor;
                                        userRootBytes.add(anchorX509.getEncoded());
                                    }
                                } catch (KeyStoreException e) {
                                    Log.e(TAG, "Error reading cert with alias %s, error: %s", alias, e);
                                } catch (CertificateEncodingException e2) {
                                    Log.e(TAG, "Error encoding cert with alias %s, error: %s", alias, e2);
                                }
                            }
                        }
                        if (sTestRoot != null) {
                            try {
                                userRootBytes.add(sTestRoot.getEncoded());
                            } catch (CertificateEncodingException e3) {
                                Log.e(TAG, "Error encoding test root cert, error %s", (Throwable) e3);
                            }
                        }
                        return (byte[][]) userRootBytes.toArray(new byte[0][]);
                    } catch (KeyStoreException e4) {
                        Log.e(TAG, "Error reading cert aliases: %s", (Throwable) e4);
                        return new byte[0][];
                    }
                } catch (Throwable th) {
                    throw th;
                }
            } catch (KeyStoreException e5) {
                return new byte[0][];
            } catch (NoSuchAlgorithmException e6) {
                return new byte[0][];
            } catch (CertificateException e7) {
                return new byte[0][];
            }
        }
    }

    public static AndroidCertVerifyResult verifyServerCertificates(byte[][] certChain, String authType, String host) throws KeyStoreException, NoSuchAlgorithmException {
        List<X509Certificate> verifiedChain;
        if (certChain == null || certChain.length == 0 || certChain[0] == null) {
            throw new IllegalArgumentException("Expected non-null and non-empty certificate chain passed as |certChain|. |certChain|=" + Arrays.deepToString(certChain));
        }
        try {
            ensureInitialized();
            List<X509Certificate> serverCertificatesList = new ArrayList<>();
            try {
                serverCertificatesList.add(createCertificateFromBytes(certChain[0]));
                for (int i = 1; i < certChain.length; i++) {
                    try {
                        serverCertificatesList.add(createCertificateFromBytes(certChain[i]));
                    } catch (CertificateException e) {
                        Log.w(TAG, "intermediate " + i + " failed parsing");
                    }
                }
                X509Certificate[] serverCertificates = (X509Certificate[]) serverCertificatesList.toArray(new X509Certificate[serverCertificatesList.size()]);
                try {
                    serverCertificates[0].checkValidity();
                    if (!verifyKeyUsage(serverCertificates[0])) {
                        return new AndroidCertVerifyResult(-6);
                    }
                    synchronized (sLock) {
                        if (sDefaultTrustManager == null) {
                            return new AndroidCertVerifyResult(-1);
                        }
                        List<X509Certificate> verifiedChain2 = null;
                        try {
                            verifiedChain = checkServerTrustedIgnoringRuntimeException(sDefaultTrustManager, serverCertificates, authType, host);
                        } catch (CertificateException eDefaultManager) {
                            if (sTestTrustManager != null) {
                                try {
                                    verifiedChain2 = checkServerTrustedIgnoringRuntimeException(sTestTrustManager, serverCertificates, authType, host);
                                } catch (CertificateException e2) {
                                }
                            }
                            if (verifiedChain2 != null) {
                                verifiedChain = verifiedChain2;
                            } else {
                                Log.i(TAG, "Failed to validate the certificate chain, error: " + eDefaultManager.getMessage());
                                return new AndroidCertVerifyResult(-2);
                            }
                        }
                        boolean isIssuedByKnownRoot = false;
                        if (verifiedChain.size() > 0) {
                            X509Certificate root = verifiedChain.get(verifiedChain.size() - 1);
                            isIssuedByKnownRoot = isKnownRoot(root);
                        }
                        return new AndroidCertVerifyResult(0, isIssuedByKnownRoot, verifiedChain);
                    }
                } catch (CertificateExpiredException e3) {
                    return new AndroidCertVerifyResult(-3);
                } catch (CertificateNotYetValidException e4) {
                    return new AndroidCertVerifyResult(-4);
                } catch (CertificateException e5) {
                    return new AndroidCertVerifyResult(-1);
                }
            } catch (CertificateException e6) {
                return new AndroidCertVerifyResult(-5);
            }
        } catch (CertificateException e7) {
            return new AndroidCertVerifyResult(-1);
        }
    }
}
