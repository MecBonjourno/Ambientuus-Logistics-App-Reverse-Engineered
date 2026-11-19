package androidx.camera.core.impl;

import android.os.Handler;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public abstract class CameraThreadConfig {
    public abstract Executor getCameraExecutor();

    public abstract Handler getSchedulerHandler();

    public static CameraThreadConfig create(Executor cameraExecutor, Handler schedulerHandler) {
        return new AutoValue_CameraThreadConfig(cameraExecutor, schedulerHandler);
    }
}
