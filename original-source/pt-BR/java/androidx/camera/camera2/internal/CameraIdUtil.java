package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.core.InitializationException;

/* carregado de: classes.dex */
public final class CameraIdUtil {
    private CameraIdUtil() {
    }

    public static boolean isBackwardCompatible(CameraManagerCompat cameraManagerCompat, String cameraId) throws InitializationException {
        if ("robolectric".equals(Build.FINGERPRINT)) {
            return true;
        }
        try {
            int[] availableCapabilities = (int[]) cameraManagerCompat.getCameraCharacteristicsCompat(cameraId).get(CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES);
            if (availableCapabilities != null) {
                for (int capability : availableCapabilities) {
                    if (capability == 0) {
                        return true;
                    }
                }
            }
            return false;
        } catch (CameraAccessExceptionCompat e) {
            throw new InitializationException(CameraUnavailableExceptionHelper.createFrom(e));
        }
    }
}
