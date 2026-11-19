package androidx.camera.core.processing;

import androidx.camera.core.ImageCaptureException;

/* carregado de: classes.dex */
public interface Operation<I, O> {
    O apply(I i) throws ImageCaptureException;
}
