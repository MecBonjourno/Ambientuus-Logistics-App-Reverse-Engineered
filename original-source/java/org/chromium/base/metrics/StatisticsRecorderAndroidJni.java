package org.chromium.base.metrics;

import org.chromium.base.metrics.StatisticsRecorderAndroid;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class StatisticsRecorderAndroidJni implements StatisticsRecorderAndroid.Natives {
    public static final JniStaticTestMocker<StatisticsRecorderAndroid.Natives> TEST_HOOKS = new JniStaticTestMocker<StatisticsRecorderAndroid.Natives>() { // from class: org.chromium.base.metrics.StatisticsRecorderAndroidJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(StatisticsRecorderAndroid.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            StatisticsRecorderAndroidJni.testInstance = instance;
        }
    };
    private static StatisticsRecorderAndroid.Natives testInstance;

    StatisticsRecorderAndroidJni() {
    }

    @Override // org.chromium.base.metrics.StatisticsRecorderAndroid.Natives
    public String toJson(int verbosityLevel) {
        return GEN_JNI.org_chromium_base_metrics_StatisticsRecorderAndroid_toJson(verbosityLevel);
    }

    public static StatisticsRecorderAndroid.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of StatisticsRecorderAndroid.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new StatisticsRecorderAndroidJni();
    }
}
