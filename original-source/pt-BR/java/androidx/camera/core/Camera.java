package androidx.camera.core;

import androidx.camera.core.impl.CameraConfig;

/* carregado de: classes.dex */
public interface Camera {
    CameraControl getCameraControl();

    CameraInfo getCameraInfo();

    CameraConfig getExtendedConfig();

    boolean isUseCasesCombinationSupported(boolean z, UseCase... useCaseArr);

    boolean isUseCasesCombinationSupported(UseCase... useCaseArr);

    boolean isUseCasesCombinationSupportedByFramework(UseCase... useCaseArr);

    /* renomeado de: androidx.camera.core.Camera$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static boolean $default$isUseCasesCombinationSupported(Camera _this, boolean withStreamSharing, UseCase... useCases) {
            return true;
        }
    }
}
