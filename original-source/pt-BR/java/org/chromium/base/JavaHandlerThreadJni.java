package org.chromium.base;

import org.chromium.base.JavaHandlerThread;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* carregado de: classes17.dex */
class JavaHandlerThreadJni implements JavaHandlerThread.Natives {
    public static final JniStaticTestMocker<JavaHandlerThread.Natives> TEST_HOOKS = new JniStaticTestMocker<JavaHandlerThread.Natives>() { // da classe: org.chromium.base.JavaHandlerThreadJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(JavaHandlerThread.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            JavaHandlerThreadJni.testInstance = instance;
        }
    };
    private static JavaHandlerThread.Natives testInstance;

    JavaHandlerThreadJni() {
    }

    @Override // org.chromium.base.JavaHandlerThread.Natives
    public void initializeThread(long nativeJavaHandlerThread, long nativeEvent) {
        GEN_JNI.org_chromium_base_JavaHandlerThread_initializeThread(nativeJavaHandlerThread, nativeEvent);
    }

    @Override // org.chromium.base.JavaHandlerThread.Natives
    public void onLooperStopped(long nativeJavaHandlerThread) {
        GEN_JNI.org_chromium_base_JavaHandlerThread_onLooperStopped(nativeJavaHandlerThread);
    }

    public static JavaHandlerThread.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of JavaHandlerThread.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new JavaHandlerThreadJni();
    }
}
