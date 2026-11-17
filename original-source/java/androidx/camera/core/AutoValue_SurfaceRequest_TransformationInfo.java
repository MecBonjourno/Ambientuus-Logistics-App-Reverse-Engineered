package androidx.camera.core;

import android.graphics.Matrix;
import android.graphics.Rect;
import androidx.camera.core.SurfaceRequest;

/* loaded from: classes.dex */
final class AutoValue_SurfaceRequest_TransformationInfo extends SurfaceRequest.TransformationInfo {
    private final Rect getCropRect;
    private final int getRotationDegrees;
    private final Matrix getSensorToBufferTransform;
    private final int getTargetRotation;
    private final boolean hasCameraTransform;
    private final boolean isMirroring;

    AutoValue_SurfaceRequest_TransformationInfo(Rect getCropRect, int getRotationDegrees, int getTargetRotation, boolean hasCameraTransform, Matrix getSensorToBufferTransform, boolean isMirroring) {
        if (getCropRect == null) {
            throw new NullPointerException("Null getCropRect");
        }
        this.getCropRect = getCropRect;
        this.getRotationDegrees = getRotationDegrees;
        this.getTargetRotation = getTargetRotation;
        this.hasCameraTransform = hasCameraTransform;
        if (getSensorToBufferTransform == null) {
            throw new NullPointerException("Null getSensorToBufferTransform");
        }
        this.getSensorToBufferTransform = getSensorToBufferTransform;
        this.isMirroring = isMirroring;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public Rect getCropRect() {
        return this.getCropRect;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public int getRotationDegrees() {
        return this.getRotationDegrees;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public int getTargetRotation() {
        return this.getTargetRotation;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public boolean hasCameraTransform() {
        return this.hasCameraTransform;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public Matrix getSensorToBufferTransform() {
        return this.getSensorToBufferTransform;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public boolean isMirroring() {
        return this.isMirroring;
    }

    public String toString() {
        return "TransformationInfo{getCropRect=" + this.getCropRect + ", getRotationDegrees=" + this.getRotationDegrees + ", getTargetRotation=" + this.getTargetRotation + ", hasCameraTransform=" + this.hasCameraTransform + ", getSensorToBufferTransform=" + this.getSensorToBufferTransform + ", isMirroring=" + this.isMirroring + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof SurfaceRequest.TransformationInfo)) {
            return false;
        }
        SurfaceRequest.TransformationInfo that = (SurfaceRequest.TransformationInfo) o;
        return this.getCropRect.equals(that.getCropRect()) && this.getRotationDegrees == that.getRotationDegrees() && this.getTargetRotation == that.getTargetRotation() && this.hasCameraTransform == that.hasCameraTransform() && this.getSensorToBufferTransform.equals(that.getSensorToBufferTransform()) && this.isMirroring == that.isMirroring();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((h$ ^ this.getCropRect.hashCode()) * 1000003) ^ this.getRotationDegrees) * 1000003) ^ this.getTargetRotation) * 1000003) ^ (this.hasCameraTransform ? 1231 : 1237)) * 1000003) ^ this.getSensorToBufferTransform.hashCode()) * 1000003) ^ (this.isMirroring ? 1231 : 1237);
    }
}
