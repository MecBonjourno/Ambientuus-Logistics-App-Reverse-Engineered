package androidx.camera.camera2.internal.compat.quirk;

import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.impl.Quirk;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/* carregado de: classes.dex */
public class TorchFlashRequiredFor3aUpdateQuirk implements Quirk {
    private static final List<String> AFFECTED_PIXEL_MODELS = Arrays.asList("PIXEL 6A", "PIXEL 6 PRO", "PIXEL 7", "PIXEL 7A", "PIXEL 7 PRO", "PIXEL 8", "PIXEL 8 PRO");
    private final CameraCharacteristicsCompat mCameraCharacteristics;

    public TorchFlashRequiredFor3aUpdateQuirk(CameraCharacteristicsCompat cameraCharacteristics) {
        this.mCameraCharacteristics = cameraCharacteristics;
    }

    static boolean load(CameraCharacteristicsCompat cameraCharacteristics) {
        return isAffectedModel(cameraCharacteristics);
    }

    public boolean isFlashModeTorchRequired() {
        return !isExternalFlashAeModeSupported(this.mCameraCharacteristics);
    }

    private static boolean isAffectedModel(CameraCharacteristicsCompat cameraCharacteristics) {
        return isAffectedPixelModel() && isFrontCamera(cameraCharacteristics);
    }

    private static boolean isAffectedPixelModel() {
        for (String model : AFFECTED_PIXEL_MODELS) {
            if (Build.MODEL.toUpperCase(Locale.US).equals(model)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isFrontCamera(CameraCharacteristicsCompat cameraCharacteristics) {
        return ((Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING)).intValue() == 0;
    }

    private static boolean isExternalFlashAeModeSupported(CameraCharacteristicsCompat cameraCharacteristics) {
        return Build.VERSION.SDK_INT >= 28 && Camera2CameraControlImpl.getSupportedAeMode(cameraCharacteristics, 5) == 5;
    }
}
