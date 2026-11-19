package androidx.camera.core;

import java.util.Set;

/* carregado de: classes.dex */
public interface CameraPresenceListener {
    void onCamerasAdded(Set<CameraIdentifier> set);

    void onCamerasRemoved(Set<CameraIdentifier> set);
}
