package org.chromium.base;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.PowerManager;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.compat.ApiHelperForQ;

@JNINamespace("base::android")
/* loaded from: classes17.dex */
public class PowerMonitor {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static PowerMonitor sInstance;
    private boolean mIsBatteryPower;

    interface Natives {
        void onBatteryChargingChanged();

        void onThermalStatusChanged(int i);
    }

    public static void createForTests() {
        sInstance = new PowerMonitor();
    }

    public static void create() {
        PowerManager powerManager;
        ThreadUtils.assertOnUiThread();
        if (sInstance != null) {
            return;
        }
        Context context = ContextUtils.getApplicationContext();
        sInstance = new PowerMonitor();
        IntentFilter ifilter = new IntentFilter("android.intent.action.BATTERY_CHANGED");
        Intent batteryStatusIntent = ContextUtils.registerProtectedBroadcastReceiver(context, null, ifilter);
        if (batteryStatusIntent != null) {
            int chargePlug = batteryStatusIntent.getIntExtra("plugged", 0);
            onBatteryChargingChanged(chargePlug == 0);
        }
        IntentFilter powerConnectedFilter = new IntentFilter();
        powerConnectedFilter.addAction("android.intent.action.ACTION_POWER_CONNECTED");
        powerConnectedFilter.addAction("android.intent.action.ACTION_POWER_DISCONNECTED");
        ContextUtils.registerProtectedBroadcastReceiver(context, new BroadcastReceiver() { // from class: org.chromium.base.PowerMonitor.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                PowerMonitor.onBatteryChargingChanged(intent.getAction().equals("android.intent.action.ACTION_POWER_DISCONNECTED"));
            }
        }, powerConnectedFilter);
        if (Build.VERSION.SDK_INT >= 29 && (powerManager = (PowerManager) context.getSystemService("power")) != null) {
            PowerMonitorForQ.addThermalStatusListener(powerManager);
        }
    }

    private PowerMonitor() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void onBatteryChargingChanged(boolean isBatteryPower) {
        if (sInstance == null) {
            throw new AssertionError();
        }
        sInstance.mIsBatteryPower = isBatteryPower;
        PowerMonitorJni.get().onBatteryChargingChanged();
    }

    private static boolean isBatteryPower() {
        if (sInstance == null) {
            create();
        }
        return sInstance.mIsBatteryPower;
    }

    private static int getRemainingBatteryCapacity() {
        if (sInstance == null) {
            create();
        }
        return getRemainingBatteryCapacityImpl();
    }

    private static int getRemainingBatteryCapacityImpl() {
        return ((BatteryManager) ContextUtils.getApplicationContext().getSystemService("batterymanager")).getIntProperty(1);
    }

    private static int getCurrentThermalStatus() {
        if (Build.VERSION.SDK_INT < 29) {
            return -1;
        }
        if (sInstance == null) {
            create();
        }
        PowerManager powerManager = (PowerManager) ContextUtils.getApplicationContext().getSystemService("power");
        if (powerManager == null) {
            return -1;
        }
        return ApiHelperForQ.getCurrentThermalStatus(powerManager);
    }
}
