package androidx.camera.camera2.internal.compat.quirk;

import android.os.Build;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.impl.Quirk;

/* loaded from: classes.dex */
public class CaptureSessionStuckWhenCreatingBeforeClosingCameraQuirk implements Quirk {
    static boolean load(CameraCharacteristicsCompat characteristicsCompat) {
        return shouldLoadForMotoE20(characteristicsCompat);
    }

    private static boolean shouldLoadForMotoE20(CameraCharacteristicsCompat characteristicsCompat) {
        return "motorola".equalsIgnoreCase(Build.BRAND) && "moto e20".equalsIgnoreCase(Build.MODEL) && characteristicsCompat.getCameraId().equals("1");
    }
}
