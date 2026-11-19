package androidx.camera.core.processing;

import androidx.camera.core.SurfaceProcessor;
import com.google.common.util.concurrent.ListenableFuture;

/* carregado de: classes.dex */
public interface SurfaceProcessorInternal extends SurfaceProcessor {
    void release();

    ListenableFuture<Void> snapshot(int i, int i2);

    /* renomeado de: androidx.camera.core.processing.SurfaceProcessorInternal$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }
}
