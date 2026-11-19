package androidx.camera.view.transform;

import android.graphics.Matrix;
import android.util.Size;

/* carregado de: classes.dex */
public final class OutputTransform {
    final Matrix mMatrix;
    final Size mViewPortSize;

    public OutputTransform(Matrix matrix, Size viewPortSize) {
        this.mMatrix = matrix;
        this.mViewPortSize = viewPortSize;
    }

    public Matrix getMatrix() {
        return this.mMatrix;
    }

    Size getViewPortSize() {
        return this.mViewPortSize;
    }
}
