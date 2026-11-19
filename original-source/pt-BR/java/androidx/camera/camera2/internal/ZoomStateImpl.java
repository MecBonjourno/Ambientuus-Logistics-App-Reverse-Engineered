package androidx.camera.camera2.internal;

import androidx.camera.core.ZoomState;
import androidx.camera.core.impl.AdapterCameraInfo;

/* carregado de: classes.dex */
class ZoomStateImpl implements ZoomState {
    private float mLinearZoom;
    private final float mMaxZoomRatio;
    private final float mMinZoomRatio;
    private float mZoomRatio;

    ZoomStateImpl(float maxZoomRatio, float minZoomRatio) {
        this.mMaxZoomRatio = maxZoomRatio;
        this.mMinZoomRatio = minZoomRatio;
    }

    void setZoomRatio(float zoomRatio) throws IllegalArgumentException {
        if (zoomRatio > this.mMaxZoomRatio || zoomRatio < this.mMinZoomRatio) {
            String outOfRangeDesc = "Requested zoomRatio " + zoomRatio + " is not within valid range [" + this.mMinZoomRatio + " , " + this.mMaxZoomRatio + "]";
            throw new IllegalArgumentException(outOfRangeDesc);
        }
        this.mZoomRatio = zoomRatio;
        this.mLinearZoom = AdapterCameraInfo.getPercentageByRatio(this.mZoomRatio, this.mMinZoomRatio, this.mMaxZoomRatio);
    }

    void setLinearZoom(float linearZoom) throws IllegalArgumentException {
        if (linearZoom > 1.0f || linearZoom < 0.0f) {
            String outOfRangeDesc = "Requested linearZoom " + linearZoom + " is not within valid range [0..1]";
            throw new IllegalArgumentException(outOfRangeDesc);
        }
        this.mLinearZoom = linearZoom;
        this.mZoomRatio = AdapterCameraInfo.getZoomRatioByPercentage(this.mLinearZoom, this.mMinZoomRatio, this.mMaxZoomRatio);
    }

    @Override // androidx.camera.core.ZoomState
    public float getZoomRatio() {
        return this.mZoomRatio;
    }

    @Override // androidx.camera.core.ZoomState
    public float getMaxZoomRatio() {
        return this.mMaxZoomRatio;
    }

    @Override // androidx.camera.core.ZoomState
    public float getMinZoomRatio() {
        return this.mMinZoomRatio;
    }

    @Override // androidx.camera.core.ZoomState
    public float getLinearZoom() {
        return this.mLinearZoom;
    }
}
