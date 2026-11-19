package androidx.camera.core.impl;

import android.util.Size;
import android.view.Surface;

/* carregado de: classes.dex */
public abstract class OutputSurface {
    public abstract int getImageFormat();

    public abstract Size getSize();

    public abstract Surface getSurface();

    public static OutputSurface create(Surface surface, Size size, int imageFormat) {
        return new AutoValue_OutputSurface(surface, size, imageFormat);
    }
}
