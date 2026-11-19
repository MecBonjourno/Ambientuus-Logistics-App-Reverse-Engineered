package androidx.camera.camera2.internal.compat.quirk;

import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.quirk.CaptureIntentPreviewQuirk;

/* carregado de: classes.dex */
public class TemporalNoiseQuirk implements CaptureIntentPreviewQuirk {
    @Override // androidx.camera.camera2.internal.compat.quirk.CaptureIntentPreviewQuirk
    public /* sintético */ boolean workaroundByCaptureIntentPreview() {
        return CaptureIntentPreviewQuirk.CC.$default$workaroundByCaptureIntentPreview(this);
    }

    static boolean load(CameraCharacteristicsCompat cameraCharacteristics) {
        return isPixel8() && ((Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING)).intValue() == 0;
    }

    private static boolean isPixel8() {
        return "Pixel 8".equalsIgnoreCase(Build.MODEL);
    }
}
