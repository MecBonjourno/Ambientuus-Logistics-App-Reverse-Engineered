package org.chromium.base;

import org.chromium.base.CommandLine;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class CommandLineJni implements CommandLine.Natives {
    public static final JniStaticTestMocker<CommandLine.Natives> TEST_HOOKS = new JniStaticTestMocker<CommandLine.Natives>() { // from class: org.chromium.base.CommandLineJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(CommandLine.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            CommandLineJni.testInstance = instance;
        }
    };
    private static CommandLine.Natives testInstance;

    CommandLineJni() {
    }

    @Override // org.chromium.base.CommandLine.Natives
    public void appendSwitch(String switchString) {
        GEN_JNI.org_chromium_base_CommandLine_appendSwitch(switchString);
    }

    @Override // org.chromium.base.CommandLine.Natives
    public void appendSwitchWithValue(String switchString, String value) {
        GEN_JNI.org_chromium_base_CommandLine_appendSwitchWithValue(switchString, value);
    }

    @Override // org.chromium.base.CommandLine.Natives
    public void appendSwitchesAndArguments(String[] array) {
        GEN_JNI.org_chromium_base_CommandLine_appendSwitchesAndArguments(array);
    }

    @Override // org.chromium.base.CommandLine.Natives
    public String getSwitchValue(String switchString) {
        return GEN_JNI.org_chromium_base_CommandLine_getSwitchValue(switchString);
    }

    @Override // org.chromium.base.CommandLine.Natives
    public String[] getSwitchesFlattened() {
        return GEN_JNI.org_chromium_base_CommandLine_getSwitchesFlattened();
    }

    @Override // org.chromium.base.CommandLine.Natives
    public boolean hasSwitch(String switchString) {
        return GEN_JNI.org_chromium_base_CommandLine_hasSwitch(switchString);
    }

    @Override // org.chromium.base.CommandLine.Natives
    public void init(String[] args) {
        GEN_JNI.org_chromium_base_CommandLine_init(args);
    }

    @Override // org.chromium.base.CommandLine.Natives
    public void removeSwitch(String switchString) {
        GEN_JNI.org_chromium_base_CommandLine_removeSwitch(switchString);
    }

    public static CommandLine.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of CommandLine.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new CommandLineJni();
    }
}
