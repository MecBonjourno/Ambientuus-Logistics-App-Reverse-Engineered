package org.chromium.net;

import java.util.ArrayList;
import java.util.Iterator;
import org.chromium.base.ObserverList;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.annotations.NativeClassQualifiedName;
import org.chromium.net.NetworkChangeNotifierAutoDetect;

@JNINamespace("net")
/* carregado de: classes17.dex */
public class NetworkChangeNotifier {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static NetworkChangeNotifier sInstance;
    private NetworkChangeNotifierAutoDetect mAutoDetector;
    private int mCurrentConnectionType = 0;
    private int mCurrentConnectionCost = 0;
    private final ArrayList<Long> mNativeChangeNotifiers = new ArrayList<>();
    private final ObserverList<ConnectionTypeObserver> mConnectionTypeObservers = new ObserverList<>();

    public interface ConnectionTypeObserver {
        void onConnectionTypeChanged(int i);
    }

    interface Natives {
        @NativeClassQualifiedName("NetworkChangeNotifierDelegateAndroid")
        void notifyConnectionCostChanged(long j, NetworkChangeNotifier networkChangeNotifier, int i);

        @NativeClassQualifiedName("NetworkChangeNotifierDelegateAndroid")
        void notifyConnectionTypeChanged(long j, NetworkChangeNotifier networkChangeNotifier, int i, long j2);

        @NativeClassQualifiedName("NetworkChangeNotifierDelegateAndroid")
        void notifyMaxBandwidthChanged(long j, NetworkChangeNotifier networkChangeNotifier, int i);

        @NativeClassQualifiedName("NetworkChangeNotifierDelegateAndroid")
        void notifyOfNetworkConnect(long j, NetworkChangeNotifier networkChangeNotifier, long j2, int i);

        @NativeClassQualifiedName("NetworkChangeNotifierDelegateAndroid")
        void notifyOfNetworkDisconnect(long j, NetworkChangeNotifier networkChangeNotifier, long j2);

        @NativeClassQualifiedName("NetworkChangeNotifierDelegateAndroid")
        void notifyOfNetworkSoonToDisconnect(long j, NetworkChangeNotifier networkChangeNotifier, long j2);

        @NativeClassQualifiedName("NetworkChangeNotifierDelegateAndroid")
        void notifyPurgeActiveNetworkList(long j, NetworkChangeNotifier networkChangeNotifier, long[] jArr);
    }

    protected NetworkChangeNotifier() {
    }

    public static NetworkChangeNotifier init() {
        if (sInstance == null) {
            sInstance = new NetworkChangeNotifier();
        }
        return sInstance;
    }

    public static boolean isInitialized() {
        return sInstance != null;
    }

    public static void resetInstanceForTests() {
        sInstance = new NetworkChangeNotifier();
    }

    public static void resetInstanceForTests(NetworkChangeNotifier notifier) {
        sInstance = notifier;
    }

    public int getCurrentConnectionType() {
        return this.mCurrentConnectionType;
    }

    public int getCurrentConnectionSubtype() {
        if (this.mAutoDetector == null) {
            return 0;
        }
        return this.mAutoDetector.getCurrentNetworkState().getConnectionSubtype();
    }

    public int getCurrentConnectionCost() {
        return this.mCurrentConnectionCost;
    }

    public long getCurrentDefaultNetId() {
        if (this.mAutoDetector == null) {
            return -1L;
        }
        return this.mAutoDetector.getDefaultNetId();
    }

    public long[] getCurrentNetworksAndTypes() {
        return this.mAutoDetector == null ? new long[0] : this.mAutoDetector.getNetworksAndTypes();
    }

    public void addNativeObserver(long nativeChangeNotifier) {
        this.mNativeChangeNotifiers.add(Long.valueOf(nativeChangeNotifier));
    }

    public void removeNativeObserver(long nativeChangeNotifier) {
        this.mNativeChangeNotifiers.remove(Long.valueOf(nativeChangeNotifier));
    }

    public boolean registerNetworkCallbackFailed() {
        if (this.mAutoDetector == null) {
            return false;
        }
        return this.mAutoDetector.registerNetworkCallbackFailed();
    }

    public static NetworkChangeNotifier getInstance() {
        if (sInstance == null) {
            throw new AssertionError();
        }
        return sInstance;
    }

    public static void setAutoDetectConnectivityState(boolean shouldAutoDetect) {
        getInstance().setAutoDetectConnectivityStateInternal(shouldAutoDetect, new RegistrationPolicyApplicationStatus());
    }

    public static void registerToReceiveNotificationsAlways() {
        getInstance().setAutoDetectConnectivityStateInternal(true, new RegistrationPolicyAlwaysRegister());
    }

