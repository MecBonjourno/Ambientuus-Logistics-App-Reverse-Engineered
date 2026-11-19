package androidx.camera.core.impl;

import android.util.Size;
import java.util.Map;

/* carregado de: classes.dex */
public abstract class SurfaceSizeDefinition {
    public abstract Size getAnalysisSize();

    public abstract Map<Integer, Size> getMaximum16x9SizeMap();

    public abstract Map<Integer, Size> getMaximum4x3SizeMap();

    public abstract Map<Integer, Size> getMaximumSizeMap();

    public abstract Size getPreviewSize();

    public abstract Size getRecordSize();

    public abstract Map<Integer, Size> getS1440pSizeMap();

    public abstract Map<Integer, Size> getS720pSizeMap();

    public abstract Map<Integer, Size> getUltraMaximumSizeMap();

    SurfaceSizeDefinition() {
    }

    public static SurfaceSizeDefinition create(Size analysisSize, Map<Integer, Size> s720pSizeMap, Size previewSize, Map<Integer, Size> s1440pSizeMap, Size recordSize, Map<Integer, Size> maximumSizeMap, Map<Integer, Size> maximum4x3SizeMap, Map<Integer, Size> maximum16x9SizeMap, Map<Integer, Size> ultraMaximumSizeMap) {
        return new AutoValue_SurfaceSizeDefinition(analysisSize, s720pSizeMap, previewSize, s1440pSizeMap, recordSize, maximumSizeMap, maximum4x3SizeMap, maximum16x9SizeMap, ultraMaximumSizeMap);
    }

    public Size getS720pSize(int format) {
        return getS720pSizeMap().get(Integer.valueOf(format));
    }

    public Size getS1440pSize(int format) {
        return getS1440pSizeMap().get(Integer.valueOf(format));
    }

    public Size getMaximumSize(int format) {
        return getMaximumSizeMap().get(Integer.valueOf(format));
    }

    public Size getMaximum4x3Size(int format) {
        return getMaximumSizeMap().get(Integer.valueOf(format));
    }

    public Size getMaximum16x9Size(int format) {
        return getMaximumSizeMap().get(Integer.valueOf(format));
    }

    public Size getUltraMaximumSize(int format) {
        return getUltraMaximumSizeMap().get(Integer.valueOf(format));
    }
}
