package androidx.camera.core;

import java.util.Set;

/* carregado de: classes.dex */
public interface ImageCaptureCapabilities {
    Set<Integer> getSupportedOutputFormats();

    boolean isCaptureProcessProgressSupported();

    boolean isPostviewSupported();
}
