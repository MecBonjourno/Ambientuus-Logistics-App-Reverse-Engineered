package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;

/* loaded from: classes.dex */
public final class VideoStabilizationUtil {
    private VideoStabilizationUtil() {
    }

    public static boolean isPreviewStabilizationSupported(CameraCharacteristicsCompat characteristicsCompat) {
        int[] availableVideoStabilizationModes;
        if (Build.VERSION.SDK_INT < 33 || (availableVideoStabilizationModes = (int[]) characteristicsCompat.get(CameraCharacteristics.CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES)) == null || availableVideoStabilizationModes.length == 0) {
            return false;
        }
        for (int mode : availableVideoStabilizationModes) {
            if (mode == 2) {
                return true;
            }
        }
        return false;
    }
}
