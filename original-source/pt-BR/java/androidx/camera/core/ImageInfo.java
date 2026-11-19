package androidx.camera.core;

import android.graphics.Matrix;
import androidx.camera.core.impl.TagBundle;
import androidx.camera.core.impl.utils.ExifData;

/* carregado de: classes.dex */
public interface ImageInfo {
    int getFlashState();

    int getRotationDegrees();

    Matrix getSensorToBufferTransformMatrix();

    TagBundle getTagBundle();

    long getTimestamp();

    void populateExifData(ExifData.Builder builder);

    /* renomeado de: androidx.camera.core.ImageInfo$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static Matrix $default$getSensorToBufferTransformMatrix(ImageInfo _this) {
            return new Matrix();
        }

        public static int $default$getFlashState(ImageInfo _this) {
            return 0;
        }
    }
}
