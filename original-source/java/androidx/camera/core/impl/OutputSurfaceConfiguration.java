package androidx.camera.core.impl;

/* loaded from: classes.dex */
public abstract class OutputSurfaceConfiguration {
    public abstract OutputSurface getImageAnalysisOutputSurface();

    public abstract OutputSurface getImageCaptureOutputSurface();

    public abstract OutputSurface getPostviewOutputSurface();

    public abstract OutputSurface getPreviewOutputSurface();

    public static OutputSurfaceConfiguration create(OutputSurface previewOutputSurface, OutputSurface imageCaptureOutputSurface, OutputSurface imageAnalysisOutputSurface, OutputSurface postviewOutputSurface) {
        return new AutoValue_OutputSurfaceConfiguration(previewOutputSurface, imageCaptureOutputSurface, imageAnalysisOutputSurface, postviewOutputSurface);
    }
}
