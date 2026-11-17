package org.chromium.base;

import org.chromium.base.PathService;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class PathServiceJni implements PathService.Natives {
    public static final JniStaticTestMocker<PathService.Natives> TEST_HOOKS = new JniStaticTestMocker<PathService.Natives>() { // from class: org.chromium.base.PathServiceJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(PathService.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            PathServiceJni.testInstance = instance;
        }
    };
    private static PathService.Natives testInstance;

    PathServiceJni() {
    }

    @Override // org.chromium.base.PathService.Natives
    public void override(int what, String path) {
        GEN_JNI.org_chromium_base_PathService_override(what, path);
    }

    public static PathService.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of PathService.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new PathServiceJni();
    }
}
