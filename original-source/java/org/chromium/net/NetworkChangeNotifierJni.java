package org.chromium.net;

import org.chromium.net.NetworkChangeNotifier;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class NetworkChangeNotifierJni implements NetworkChangeNotifier.Natives {
    public static final JniStaticTestMocker<NetworkChangeNotifier.Natives> TEST_HOOKS = new JniStaticTestMocker<NetworkChangeNotifier.Natives>() { // from class: org.chromium.net.NetworkChangeNotifierJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(NetworkChangeNotifier.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            NetworkChangeNotifierJni.testInstance = instance;
        }
    };
    private static NetworkChangeNotifier.Natives testInstance;

    NetworkChangeNotifierJni() {
    }

    @Override // org.chromium.net.NetworkChangeNotifier.Natives
    public void notifyConnectionCostChanged(long nativePtr, NetworkChangeNotifier caller, int newConnectionCost) {
        GEN_JNI.org_chromium_net_NetworkChangeNotifier_notifyConnectionCostChanged(nativePtr, caller, newConnectionCost);
    }

    @Override // org.chromium.net.NetworkChangeNotifier.Natives
    public void notifyConnectionTypeChanged(long nativePtr, NetworkChangeNotifier caller, int newConnectionType, long defaultNetId) {
        GEN_JNI.org_chromium_net_NetworkChangeNotifier_notifyConnectionTypeChanged(nativePtr, caller, newConnectionType, defaultNetId);
    }

    @Override // org.chromium.net.NetworkChangeNotifier.Natives
    public void notifyMaxBandwidthChanged(long nativePtr, NetworkChangeNotifier caller, int subType) {
        GEN_JNI.org_chromium_net_NetworkChangeNotifier_notifyMaxBandwidthChanged(nativePtr, caller, subType);
    }

    @Override // org.chromium.net.NetworkChangeNotifier.Natives
    public void notifyOfNetworkConnect(long nativePtr, NetworkChangeNotifier caller, long netId, int connectionType) {
        GEN_JNI.org_chromium_net_NetworkChangeNotifier_notifyOfNetworkConnect(nativePtr, caller, netId, connectionType);
    }

    @Override // org.chromium.net.NetworkChangeNotifier.Natives
    public void notifyOfNetworkDisconnect(long nativePtr, NetworkChangeNotifier caller, long netId) {
        GEN_JNI.org_chromium_net_NetworkChangeNotifier_notifyOfNetworkDisconnect(nativePtr, caller, netId);
    }

    @Override // org.chromium.net.NetworkChangeNotifier.Natives
    public void notifyOfNetworkSoonToDisconnect(long nativePtr, NetworkChangeNotifier caller, long netId) {
        GEN_JNI.org_chromium_net_NetworkChangeNotifier_notifyOfNetworkSoonToDisconnect(nativePtr, caller, netId);
    }

    @Override // org.chromium.net.NetworkChangeNotifier.Natives
    public void notifyPurgeActiveNetworkList(long nativePtr, NetworkChangeNotifier caller, long[] activeNetIds) {
        GEN_JNI.org_chromium_net_NetworkChangeNotifier_notifyPurgeActiveNetworkList(nativePtr, caller, activeNetIds);
    }

    public static NetworkChangeNotifier.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of NetworkChangeNotifier.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new NetworkChangeNotifierJni();
    }
}
