package androidx.camera.core.processing.util;

import android.opengl.EGLSurface;

/* carregado de: classes.dex */
public abstract class OutputSurface {
    public abstract EGLSurface getEglSurface();

    public abstract int getHeight();

    public abstract int getWidth();

    public static OutputSurface of(EGLSurface eglSurface, int width, int height) {
        return new AutoValue_OutputSurface(eglSurface, width, height);
    }
}
