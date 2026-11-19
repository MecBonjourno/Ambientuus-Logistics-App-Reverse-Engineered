package androidx.camera.core.internal.compat;

import android.media.ImageWriter;
import android.view.Surface;

/* carregado de: classes.dex */
final class ImageWriterCompatApi29Impl {
    static ImageWriter newInstance(Surface surface, int maxImages, int format) {
        return ImageWriter.newInstance(surface, maxImages, format);
    }

    private ImageWriterCompatApi29Impl() {
    }
}
