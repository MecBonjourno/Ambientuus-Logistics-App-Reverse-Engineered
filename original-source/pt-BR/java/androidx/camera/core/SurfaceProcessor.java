package androidx.camera.core;

/* carregado de: classes.dex */
public interface SurfaceProcessor {
    void onInputSurface(SurfaceRequest surfaceRequest) throws ProcessingException;

    void onOutputSurface(SurfaceOutput surfaceOutput) throws ProcessingException;
}
