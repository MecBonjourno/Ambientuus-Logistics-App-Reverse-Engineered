package org.chromium.base;

import org.chromium.base.PowerMonitor;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class PowerMonitorJni implements PowerMonitor.Natives {
    public static final JniStaticTestMocker<PowerMonitor.Natives> TEST_HOOKS = new JniStaticTestMocker<PowerMonitor.Natives>() { // from class: org.chromium.base.PowerMonitorJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(PowerMonitor.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            PowerMonitorJni.testInstance = instance;
        }
    };
    private static PowerMonitor.Natives testInstance;

    PowerMonitorJni() {
    }

    @Override // org.chromium.base.PowerMonitor.Natives
    public void onBatteryChargingChanged() {
        GEN_JNI.org_chromium_base_PowerMonitor_onBatteryChargingChanged();
    }

    @Override // org.chromium.base.PowerMonitor.Natives
    public void onThermalStatusChanged(int thermalStatus) {
        GEN_JNI.org_chromium_base_PowerMonitor_onThermalStatusChanged(thermalStatus);
    }

    public static PowerMonitor.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of PowerMonitor.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new PowerMonitorJni();
    }
}
