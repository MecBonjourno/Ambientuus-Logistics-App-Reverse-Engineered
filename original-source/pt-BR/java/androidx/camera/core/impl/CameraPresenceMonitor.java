package androidx.camera.core.impl;

import androidx.camera.core.InitializationException;
import java.util.List;

/* carregado de: classes.dex */
public interface CameraPresenceMonitor {
    void onCameraIdsUpdated(List<String> list) throws InitializationException;
}
