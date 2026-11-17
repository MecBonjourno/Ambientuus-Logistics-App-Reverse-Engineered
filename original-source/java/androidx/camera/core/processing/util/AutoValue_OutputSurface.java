package androidx.camera.core.processing.util;

import android.opengl.EGLSurface;

/* loaded from: classes.dex */
final class AutoValue_OutputSurface extends OutputSurface {
    private final EGLSurface eglSurface;
    private final int height;
    private final int width;

    AutoValue_OutputSurface(EGLSurface eglSurface, int width, int height) {
        if (eglSurface == null) {
            throw new NullPointerException("Null eglSurface");
        }
        this.eglSurface = eglSurface;
        this.width = width;
        this.height = height;
    }

    @Override // androidx.camera.core.processing.util.OutputSurface
    public EGLSurface getEglSurface() {
        return this.eglSurface;
    }

    @Override // androidx.camera.core.processing.util.OutputSurface
    public int getWidth() {
        return this.width;
    }

    @Override // androidx.camera.core.processing.util.OutputSurface
    public int getHeight() {
        return this.height;
    }

    public String toString() {
        return "OutputSurface{eglSurface=" + this.eglSurface + ", width=" + this.width + ", height=" + this.height + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof OutputSurface)) {
            return false;
        }
        OutputSurface that = (OutputSurface) o;
        return this.eglSurface.equals(that.getEglSurface()) && this.width == that.getWidth() && this.height == that.getHeight();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.eglSurface.hashCode()) * 1000003) ^ this.width) * 1000003) ^ this.height;
    }
}
