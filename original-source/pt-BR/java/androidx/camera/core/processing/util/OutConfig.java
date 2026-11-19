package androidx.camera.core.processing.util;

import android.graphics.Rect;
import android.util.Size;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.processing.SurfaceEdge;
import java.util.UUID;

/* carregado de: classes.dex */
public abstract class OutConfig {
    public abstract Rect getCropRect();

    public abstract int getFormat();

    public abstract int getRotationDegrees();

    public abstract Size getSize();

    public abstract int getTargets();

    abstract UUID getUuid();

    public abstract boolean isMirroring();

    public abstract boolean shouldRespectInputCropRect();

    public static OutConfig of(SurfaceEdge inputEdge) {
        return of(inputEdge.getTargets(), inputEdge.getFormat(), inputEdge.getCropRect(), TransformUtils.getRotatedSize(inputEdge.getCropRect(), inputEdge.getRotationDegrees()), inputEdge.getRotationDegrees(), inputEdge.isMirroring());
    }

    public static OutConfig of(int targets, int format, Rect cropRect, Size size, int rotationDegrees, boolean mirroring) {
        return of(targets, format, cropRect, size, rotationDegrees, mirroring, false);
    }

    public static OutConfig of(int targets, int format, Rect cropRect, Size size, int rotationDegrees, boolean mirroring, boolean shouldRespectInputCropRect) {
        return new AutoValue_OutConfig(UUID.randomUUID(), targets, format, cropRect, size, rotationDegrees, mirroring, shouldRespectInputCropRect);
    }
}