    public static void setAutoDetectConnectivityState(NetworkChangeNotifierAutoDetect.RegistrationPolicy policy) {
        getInstance().setAutoDetectConnectivityStateInternal(true, policy);
    }

    private void destroyAutoDetector() {
        if (this.mAutoDetector != null) {
            this.mAutoDetector.destroy();
            this.mAutoDetector = null;
        }
    }

    private void setAutoDetectConnectivityStateInternal(boolean shouldAutoDetect, NetworkChangeNotifierAutoDetect.RegistrationPolicy policy) {
        if (shouldAutoDetect) {
            if (this.mAutoDetector == null) {
                this.mAutoDetector = new NetworkChangeNotifierAutoDetect(new NetworkChangeNotifierAutoDetect.Observer() { // da classe: org.chromium.net.NetworkChangeNotifier.1
                    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.Observer
                    public void onConnectionTypeChanged(int newConnectionType) {
                        NetworkChangeNotifier.this.updateCurrentConnectionType(newConnectionType);
                    }

                    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.Observer
                    public void onConnectionCostChanged(int newConnectionCost) {
                        NetworkChangeNotifier.this.notifyObserversOfConnectionCostChange(newConnectionCost);
                    }

                    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.Observer
                    public void onConnectionSubtypeChanged(int newConnectionSubtype) {
                        NetworkChangeNotifier.this.notifyObserversOfConnectionSubtypeChange(newConnectionSubtype);
                    }

                    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.Observer
                    public void onNetworkConnect(long netId, int connectionType) {
                        NetworkChangeNotifier.this.notifyObserversOfNetworkConnect(netId, connectionType);
                    }

                    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.Observer
                    public void onNetworkSoonToDisconnect(long netId) {
                        NetworkChangeNotifier.this.notifyObserversOfNetworkSoonToDisconnect(netId);
                    }

                    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.Observer
                    public void onNetworkDisconnect(long netId) {
                        NetworkChangeNotifier.this.notifyObserversOfNetworkDisconnect(netId);
                    }

                    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.Observer
                    public void purgeActiveNetworkList(long[] activeNetIds) {
                        NetworkChangeNotifier.this.notifyObserversToPurgeActiveNetworkList(activeNetIds);
                    }
                }, policy);
                NetworkChangeNotifierAutoDetect.NetworkState networkState = this.mAutoDetector.getCurrentNetworkState();
                updateCurrentConnectionType(networkState.getConnectionType());
                updateCurrentConnectionCost(networkState.getConnectionCost());
                notifyObserversOfConnectionSubtypeChange(networkState.getConnectionSubtype());
                return;
            }
            return;
        }
        destroyAutoDetector();
    }

    public static void forceConnectivityState(boolean networkAvailable) {
        setAutoDetectConnectivityState(false);
        getInstance().forceConnectivityStateInternal(networkAvailable);
    }

    private void forceConnectivityStateInternal(boolean forceOnline) {
        boolean connectionCurrentlyExists = this.mCurrentConnectionType != 6;
        if (connectionCurrentlyExists != forceOnline) {
            updateCurrentConnectionType(forceOnline ? 0 : 6);
            notifyObserversOfConnectionSubtypeChange(forceOnline ? 0 : 1);
        }
    }

    public static void fakeNetworkConnected(long netId, int connectionType) {
        setAutoDetectConnectivityState(false);
        getInstance().notifyObserversOfNetworkConnect(netId, connectionType);
    }

    public static void fakeNetworkSoonToBeDisconnected(long netId) {
        setAutoDetectConnectivityState(false);
        getInstance().notifyObserversOfNetworkSoonToDisconnect(netId);
    }

    public static void fakeNetworkDisconnected(long netId) {
        setAutoDetectConnectivityState(false);
        getInstance().notifyObserversOfNetworkDisconnect(netId);
    }

    public static void fakePurgeActiveNetworkList(long[] activeNetIds) {
        setAutoDetectConnectivityState(false);
        getInstance().notifyObserversToPurgeActiveNetworkList(activeNetIds);
    }

    public static void fakeDefaultNetwork(long netId, int connectionType) {
        setAutoDetectConnectivityState(false);
        getInstance().notifyObserversOfConnectionTypeChange(connectionType, netId);
    }

    public static void fakeConnectionCostChanged(int connectionCost) {
        setAutoDetectConnectivityState(false);
        getInstance().notifyObserversOfConnectionCostChange(connectionCost);
    }

