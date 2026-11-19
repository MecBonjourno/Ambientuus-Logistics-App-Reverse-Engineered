package androidx.camera.core.internal.utils;

import android.util.Size;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* carregado de: classes.dex */
public final class SizeUtil {
    public static final Size RESOLUTION_ZERO = new Size(0, 0);
    public static final Size RESOLUTION_QVGA = new Size(320, 240);
    public static final Size RESOLUTION_VGA = new Size(640, 480);
    public static final Size RESOLUTION_480P = new Size(720, 480);
    public static final Size RESOLUTION_720P = new Size(1280, 720);
    public static final Size RESOLUTION_1080P = new Size(1920, 1080);
    public static final Size RESOLUTION_1440P = new Size(1920, 1440);
    public static final Size RESOLUTION_1440P_16_9 = new Size(2560, 1440);
    public static final Size RESOLUTION_UHD = new Size(3840, 2160);

    private SizeUtil() {
    }

    public static int getArea(Size size) {
        return getArea(size.getWidth(), size.getHeight());
    }

    public static int getArea(int width, int height) {
        return width * height;
    }

    public static boolean isSmallerByArea(Size sourceSize, Size targetSize) {
        return getArea(sourceSize) < getArea(targetSize);
    }

    public static boolean isLongerInAnyEdge(Size sourceSize, Size targetSize) {
        return sourceSize.getWidth() > targetSize.getWidth() || sourceSize.getHeight() > targetSize.getHeight();
    }

    public static Size getMaxSize(List<Size> sizeList) {
        if (sizeList.isEmpty()) {
            return null;
        }
        return (Size) Collections.max(sizeList, new CompareSizesByArea());
    }

    public static <T> T findNearestHigherFor(Size size, TreeMap<Size, T> areaSortedSizeMap) {
        Map.Entry<Size, T> ceilEntry = areaSortedSizeMap.ceilingEntry(size);
        if (ceilEntry != null) {
            return ceilEntry.getValue();
        }
        Map.Entry<Size, T> floorEntry = areaSortedSizeMap.floorEntry(size);
        if (floorEntry != null) {
            return floorEntry.getValue();
        }
        return null;
    }
}
