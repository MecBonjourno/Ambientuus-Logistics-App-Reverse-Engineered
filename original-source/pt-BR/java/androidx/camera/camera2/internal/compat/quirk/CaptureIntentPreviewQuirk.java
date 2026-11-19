package androidx.camera.camera2.internal.compat.quirk;

import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.Quirks;

/* carregado de: classes.dex */
public interface CaptureIntentPreviewQuirk extends Quirk {
    boolean workaroundByCaptureIntentPreview();

    /* renomeado de: androidx.camera.camera2.internal.compat.quirk.CaptureIntentPreviewQuirk$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static boolean $default$workaroundByCaptureIntentPreview(CaptureIntentPreviewQuirk _this) {
            return true;
        }

        public static boolean workaroundByCaptureIntentPreview(Quirks quirks) {
            for (CaptureIntentPreviewQuirk quirk : quirks.getAll(CaptureIntentPreviewQuirk.class)) {
                if (quirk.workaroundByCaptureIntentPreview()) {
                    return true;
                }
            }
            return false;
        }
    }
}
