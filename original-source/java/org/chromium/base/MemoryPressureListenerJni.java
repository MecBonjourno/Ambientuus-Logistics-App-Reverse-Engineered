package org.chromium.base;

import org.chromium.base.MemoryPressureListener;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class MemoryPressureListenerJni implements MemoryPressureListener.Natives {
    public static final JniStaticTestMocker<MemoryPressureListener.Natives> TEST_HOOKS = new JniStaticTestMocker<MemoryPressureListener.Natives>() { // from class: org.chromium.base.MemoryPressureListenerJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(MemoryPressureListener.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            MemoryPressureListenerJni.testInstance = instance;
        }
    };
    private static MemoryPressureListener.Natives testInstance;

    MemoryPressureListenerJni() {
    }

    @Override // org.chromium.base.MemoryPressureListener.Natives
    public void onMemoryPressure(int pressure) {
        GEN_JNI.org_chromium_base_MemoryPressureListener_onMemoryPressure(pressure);
    }

    public static MemoryPressureListener.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of MemoryPressureListener.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new MemoryPressureListenerJni();
    }
}
