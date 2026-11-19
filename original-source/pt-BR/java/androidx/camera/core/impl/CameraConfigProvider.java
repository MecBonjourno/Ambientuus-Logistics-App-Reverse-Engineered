package androidx.camera.core.impl;

import android.content.Context;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.impl.CameraConfigProvider;

/* carregado de: classes.dex */
public interface CameraConfigProvider {
    public static final CameraConfigProvider EMPTY = new CameraConfigProvider() { // da classe: androidx.camera.core.impl.CameraConfigProvider$$ExternalSyntheticLambda0
        @Override // androidx.camera.core.impl.CameraConfigProvider
        public final CameraConfig getConfig(CameraInfo cameraInfo, Context context) {
            return CameraConfigProvider.CC.lambda$static$0(cameraInfo, context);
        }
    };

    CameraConfig getConfig(CameraInfo cameraInfo, Context context);

    /* renomeado de: androidx.camera.core.impl.CameraConfigProvider$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        static {
            CameraConfigProvider cameraConfigProvider = CameraConfigProvider.EMPTY;
        }

        public static /* sintético */ CameraConfig lambda$static$0(CameraInfo cameraInfo, Context context) {
            return null;
        }
    }
}
