package org.chromium.net.impl;

import org.chromium.net.impl.CronetLibraryLoader;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* carregado de: classes17.dex */
class CronetLibraryLoaderJni implements CronetLibraryLoader.Natives {
    public static final JniStaticTestMocker<CronetLibraryLoader.Natives> TEST_HOOKS = new JniStaticTestMocker<CronetLibraryLoader.Natives>() { // da classe: org.chromium.net.impl.CronetLibraryLoaderJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(CronetLibraryLoader.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            CronetLibraryLoaderJni.testInstance = instance;
        }
    };
    private static CronetLibraryLoader.Natives testInstance;

    CronetLibraryLoaderJni() {
    }

    @Override // org.chromium.net.impl.CronetLibraryLoader.Natives
    public void cronetInitOnInitThread() {
        GEN_JNI.org_chromium_net_impl_CronetLibraryLoader_cronetInitOnInitThread();
    }

    @Override // org.chromium.net.impl.CronetLibraryLoader.Natives
    public String getCronetVersion() {
        return GEN_JNI.org_chromium_net_impl_CronetLibraryLoader_getCronetVersion();
    }

    @Override // org.chromium.net.impl.CronetLibraryLoader.Natives
    public void setMinLogLevel(int loggingLevel) {
        GEN_JNI.org_chromium_net_impl_CronetLibraryLoader_setMinLogLevel(loggingLevel);
    }

    public static CronetLibraryLoader.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of CronetLibraryLoader.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new CronetLibraryLoaderJni();
    }
}
