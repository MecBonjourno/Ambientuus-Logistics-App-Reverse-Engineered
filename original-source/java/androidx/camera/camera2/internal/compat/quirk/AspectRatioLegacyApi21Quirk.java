package androidx.camera.camera2.internal.compat.quirk;

import android.hardware.camera2.CameraCharacteristics;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.impl.Quirk;

/* loaded from: classes.dex */
public class AspectRatioLegacyApi21Quirk implements Quirk {
    static boolean load(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        Integer level = (Integer) cameraCharacteristicsCompat.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        if (level == null) {
            return false;
        }
        level.intValue();
        return false;
    }

    public int getCorrectedAspectRatio() {
        return 2;
    }
}
