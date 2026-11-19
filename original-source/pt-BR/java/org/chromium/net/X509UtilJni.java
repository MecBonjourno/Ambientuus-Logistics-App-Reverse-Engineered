package org.chromium.net;

import org.chromium.net.X509Util;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* carregado de: classes17.dex */
class X509UtilJni implements X509Util.Natives {
    public static final JniStaticTestMocker<X509Util.Natives> TEST_HOOKS = new JniStaticTestMocker<X509Util.Natives>() { // da classe: org.chromium.net.X509UtilJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(X509Util.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            X509UtilJni.testInstance = instance;
        }
    };
    private static X509Util.Natives testInstance;

    X509UtilJni() {
    }

    @Override // org.chromium.net.X509Util.Natives
    public void notifyClientCertStoreChanged() {
        GEN_JNI.org_chromium_net_X509Util_notifyClientCertStoreChanged();
    }

    @Override // org.chromium.net.X509Util.Natives
    public void notifyTrustStoreChanged() {
        GEN_JNI.org_chromium_net_X509Util_notifyTrustStoreChanged();
    }

    public static X509Util.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of X509Util.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new X509UtilJni();
    }
}
