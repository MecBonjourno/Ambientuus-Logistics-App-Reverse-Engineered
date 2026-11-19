package androidx.camera.view;

import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.Rect;
import android.util.Rational;
import android.util.Size;
import androidx.camera.core.MeteringPointFactory;
import androidx.camera.core.impl.utils.Threads;

/* carregado de: classes.dex */
class PreviewViewMeteringPointFactory extends MeteringPointFactory {
    static final PointF INVALID_POINT = new PointF(2.0f, 2.0f);
    private Matrix mMatrix;
    private final PreviewTransformation mPreviewTransformation;
    private Rect mSensorRect = null;

    PreviewViewMeteringPointFactory(PreviewTransformation previewTransformation) {
        this.mPreviewTransformation = previewTransformation;
    }

    @Override // androidx.camera.core.MeteringPointFactory
    protected PointF convertPoint(float x, float y) {
        float[] point = {x, y};
        synchronized (this) {
            if (this.mMatrix == null) {
                return INVALID_POINT;
            }
            this.mMatrix.mapPoints(point);
            return new PointF(point[0], point[1]);
        }
    }

    public void setSensorRect(Rect sensorRect) {
        setSurfaceAspectRatio(new Rational(sensorRect.width(), sensorRect.height()));
        synchronized (this) {
            this.mSensorRect = sensorRect;
        }
    }

    void recalculate(Size previewViewSize, int layoutDirection) {
        Threads.checkMainThread();
        synchronized (this) {
            if (previewViewSize.getWidth() != 0 && previewViewSize.getHeight() != 0 && this.mSensorRect != null) {
                this.mMatrix = this.mPreviewTransformation.getPreviewViewToNormalizedSensorMatrix(previewViewSize, layoutDirection, this.mSensorRect);
                return;
            }
            this.mMatrix = null;
        }
    }
}
