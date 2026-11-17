package org.chromium.net.impl;

import org.chromium.net.impl.CronetUrlRequestContext;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class CronetUrlRequestContextJni implements CronetUrlRequestContext.Natives {
    public static final JniStaticTestMocker<CronetUrlRequestContext.Natives> TEST_HOOKS = new JniStaticTestMocker<CronetUrlRequestContext.Natives>() { // from class: org.chromium.net.impl.CronetUrlRequestContextJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(CronetUrlRequestContext.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            CronetUrlRequestContextJni.testInstance = instance;
        }
    };
    private static CronetUrlRequestContext.Natives testInstance;

    CronetUrlRequestContextJni() {
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void addPkp(long urlRequestContextConfig, String host, byte[][] hashes, boolean includeSubdomains, long expirationTime) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_addPkp(urlRequestContextConfig, host, hashes, includeSubdomains, expirationTime);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void addQuicHint(long urlRequestContextConfig, String host, int port, int alternatePort) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_addQuicHint(urlRequestContextConfig, host, port, alternatePort);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void configureNetworkQualityEstimatorForTesting(long nativePtr, CronetUrlRequestContext caller, boolean useLocalHostRequests, boolean useSmallerResponses, boolean disableOfflineCheck) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_configureNetworkQualityEstimatorForTesting(nativePtr, caller, useLocalHostRequests, useSmallerResponses, disableOfflineCheck);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public long createRequestContextAdapter(long urlRequestContextConfig) {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_createRequestContextAdapter(urlRequestContextConfig);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public long createRequestContextConfig(byte[] serializedRequestContextConfigOptions) {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_createRequestContextConfig(serializedRequestContextConfigOptions);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void destroy(long nativePtr, CronetUrlRequestContext caller) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_destroy(nativePtr, caller);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public boolean getEnableTelemetry(long nativePtr, CronetUrlRequestContext caller) {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_getEnableTelemetry(nativePtr, caller);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public byte[] getHistogramDeltas() {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_getHistogramDeltas();
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void initRequestContextOnInitThread(long nativePtr, CronetUrlRequestContext caller) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_initRequestContextOnInitThread(nativePtr, caller);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void provideRTTObservations(long nativePtr, CronetUrlRequestContext caller, boolean should) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_provideRTTObservations(nativePtr, caller, should);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void provideThroughputObservations(long nativePtr, CronetUrlRequestContext caller, boolean should) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_provideThroughputObservations(nativePtr, caller, should);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void startNetLogToDisk(long nativePtr, CronetUrlRequestContext caller, String dirPath, boolean logAll, int maxSize) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_startNetLogToDisk(nativePtr, caller, dirPath, logAll, maxSize);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public boolean startNetLogToFile(long nativePtr, CronetUrlRequestContext caller, String fileName, boolean logAll) {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_startNetLogToFile(nativePtr, caller, fileName, logAll);
    }

    @Override // org.chromium.net.impl.CronetUrlRequestContext.Natives
    public void stopNetLog(long nativePtr, CronetUrlRequestContext caller) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequestContext_stopNetLog(nativePtr, caller);
    }

    public static CronetUrlRequestContext.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of CronetUrlRequestContext.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new CronetUrlRequestContextJni();
    }
}
