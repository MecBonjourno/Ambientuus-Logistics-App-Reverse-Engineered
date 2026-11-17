package org.chromium.net.impl;

import org.chromium.net.impl.CronetUploadDataStream;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class CronetUploadDataStreamJni implements CronetUploadDataStream.Natives {
    public static final JniStaticTestMocker<CronetUploadDataStream.Natives> TEST_HOOKS = new JniStaticTestMocker<CronetUploadDataStream.Natives>() { // from class: org.chromium.net.impl.CronetUploadDataStreamJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(CronetUploadDataStream.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            CronetUploadDataStreamJni.testInstance = instance;
        }
    };
    private static CronetUploadDataStream.Natives testInstance;

    CronetUploadDataStreamJni() {
    }

    @Override // org.chromium.net.impl.CronetUploadDataStream.Natives
    public long attachUploadDataToRequest(CronetUploadDataStream caller, long urlRequestAdapter, long length) {
        return GEN_JNI.org_chromium_net_impl_CronetUploadDataStream_attachUploadDataToRequest(caller, urlRequestAdapter, length);
    }

    @Override // org.chromium.net.impl.CronetUploadDataStream.Natives
    public long createAdapterForTesting(CronetUploadDataStream caller) {
        return GEN_JNI.org_chromium_net_impl_CronetUploadDataStream_createAdapterForTesting(caller);
    }

    @Override // org.chromium.net.impl.CronetUploadDataStream.Natives
    public long createUploadDataStreamForTesting(CronetUploadDataStream caller, long length, long adapter) {
        return GEN_JNI.org_chromium_net_impl_CronetUploadDataStream_createUploadDataStreamForTesting(caller, length, adapter);
    }

    @Override // org.chromium.net.impl.CronetUploadDataStream.Natives
    public void destroy(long nativePtr) {
        GEN_JNI.org_chromium_net_impl_CronetUploadDataStream_destroy(nativePtr);
    }

    @Override // org.chromium.net.impl.CronetUploadDataStream.Natives
    public void onReadSucceeded(long nativePtr, CronetUploadDataStream caller, int bytesRead, boolean finalChunk) {
        GEN_JNI.org_chromium_net_impl_CronetUploadDataStream_onReadSucceeded(nativePtr, caller, bytesRead, finalChunk);
    }

    @Override // org.chromium.net.impl.CronetUploadDataStream.Natives
    public void onRewindSucceeded(long nativePtr, CronetUploadDataStream caller) {
        GEN_JNI.org_chromium_net_impl_CronetUploadDataStream_onRewindSucceeded(nativePtr, caller);
    }

    public static CronetUploadDataStream.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of CronetUploadDataStream.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new CronetUploadDataStreamJni();
    }
}
