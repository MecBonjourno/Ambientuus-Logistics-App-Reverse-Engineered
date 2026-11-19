package org.chromium.net.impl;

import java.nio.ByteBuffer;
import org.chromium.net.impl.CronetBidirectionalStream;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* carregado de: classes17.dex */
class CronetBidirectionalStreamJni implements CronetBidirectionalStream.Natives {
    public static final JniStaticTestMocker<CronetBidirectionalStream.Natives> TEST_HOOKS = new JniStaticTestMocker<CronetBidirectionalStream.Natives>() { // da classe: org.chromium.net.impl.CronetBidirectionalStreamJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(CronetBidirectionalStream.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            CronetBidirectionalStreamJni.testInstance = instance;
        }
    };
    private static CronetBidirectionalStream.Natives testInstance;

    CronetBidirectionalStreamJni() {
    }

    @Override // org.chromium.net.impl.CronetBidirectionalStream.Natives
    public long createBidirectionalStream(CronetBidirectionalStream caller, long urlRequestContextAdapter, boolean sendRequestHeadersAutomatically, boolean trafficStatsTagSet, int trafficStatsTag, boolean trafficStatsUidSet, int trafficStatsUid, long networkHandle) {
        return GEN_JNI.org_chromium_net_impl_CronetBidirectionalStream_createBidirectionalStream(caller, urlRequestContextAdapter, sendRequestHeadersAutomatically, trafficStatsTagSet, trafficStatsTag, trafficStatsUidSet, trafficStatsUid, networkHandle);
    }

    @Override // org.chromium.net.impl.CronetBidirectionalStream.Natives
    public void destroy(long nativePtr, CronetBidirectionalStream caller, boolean sendOnCanceled) {
        GEN_JNI.org_chromium_net_impl_CronetBidirectionalStream_destroy(nativePtr, caller, sendOnCanceled);
    }

    @Override // org.chromium.net.impl.CronetBidirectionalStream.Natives
    public boolean readData(long nativePtr, CronetBidirectionalStream caller, ByteBuffer byteBuffer, int position, int limit) {
        return GEN_JNI.org_chromium_net_impl_CronetBidirectionalStream_readData(nativePtr, caller, byteBuffer, position, limit);
    }

    @Override // org.chromium.net.impl.CronetBidirectionalStream.Natives
    public void sendRequestHeaders(long nativePtr, CronetBidirectionalStream caller) {
        GEN_JNI.org_chromium_net_impl_CronetBidirectionalStream_sendRequestHeaders(nativePtr, caller);
    }

    @Override // org.chromium.net.impl.CronetBidirectionalStream.Natives
    public int start(long nativePtr, CronetBidirectionalStream caller, String url, int priority, String method, String[] headers, boolean endOfStream) {
        return GEN_JNI.org_chromium_net_impl_CronetBidirectionalStream_start(nativePtr, caller, url, priority, method, headers, endOfStream);
    }

    @Override // org.chromium.net.impl.CronetBidirectionalStream.Natives
    public boolean writevData(long nativePtr, CronetBidirectionalStream caller, ByteBuffer[] buffers, int[] positions, int[] limits, boolean endOfStream) {
        return GEN_JNI.org_chromium_net_impl_CronetBidirectionalStream_writevData(nativePtr, caller, buffers, positions, limits, endOfStream);
    }

    public static CronetBidirectionalStream.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of CronetBidirectionalStream.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new CronetBidirectionalStreamJni();
    }
}
