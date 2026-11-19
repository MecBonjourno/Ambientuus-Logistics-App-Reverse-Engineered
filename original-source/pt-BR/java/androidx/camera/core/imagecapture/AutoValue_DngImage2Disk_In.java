package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.DngImage2Disk;

/* carregado de: classes.dex */
final class AutoValue_DngImage2Disk_In extends DngImage2Disk.In {
    private final ImageProxy imageProxy;
    private final ImageCapture.OutputFileOptions outputFileOptions;
    private final int rotationDegrees;

    AutoValue_DngImage2Disk_In(ImageProxy imageProxy, int rotationDegrees, ImageCapture.OutputFileOptions outputFileOptions) {
        if (imageProxy == null) {
            throw new NullPointerException("Null imageProxy");
        }
        this.imageProxy = imageProxy;
        this.rotationDegrees = rotationDegrees;
        if (outputFileOptions == null) {
            throw new NullPointerException("Null outputFileOptions");
        }
        this.outputFileOptions = outputFileOptions;
    }

    @Override // androidx.camera.core.imagecapture.DngImage2Disk.In
    ImageProxy getImageProxy() {
        return this.imageProxy;
    }

    @Override // androidx.camera.core.imagecapture.DngImage2Disk.In
    int getRotationDegrees() {
        return this.rotationDegrees;
    }

    @Override // androidx.camera.core.imagecapture.DngImage2Disk.In
    ImageCapture.OutputFileOptions getOutputFileOptions() {
        return this.outputFileOptions;
    }

    public String toString() {
        return "In{imageProxy=" + this.imageProxy + ", rotationDegrees=" + this.rotationDegrees + ", outputFileOptions=" + this.outputFileOptions + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof DngImage2Disk.In)) {
            return false;
        }
        DngImage2Disk.In that = (DngImage2Disk.In) o;
        return this.imageProxy.equals(that.getImageProxy()) && this.rotationDegrees == that.getRotationDegrees() && this.outputFileOptions.equals(that.getOutputFileOptions());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.imageProxy.hashCode()) * 1000003) ^ this.rotationDegrees) * 1000003) ^ this.outputFileOptions.hashCode();
    }
}
