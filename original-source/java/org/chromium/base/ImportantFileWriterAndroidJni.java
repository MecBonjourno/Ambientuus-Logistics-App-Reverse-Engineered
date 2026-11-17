package org.chromium.base;

import org.chromium.base.ImportantFileWriterAndroid;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class ImportantFileWriterAndroidJni implements ImportantFileWriterAndroid.Natives {
    public static final JniStaticTestMocker<ImportantFileWriterAndroid.Natives> TEST_HOOKS = new JniStaticTestMocker<ImportantFileWriterAndroid.Natives>() { // from class: org.chromium.base.ImportantFileWriterAndroidJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(ImportantFileWriterAndroid.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            ImportantFileWriterAndroidJni.testInstance = instance;
        }
    };
    private static ImportantFileWriterAndroid.Natives testInstance;

    ImportantFileWriterAndroidJni() {
    }

    @Override // org.chromium.base.ImportantFileWriterAndroid.Natives
    public boolean writeFileAtomically(String fileName, byte[] data) {
        return GEN_JNI.org_chromium_base_ImportantFileWriterAndroid_writeFileAtomically(fileName, data);
    }

    public static ImportantFileWriterAndroid.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of ImportantFileWriterAndroid.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new ImportantFileWriterAndroidJni();
    }
}
