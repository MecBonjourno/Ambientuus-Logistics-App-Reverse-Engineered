package androidx.camera.video.internal.compat.quirk;

import android.graphics.Rect;
import android.os.Build;
import android.util.Size;
import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* carregado de: classes.dex */
public class SizeCannotEncodeVideoQuirk implements Quirk {
    static boolean load() {
        return isMotoC();
    }

    private static boolean isMotoC() {
        return "motorola".equalsIgnoreCase(Build.BRAND) && "moto c".equalsIgnoreCase(Build.MODEL);
    }

    private static Set<Size> getProblematicSizes() {
        if (isMotoC()) {
            return new HashSet(Collections.singletonList(new Size(720, 1280)));
        }
        return Collections.emptySet();
    }

    public boolean isProblematicEncodeSize(Size size) {
        return getProblematicSizes().contains(size);
    }

    public Rect adjustCropRectForProblematicEncodeSize(Rect cropRectWithoutRotation, int rotationDegrees, VideoEncoderInfo videoEncoderInfo) {
        Size sizeToEncode = TransformUtils.rotateSize(TransformUtils.rectToSize(cropRectWithoutRotation), rotationDegrees);
        if (!isProblematicEncodeSize(sizeToEncode)) {
            return cropRectWithoutRotation;
        }
        int halfAlignment = videoEncoderInfo != null ? videoEncoderInfo.getHeightAlignment() / 2 : 8;
        Rect rectToAdjust = new Rect(cropRectWithoutRotation);
        if (cropRectWithoutRotation.width() == sizeToEncode.getHeight()) {
            rectToAdjust.left += halfAlignment;
            rectToAdjust.right -= halfAlignment;
        } else {
            rectToAdjust.top += halfAlignment;
            rectToAdjust.bottom -= halfAlignment;
        }
        return rectToAdjust;
    }
}
