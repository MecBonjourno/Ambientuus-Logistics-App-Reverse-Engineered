package androidx.camera.core.impl;

import android.content.Context;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.CameraXConfig;
import androidx.camera.core.InitializationException;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.internal.StreamSpecsCalculator;
import java.util.List;
import java.util.Set;

/* carregado de: classes.dex */
public interface CameraFactory extends CameraPresenceMonitor {

    public interface Provider {
        CameraFactory newInstance(Context context, CameraThreadConfig cameraThreadConfig, CameraSelector cameraSelector, long j, CameraXConfig cameraXConfig, StreamSpecsCalculator streamSpecsCalculator) throws InitializationException;
    }

    Set<String> getAvailableCameraIds();

    CameraInternal getCamera(String str) throws CameraUnavailableException;

    CameraCoordinator getCameraCoordinator();

    Object getCameraManager();

    Observable<List<CameraIdentifier>> getCameraPresenceSource();

    void shutdown();

    /* renomeado de: androidx.camera.core.impl.CameraFactory$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$shutdown(CameraFactory _this) {
        }
    }
}
