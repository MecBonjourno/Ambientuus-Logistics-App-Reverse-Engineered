package me.dm7.barcodescanner.core;

import android.hardware.Camera;
import java.util.List;
import kotlinx.coroutines.DebugKt;

/* carregado de: classes17.dex */
public class CameraUtils {
    public static Camera getCameraInstance() {
        return getCameraInstance(-1);
    }

    public static Camera getCameraInstance(int cameraId) {
        Camera c = null;
        try {
            if (cameraId == -1) {
                c = Camera.open();
            } else {
                Camera c2 = Camera.open(cameraId);
                c = c2;
            }
        } catch (Exception e) {
        }
        return c;
    }

    public static boolean isFlashSupported(Camera camera) {
        List<String> supportedFlashModes;
        if (camera == null) {
            return false;
        }
        Camera.Parameters parameters = camera.getParameters();
        return (parameters.getFlashMode() == null || (supportedFlashModes = parameters.getSupportedFlashModes()) == null || supportedFlashModes.isEmpty() || (supportedFlashModes.size() == 1 && supportedFlashModes.get(0).equals(DebugKt.DEBUG_PROPERTY_VALUE_OFF))) ? false : true;
    }
}
