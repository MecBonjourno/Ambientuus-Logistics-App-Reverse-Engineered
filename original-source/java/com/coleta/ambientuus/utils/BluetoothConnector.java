package com.coleta.ambientuus.utils;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.os.Build;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import java.io.IOException;
import java.util.UUID;

/* loaded from: classes5.dex */
public class BluetoothConnector {

    public interface BluetoothConnectionCallback {
        void onConnected(BluetoothSocket bluetoothSocket);

        void onError(String str);
    }

    public static void connectToDevice(Activity activity, final BluetoothDevice device, final UUID uuid, final BluetoothConnectionCallback callback) {
        if (Build.VERSION.SDK_INT >= 31) {
            Dexter.withActivity(activity).withPermission("android.permission.BLUETOOTH_CONNECT").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.utils.BluetoothConnector.1
                @Override // com.karumi.dexter.listener.single.PermissionListener
                public void onPermissionGranted(PermissionGrantedResponse response) {
                    BluetoothConnector.connect(device, uuid, callback);
                }

                @Override // com.karumi.dexter.listener.single.PermissionListener
                public void onPermissionDenied(PermissionDeniedResponse response) {
                    callback.onError("Permissão BLUETOOTH_CONNECT foi negada.");
                }

                @Override // com.karumi.dexter.listener.single.PermissionListener
                public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                    token.continuePermissionRequest();
                }
            }).check();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void connect(BluetoothDevice device, UUID uuid, BluetoothConnectionCallback callback) {
        try {
            BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
            BluetoothSocket socket = device.createInsecureRfcommSocketToServiceRecord(uuid);
            socket.connect();
            callback.onConnected(socket);
        } catch (IOException e) {
            e.printStackTrace();
            callback.onError("Erro ao conectar: " + e.getMessage());
        }
    }
}
