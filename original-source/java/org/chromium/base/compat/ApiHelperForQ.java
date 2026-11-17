package org.chromium.base.compat;

import android.app.Notification;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.hardware.biometrics.BiometricManager;
import android.net.NetworkCapabilities;
import android.net.TransportInfo;
import android.net.Uri;
import android.os.FileUtils;
import android.os.PowerManager;
import android.provider.MediaStore;
import android.telephony.CellInfo;
import android.telephony.TelephonyManager;
import android.view.MotionEvent;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import org.chromium.base.Callback;
import org.chromium.base.task.AsyncTask;

/* loaded from: classes17.dex */
public final class ApiHelperForQ {
    private ApiHelperForQ() {
    }

    public static void requestCellInfoUpdate(TelephonyManager telephonyManager, final Callback<List<CellInfo>> callback) {
        telephonyManager.requestCellInfoUpdate(AsyncTask.THREAD_POOL_EXECUTOR, new TelephonyManager.CellInfoCallback() { // from class: org.chromium.base.compat.ApiHelperForQ.1
            @Override // android.telephony.TelephonyManager.CellInfoCallback
            public void onCellInfo(List<CellInfo> cellInfos) {
                Callback.this.onResult(cellInfos);
            }
        });
    }

    public static boolean bindIsolatedService(Context context, Intent intent, int flags, String instanceName, Executor executor, ServiceConnection connection) {
        return context.bindIsolatedService(intent, flags, instanceName, executor, connection);
    }

    public static void updateServiceGroup(Context context, ServiceConnection connection, int group, int importance) {
        context.updateServiceGroup(connection, group, importance);
    }

    public static int getClassification(MotionEvent event) {
        return event.getClassification();
    }

    public static BiometricManager getBiometricManagerSystemService(Context context) {
        return (BiometricManager) context.getSystemService(BiometricManager.class);
    }

    public static void startForeground(Service service, int id, Notification notification, int foregroundServiceType) {
        service.startForeground(id, notification, foregroundServiceType);
    }

    public static long copy(InputStream in, OutputStream out) throws IOException {
        return FileUtils.copy(in, out);
    }

    public static Uri setIncludePending(Uri uri) {
        return MediaStore.setIncludePending(uri);
    }

    public static Set<String> getExternalVolumeNames(Context context) {
        return MediaStore.getExternalVolumeNames(context);
    }

    public static int canAuthenticate(BiometricManager manager) {
        return manager.canAuthenticate();
    }

    public static TransportInfo getTransportInfo(NetworkCapabilities networkCapabilities) {
        return networkCapabilities.getTransportInfo();
    }

    public static int getCurrentThermalStatus(PowerManager powerManager) {
        return powerManager.getCurrentThermalStatus();
    }
}
