package androidx.camera.camera2.internal.compat.workaround;

import android.hardware.camera2.CameraCharacteristics;

/* carregado de: classes.dex */
public interface CameraCharacteristicsProvider {
    <T> T get(CameraCharacteristics.Key<T> key);
}
