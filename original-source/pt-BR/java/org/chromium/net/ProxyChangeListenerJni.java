package org.chromium.net;

import org.chromium.net.ProxyChangeListener;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* carregado de: classes17.dex */
class ProxyChangeListenerJni implements ProxyChangeListener.Natives {
    public static final JniStaticTestMocker<ProxyChangeListener.Natives> TEST_HOOKS = new JniStaticTestMocker<ProxyChangeListener.Natives>() { // da classe: org.chromium.net.ProxyChangeListenerJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(ProxyChangeListener.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            ProxyChangeListenerJni.testInstance = instance;
        }
    };
    private static ProxyChangeListener.Natives testInstance;

    ProxyChangeListenerJni() {
    }

    @Override // org.chromium.net.ProxyChangeListener.Natives
    public void proxySettingsChanged(long nativePtr, ProxyChangeListener caller) {
        GEN_JNI.org_chromium_net_ProxyChangeListener_proxySettingsChanged(nativePtr, caller);
    }

    @Override // org.chromium.net.ProxyChangeListener.Natives
    public void proxySettingsChangedTo(long nativePtr, ProxyChangeListener caller, String host, int port, String pacUrl, String[] exclusionList) {
        GEN_JNI.org_chromium_net_ProxyChangeListener_proxySettingsChangedTo(nativePtr, caller, host, port, pacUrl, exclusionList);
    }

    public static ProxyChangeListener.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of ProxyChangeListener.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new ProxyChangeListenerJni();
    }
}
