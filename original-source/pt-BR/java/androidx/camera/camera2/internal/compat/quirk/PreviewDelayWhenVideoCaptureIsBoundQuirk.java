package androidx.camera.camera2.internal.compat.quirk;

import android.os.Build;
import androidx.camera.camera2.internal.compat.quirk.CaptureIntentPreviewQuirk;
import androidx.camera.core.internal.compat.quirk.SurfaceProcessingQuirk;

/* carregado de: classes.dex */
public class PreviewDelayWhenVideoCaptureIsBoundQuirk implements CaptureIntentPreviewQuirk, SurfaceProcessingQuirk {
    @Override // androidx.camera.camera2.internal.compat.quirk.CaptureIntentPreviewQuirk
    public /* sintético */ boolean workaroundByCaptureIntentPreview() {
        return CaptureIntentPreviewQuirk.CC.$default$workaroundByCaptureIntentPreview(this);
    }

    @Override // androidx.camera.core.internal.compat.quirk.SurfaceProcessingQuirk
    public /* sintético */ boolean workaroundBySurfaceProcessing() {
        return SurfaceProcessingQuirk.CC.$default$workaroundBySurfaceProcessing(this);
    }

    static boolean load() {
        return "Huawei".equalsIgnoreCase(Build.MANUFACTURER);
    }
}
