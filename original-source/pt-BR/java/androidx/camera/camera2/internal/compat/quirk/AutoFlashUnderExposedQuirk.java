package androidx.camera.camera2.internal.compat.quirk;

import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.impl.Quirk;

/* carregado de: classes.dex */
public class AutoFlashUnderExposedQuirk implements Quirk {
    static boolean load(CameraCharacteristicsCompat cameraCharacteristics) {
        return false;
    }
}
