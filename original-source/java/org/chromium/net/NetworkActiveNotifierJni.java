package org.chromium.net;

import org.chromium.net.NetworkActiveNotifier;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class NetworkActiveNotifierJni implements NetworkActiveNotifier.Natives {
    public static final JniStaticTestMocker<NetworkActiveNotifier.Natives> TEST_HOOKS = new JniStaticTestMocker<NetworkActiveNotifier.Natives>() { // from class: org.chromium.net.NetworkActiveNotifierJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(NetworkActiveNotifier.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            NetworkActiveNotifierJni.testInstance = instance;
        }
    };
    private static NetworkActiveNotifier.Natives testInstance;

    NetworkActiveNotifierJni() {
    }

    @Override // org.chromium.net.NetworkActiveNotifier.Natives
    public void notifyOfDefaultNetworkActive(long nativePtr) {
        GEN_JNI.org_chromium_net_NetworkActiveNotifier_notifyOfDefaultNetworkActive(nativePtr);
    }

    public static NetworkActiveNotifier.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of NetworkActiveNotifier.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new NetworkActiveNotifierJni();
    }
}
