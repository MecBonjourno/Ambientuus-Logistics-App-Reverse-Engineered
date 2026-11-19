package org.chromium.net.impl;

import java.nio.ByteBuffer;
import org.chromium.net.impl.CronetUrlRequest;
import org.chromium.net.impl.VersionSafeCallbacks;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* carregado de: classes17.dex */
class CronetUrlRequestJni implements CronetUrlRequest.Natives {
    public static final JniStaticTestMocker<CronetUrlRequest.Natives> TEST_HOOKS = new JniStaticTestMocker<CronetUrlRequest.Natives>() { // da classe: org.chromium.net.impl.CronetUrlRequestJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(CronetUrlRequest.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            CronetUrlRequestJni.testInstance = instance;
        }
    };
    private static CronetUrlRequest.Natives testInstance;

    CronetUrlRequestJni() {
    }

    @Override // org.chromium.net.impl.CronetUrlRequest.Natives
    public boolean addRequestHeader(long nativePtr, CronetUrlRequest caller, String name, String value) {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequest_addRequestHeader(nativePtr, caller, name, value);
    }

    @Override // org.chromium.net.impl.CronetUrlRequest.Natives
    public long createRequestAdapter(CronetUrlRequest caller, long urlRequestContextAdapter, String url, int priority, boolean disableCache, boolean disableConnectionMigration, boolean trafficStatsTagSet, int trafficStatsTag, boolean trafficStatsUidSet, int trafficStatsUid, int idempotency, long networkHandle) {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequest_createRequestAdapter(caller, urlRequestContextAdapter, url, priority, disableCache, disableConnectionMigration, trafficStatsTagSet, trafficStatsTag, trafficStatsUidSet, trafficStatsUid, idempotency, networkHandle);
    }

    @Override // org.chromium.net.impl.CronetUrlRequest.Natives
    public void destroy(long nativePtr, CronetUrlRequest caller, boolean sendOnCanceled) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequest_destroy(nativePtr, caller, sendOnCanceled);
    }

    @Override // org.chromium.net.impl.CronetUrlRequest.Natives
    public void followDeferredRedirect(long nativePtr, CronetUrlRequest caller) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequest_followDeferredRedirect(nativePtr, caller);
    }

    @Override // org.chromium.net.impl.CronetUrlRequest.Natives
    public void getStatus(long nativePtr, CronetUrlRequest caller, VersionSafeCallbacks.UrlRequestStatusListener listener) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequest_getStatus(nativePtr, caller, listener);
    }

    @Override // org.chromium.net.impl.CronetUrlRequest.Natives
    public boolean readData(long nativePtr, CronetUrlRequest caller, ByteBuffer byteBuffer, int position, int capacity) {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequest_readData(nativePtr, caller, byteBuffer, position, capacity);
    }

    @Override // org.chromium.net.impl.CronetUrlRequest.Natives
    public boolean setHttpMethod(long nativePtr, CronetUrlRequest caller, String method) {
        return GEN_JNI.org_chromium_net_impl_CronetUrlRequest_setHttpMethod(nativePtr, caller, method);
    }

    @Override // org.chromium.net.impl.CronetUrlRequest.Natives
    public void start(long nativePtr, CronetUrlRequest caller) {
        GEN_JNI.org_chromium_net_impl_CronetUrlRequest_start(nativePtr, caller);
    }

    public static CronetUrlRequest.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of CronetUrlRequest.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new CronetUrlRequestJni();
    }
}
