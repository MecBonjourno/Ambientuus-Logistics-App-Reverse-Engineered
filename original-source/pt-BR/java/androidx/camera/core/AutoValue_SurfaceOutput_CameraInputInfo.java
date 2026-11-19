package androidx.camera.core;

import android.graphics.Rect;
import android.util.Size;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.impl.CameraInternal;

/* carregado de: classes.dex */
final class AutoValue_SurfaceOutput_CameraInputInfo extends SurfaceOutput.CameraInputInfo {
    private final CameraInternal cameraInternal;
    private final Rect inputCropRect;
    private final Size inputSize;
    private final boolean mirroring;
    private final int rotationDegrees;

    AutoValue_SurfaceOutput_CameraInputInfo(Size inputSize, Rect inputCropRect, CameraInternal cameraInternal, int rotationDegrees, boolean mirroring) {
        if (inputSize == null) {
            throw new NullPointerException("Null inputSize");
        }
        this.inputSize = inputSize;
        if (inputCropRect == null) {
            throw new NullPointerException("Null inputCropRect");
        }
        this.inputCropRect = inputCropRect;
        this.cameraInternal = cameraInternal;
        this.rotationDegrees = rotationDegrees;
        this.mirroring = mirroring;
    }

    @Override // androidx.camera.core.SurfaceOutput.CameraInputInfo
    public Size getInputSize() {
        return this.inputSize;
    }

    @Override // androidx.camera.core.SurfaceOutput.CameraInputInfo
    public Rect getInputCropRect() {
        return this.inputCropRect;
    }

    @Override // androidx.camera.core.SurfaceOutput.CameraInputInfo
    public CameraInternal getCameraInternal() {
        return this.cameraInternal;
    }

    @Override // androidx.camera.core.SurfaceOutput.CameraInputInfo
    public int getRotationDegrees() {
        return this.rotationDegrees;
    }

    @Override // androidx.camera.core.SurfaceOutput.CameraInputInfo
    public boolean getMirroring() {
        return this.mirroring;
    }

    public String toString() {
        return "CameraInputInfo{inputSize=" + this.inputSize + ", inputCropRect=" + this.inputCropRect + ", cameraInternal=" + this.cameraInternal + ", rotationDegrees=" + this.rotationDegrees + ", mirroring=" + this.mirroring + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof SurfaceOutput.CameraInputInfo)) {
            return false;
        }
        SurfaceOutput.CameraInputInfo that = (SurfaceOutput.CameraInputInfo) o;
        return this.inputSize.equals(that.getInputSize()) && this.inputCropRect.equals(that.getInputCropRect()) && (this.cameraInternal != null ? this.cameraInternal.equals(that.getCameraInternal()) : that.getCameraInternal() == null) && this.rotationDegrees == that.getRotationDegrees() && this.mirroring == that.getMirroring();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((h$ ^ this.inputSize.hashCode()) * 1000003) ^ this.inputCropRect.hashCode()) * 1000003) ^ (this.cameraInternal == null ? 0 : this.cameraInternal.hashCode())) * 1000003) ^ this.rotationDegrees) * 1000003) ^ (this.mirroring ? 1231 : 1237);
    }
}
