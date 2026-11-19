package androidx.camera.core.internal.compat.quirk;

import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.Quirks;

/* carregado de: classes.dex */
public interface SurfaceProcessingQuirk extends Quirk {
    boolean workaroundBySurfaceProcessing();

    /* renomeado de: androidx.camera.core.internal.compat.quirk.SurfaceProcessingQuirk$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static boolean $default$workaroundBySurfaceProcessing(SurfaceProcessingQuirk _this) {
            return true;
        }

        public static boolean workaroundBySurfaceProcessing(Quirks quirks) {
            for (SurfaceProcessingQuirk quirk : quirks.getAll(SurfaceProcessingQuirk.class)) {
                if (quirk.workaroundBySurfaceProcessing()) {
                    return true;
                }
            }
            return false;
        }
    }
}
