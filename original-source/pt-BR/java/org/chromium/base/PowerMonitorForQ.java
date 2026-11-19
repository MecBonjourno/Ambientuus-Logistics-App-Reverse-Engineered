package org.chromium.base;

import android.os.PowerManager;

/* carregado de: classes17.dex */
public final class PowerMonitorForQ {
    private PowerMonitorForQ() {
    }

    public static void addThermalStatusListener(PowerManager powerManager) {
        powerManager.addThermalStatusListener(new PowerManager.OnThermalStatusChangedListener() { // da classe: org.chromium.base.PowerMonitorForQ.1
            @Override // android.os.PowerManager.OnThermalStatusChangedListener
            public void onThermalStatusChanged(int status) {
                PowerMonitorJni.get().onThermalStatusChanged(status);
            }
        });
    }
}