    public static void fakeConnectionSubtypeChanged(int connectionSubtype) {
        setAutoDetectConnectivityState(false);
        getInstance().notifyObserversOfConnectionSubtypeChange(connectionSubtype);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void updateCurrentConnectionType(int newConnectionType) {
        this.mCurrentConnectionType = newConnectionType;
        notifyObserversOfConnectionTypeChange(newConnectionType);
    }

    void notifyObserversOfConnectionTypeChange(int newConnectionType) {
        notifyObserversOfConnectionTypeChange(newConnectionType, getCurrentDefaultNetId());
    }

    private void notifyObserversOfConnectionTypeChange(int newConnectionType, long defaultNetId) {
        Iterator<Long> it = this.mNativeChangeNotifiers.iterator();
        while (it.hasNext()) {
            Long nativeChangeNotifier = it.next();
            NetworkChangeNotifierJni.get().notifyConnectionTypeChanged(nativeChangeNotifier.longValue(), this, newConnectionType, defaultNetId);
        }
        Iterator<ConnectionTypeObserver> it2 = this.mConnectionTypeObservers.iterator();
        while (it2.hasNext()) {
            ConnectionTypeObserver observer = it2.next();
            observer.onConnectionTypeChanged(newConnectionType);
        }
    }

    private void updateCurrentConnectionCost(int newConnectionCost) {
        this.mCurrentConnectionCost = newConnectionCost;
        notifyObserversOfConnectionCostChange(newConnectionCost);
    }

    void notifyObserversOfConnectionCostChange(int newConnectionCost) {
        Iterator<Long> it = this.mNativeChangeNotifiers.iterator();
        while (it.hasNext()) {
            Long nativeChangeNotifier = it.next();
            NetworkChangeNotifierJni.get().notifyConnectionCostChanged(nativeChangeNotifier.longValue(), this, newConnectionCost);
        }
    }

    void notifyObserversOfConnectionSubtypeChange(int connectionSubtype) {
        Iterator<Long> it = this.mNativeChangeNotifiers.iterator();
        while (it.hasNext()) {
            Long nativeChangeNotifier = it.next();
            NetworkChangeNotifierJni.get().notifyMaxBandwidthChanged(nativeChangeNotifier.longValue(), this, connectionSubtype);
        }
    }

    void notifyObserversOfNetworkConnect(long netId, int connectionType) {
        Iterator<Long> it = this.mNativeChangeNotifiers.iterator();
        while (it.hasNext()) {
            Long nativeChangeNotifier = it.next();
            NetworkChangeNotifierJni.get().notifyOfNetworkConnect(nativeChangeNotifier.longValue(), this, netId, connectionType);
        }
    }

    void notifyObserversOfNetworkSoonToDisconnect(long netId) {
        Iterator<Long> it = this.mNativeChangeNotifiers.iterator();
        while (it.hasNext()) {
            Long nativeChangeNotifier = it.next();
            NetworkChangeNotifierJni.get().notifyOfNetworkSoonToDisconnect(nativeChangeNotifier.longValue(), this, netId);
        }
    }

    void notifyObserversOfNetworkDisconnect(long netId) {
        Iterator<Long> it = this.mNativeChangeNotifiers.iterator();
        while (it.hasNext()) {
            Long nativeChangeNotifier = it.next();
            NetworkChangeNotifierJni.get().notifyOfNetworkDisconnect(nativeChangeNotifier.longValue(), this, netId);
        }
    }

    void notifyObserversToPurgeActiveNetworkList(long[] activeNetIds) {
        Iterator<Long> it = this.mNativeChangeNotifiers.iterator();
        while (it.hasNext()) {
            Long nativeChangeNotifier = it.next();
            NetworkChangeNotifierJni.get().notifyPurgeActiveNetworkList(nativeChangeNotifier.longValue(), this, activeNetIds);
        }
    }

    public static void addConnectionTypeObserver(ConnectionTypeObserver observer) {
        getInstance().addConnectionTypeObserverInternal(observer);
    }

    private void addConnectionTypeObserverInternal(ConnectionTypeObserver observer) {
        this.mConnectionTypeObservers.addObserver(observer);
    }

    public static void removeConnectionTypeObserver(ConnectionTypeObserver observer) {
        getInstance().removeConnectionTypeObserverInternal(observer);
    }

    private void removeConnectionTypeObserverInternal(ConnectionTypeObserver observer) {
        this.mConnectionTypeObservers.removeObserver(observer);
    }

    public static NetworkChangeNotifierAutoDetect getAutoDetectorForTest() {
        return getInstance().mAutoDetector;
    }

    public static boolean isOnline() {
        int connectionType = getInstance().getCurrentConnectionType();
        return connectionType != 6;
    }
}
