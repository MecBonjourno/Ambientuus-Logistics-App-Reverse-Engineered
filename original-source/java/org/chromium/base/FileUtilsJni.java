package org.chromium.base;

import org.chromium.base.FileUtils;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
public class FileUtilsJni implements FileUtils.Natives {
    public static final JniStaticTestMocker<FileUtils.Natives> TEST_HOOKS = new JniStaticTestMocker<FileUtils.Natives>() { // from class: org.chromium.base.FileUtilsJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(FileUtils.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            FileUtilsJni.testInstance = instance;
        }
    };
    private static FileUtils.Natives testInstance;

    @Override // org.chromium.base.FileUtils.Natives
    public String getAbsoluteFilePath(String filePath) {
        return GEN_JNI.org_chromium_base_FileUtils_getAbsoluteFilePath(filePath);
    }

    public static FileUtils.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of FileUtils.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new FileUtilsJni();
    }
}
