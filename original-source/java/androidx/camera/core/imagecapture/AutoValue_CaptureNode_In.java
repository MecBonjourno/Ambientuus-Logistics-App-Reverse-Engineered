package androidx.camera.core.imagecapture;

import android.util.Size;
import androidx.camera.core.ImageReaderProxyProvider;
import androidx.camera.core.imagecapture.CaptureNode;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.processing.Edge;
import java.util.List;

/* loaded from: classes.dex */
final class AutoValue_CaptureNode_In extends CaptureNode.In {
    private final Edge<TakePictureManager.CaptureError> errorEdge;
    private final ImageReaderProxyProvider imageReaderProxyProvider;
    private final int inputFormat;
    private final List<Integer> outputFormats;
    private final PostviewSettings postviewSettings;
    private final Edge<ProcessingRequest> requestEdge;
    private final Size size;
    private final boolean virtualCamera;

    AutoValue_CaptureNode_In(Size size, int inputFormat, List<Integer> outputFormats, boolean virtualCamera, ImageReaderProxyProvider imageReaderProxyProvider, PostviewSettings postviewSettings, Edge<ProcessingRequest> requestEdge, Edge<TakePictureManager.CaptureError> errorEdge) {
        if (size == null) {
            throw new NullPointerException("Null size");
        }
        this.size = size;
        this.inputFormat = inputFormat;
        if (outputFormats == null) {
            throw new NullPointerException("Null outputFormats");
        }
        this.outputFormats = outputFormats;
        this.virtualCamera = virtualCamera;
        this.imageReaderProxyProvider = imageReaderProxyProvider;
        this.postviewSettings = postviewSettings;
        if (requestEdge == null) {
            throw new NullPointerException("Null requestEdge");
        }
        this.requestEdge = requestEdge;
        if (errorEdge == null) {
            throw new NullPointerException("Null errorEdge");
        }
        this.errorEdge = errorEdge;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    Size getSize() {
        return this.size;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    int getInputFormat() {
        return this.inputFormat;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    List<Integer> getOutputFormats() {
        return this.outputFormats;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    boolean isVirtualCamera() {
        return this.virtualCamera;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    ImageReaderProxyProvider getImageReaderProxyProvider() {
        return this.imageReaderProxyProvider;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    PostviewSettings getPostviewSettings() {
        return this.postviewSettings;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    Edge<ProcessingRequest> getRequestEdge() {
        return this.requestEdge;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    Edge<TakePictureManager.CaptureError> getErrorEdge() {
        return this.errorEdge;
    }

    public String toString() {
        return "In{size=" + this.size + ", inputFormat=" + this.inputFormat + ", outputFormats=" + this.outputFormats + ", virtualCamera=" + this.virtualCamera + ", imageReaderProxyProvider=" + this.imageReaderProxyProvider + ", postviewSettings=" + this.postviewSettings + ", requestEdge=" + this.requestEdge + ", errorEdge=" + this.errorEdge + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof CaptureNode.In)) {
            return false;
        }
        CaptureNode.In that = (CaptureNode.In) o;
        return this.size.equals(that.getSize()) && this.inputFormat == that.getInputFormat() && this.outputFormats.equals(that.getOutputFormats()) && this.virtualCamera == that.isVirtualCamera() && (this.imageReaderProxyProvider != null ? this.imageReaderProxyProvider.equals(that.getImageReaderProxyProvider()) : that.getImageReaderProxyProvider() == null) && (this.postviewSettings != null ? this.postviewSettings.equals(that.getPostviewSettings()) : that.getPostviewSettings() == null) && this.requestEdge.equals(that.getRequestEdge()) && this.errorEdge.equals(that.getErrorEdge());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((h$ ^ this.size.hashCode()) * 1000003) ^ this.inputFormat) * 1000003) ^ this.outputFormats.hashCode()) * 1000003) ^ (this.virtualCamera ? 1231 : 1237)) * 1000003) ^ (this.imageReaderProxyProvider == null ? 0 : this.imageReaderProxyProvider.hashCode())) * 1000003) ^ (this.postviewSettings != null ? this.postviewSettings.hashCode() : 0)) * 1000003) ^ this.requestEdge.hashCode()) * 1000003) ^ this.errorEdge.hashCode();
    }
}
