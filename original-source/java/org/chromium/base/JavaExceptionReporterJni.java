package org.chromium.base;

import org.chromium.base.JavaExceptionReporter;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class JavaExceptionReporterJni implements JavaExceptionReporter.Natives {
    public static final JniStaticTestMocker<JavaExceptionReporter.Natives> TEST_HOOKS = new JniStaticTestMocker<JavaExceptionReporter.Natives>() { // from class: org.chromium.base.JavaExceptionReporterJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(JavaExceptionReporter.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            JavaExceptionReporterJni.testInstance = instance;
        }
    };
    private static JavaExceptionReporter.Natives testInstance;

    JavaExceptionReporterJni() {
    }

    @Override // org.chromium.base.JavaExceptionReporter.Natives
    public void reportJavaException(boolean crashAfterReport, Throwable e) {
        GEN_JNI.org_chromium_base_JavaExceptionReporter_reportJavaException(crashAfterReport, e);
    }

    @Override // org.chromium.base.JavaExceptionReporter.Natives
    public void reportJavaStackTrace(String stackTrace) {
        GEN_JNI.org_chromium_base_JavaExceptionReporter_reportJavaStackTrace(stackTrace);
    }

    public static JavaExceptionReporter.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of JavaExceptionReporter.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new JavaExceptionReporterJni();
    }
}
