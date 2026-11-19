package androidx.camera.core.impl;

/* carregado de: classes.dex */
final class AutoValue_OutputSurfaceConfiguration extends OutputSurfaceConfiguration {
    private final OutputSurface imageAnalysisOutputSurface;
    private final OutputSurface imageCaptureOutputSurface;
    private final OutputSurface postviewOutputSurface;
    private final OutputSurface previewOutputSurface;

    AutoValue_OutputSurfaceConfiguration(OutputSurface previewOutputSurface, OutputSurface imageCaptureOutputSurface, OutputSurface imageAnalysisOutputSurface, OutputSurface postviewOutputSurface) {
        if (previewOutputSurface == null) {
            throw new NullPointerException("Null previewOutputSurface");
        }
        this.previewOutputSurface = previewOutputSurface;
        if (imageCaptureOutputSurface == null) {
            throw new NullPointerException("Null imageCaptureOutputSurface");
        }
        this.imageCaptureOutputSurface = imageCaptureOutputSurface;
        this.imageAnalysisOutputSurface = imageAnalysisOutputSurface;
        this.postviewOutputSurface = postviewOutputSurface;
    }

    @Override // androidx.camera.core.impl.OutputSurfaceConfiguration
    public OutputSurface getPreviewOutputSurface() {
        return this.previewOutputSurface;
    }

    @Override // androidx.camera.core.impl.OutputSurfaceConfiguration
    public OutputSurface getImageCaptureOutputSurface() {
        return this.imageCaptureOutputSurface;
    }

    @Override // androidx.camera.core.impl.OutputSurfaceConfiguration
    public OutputSurface getImageAnalysisOutputSurface() {
        return this.imageAnalysisOutputSurface;
    }

    @Override // androidx.camera.core.impl.OutputSurfaceConfiguration
    public OutputSurface getPostviewOutputSurface() {
        return this.postviewOutputSurface;
    }

    public String toString() {
        return "OutputSurfaceConfiguration{previewOutputSurface=" + this.previewOutputSurface + ", imageCaptureOutputSurface=" + this.imageCaptureOutputSurface + ", imageAnalysisOutputSurface=" + this.imageAnalysisOutputSurface + ", postviewOutputSurface=" + this.postviewOutputSurface + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof OutputSurfaceConfiguration)) {
            return false;
        }
        OutputSurfaceConfiguration that = (OutputSurfaceConfiguration) o;
        if (this.previewOutputSurface.equals(that.getPreviewOutputSurface()) && this.imageCaptureOutputSurface.equals(that.getImageCaptureOutputSurface()) && (this.imageAnalysisOutputSurface != null ? this.imageAnalysisOutputSurface.equals(that.getImageAnalysisOutputSurface()) : that.getImageAnalysisOutputSurface() == null)) {
            if (this.postviewOutputSurface == null) {
                if (that.getPostviewOutputSurface() == null) {
                    return true;
                }
            } else if (this.postviewOutputSurface.equals(that.getPostviewOutputSurface())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.previewOutputSurface.hashCode()) * 1000003) ^ this.imageCaptureOutputSurface.hashCode()) * 1000003) ^ (this.imageAnalysisOutputSurface == null ? 0 : this.imageAnalysisOutputSurface.hashCode())) * 1000003) ^ (this.postviewOutputSurface != null ? this.postviewOutputSurface.hashCode() : 0);
    }
}
