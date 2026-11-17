package org.chromium.base;

import org.chromium.base.FieldTrialList;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class FieldTrialListJni implements FieldTrialList.Natives {
    public static final JniStaticTestMocker<FieldTrialList.Natives> TEST_HOOKS = new JniStaticTestMocker<FieldTrialList.Natives>() { // from class: org.chromium.base.FieldTrialListJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(FieldTrialList.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            FieldTrialListJni.testInstance = instance;
        }
    };
    private static FieldTrialList.Natives testInstance;

    FieldTrialListJni() {
    }

    @Override // org.chromium.base.FieldTrialList.Natives
    public boolean createFieldTrial(String trialName, String groupName) {
        return GEN_JNI.org_chromium_base_FieldTrialList_createFieldTrial(trialName, groupName);
    }

    @Override // org.chromium.base.FieldTrialList.Natives
    public String findFullName(String trialName) {
        return GEN_JNI.org_chromium_base_FieldTrialList_findFullName(trialName);
    }

    @Override // org.chromium.base.FieldTrialList.Natives
    public String getVariationParameter(String trialName, String parameterKey) {
        return GEN_JNI.org_chromium_base_FieldTrialList_getVariationParameter(trialName, parameterKey);
    }

    @Override // org.chromium.base.FieldTrialList.Natives
    public void logActiveTrials() {
        GEN_JNI.org_chromium_base_FieldTrialList_logActiveTrials();
    }

    @Override // org.chromium.base.FieldTrialList.Natives
    public boolean trialExists(String trialName) {
        return GEN_JNI.org_chromium_base_FieldTrialList_trialExists(trialName);
    }

    public static FieldTrialList.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of FieldTrialList.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new FieldTrialListJni();
    }
}
