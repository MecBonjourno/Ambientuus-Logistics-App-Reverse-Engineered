package androidx.camera.core.impl;

import android.util.Size;
import java.util.Map;

/* loaded from: classes.dex */
final class AutoValue_SurfaceSizeDefinition extends SurfaceSizeDefinition {
    private final Size analysisSize;
    private final Map<Integer, Size> maximum16x9SizeMap;
    private final Map<Integer, Size> maximum4x3SizeMap;
    private final Map<Integer, Size> maximumSizeMap;
    private final Size previewSize;
    private final Size recordSize;
    private final Map<Integer, Size> s1440pSizeMap;
    private final Map<Integer, Size> s720pSizeMap;
    private final Map<Integer, Size> ultraMaximumSizeMap;

    AutoValue_SurfaceSizeDefinition(Size analysisSize, Map<Integer, Size> s720pSizeMap, Size previewSize, Map<Integer, Size> s1440pSizeMap, Size recordSize, Map<Integer, Size> maximumSizeMap, Map<Integer, Size> maximum4x3SizeMap, Map<Integer, Size> maximum16x9SizeMap, Map<Integer, Size> ultraMaximumSizeMap) {
        if (analysisSize == null) {
            throw new NullPointerException("Null analysisSize");
        }
        this.analysisSize = analysisSize;
        if (s720pSizeMap == null) {
            throw new NullPointerException("Null s720pSizeMap");
        }
        this.s720pSizeMap = s720pSizeMap;
        if (previewSize == null) {
            throw new NullPointerException("Null previewSize");
        }
        this.previewSize = previewSize;
        if (s1440pSizeMap == null) {
            throw new NullPointerException("Null s1440pSizeMap");
        }
        this.s1440pSizeMap = s1440pSizeMap;
        if (recordSize == null) {
            throw new NullPointerException("Null recordSize");
        }
        this.recordSize = recordSize;
        if (maximumSizeMap == null) {
            throw new NullPointerException("Null maximumSizeMap");
        }
        this.maximumSizeMap = maximumSizeMap;
        if (maximum4x3SizeMap == null) {
            throw new NullPointerException("Null maximum4x3SizeMap");
        }
        this.maximum4x3SizeMap = maximum4x3SizeMap;
        if (maximum16x9SizeMap == null) {
            throw new NullPointerException("Null maximum16x9SizeMap");
        }
        this.maximum16x9SizeMap = maximum16x9SizeMap;
        if (ultraMaximumSizeMap == null) {
            throw new NullPointerException("Null ultraMaximumSizeMap");
        }
        this.ultraMaximumSizeMap = ultraMaximumSizeMap;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Size getAnalysisSize() {
        return this.analysisSize;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Map<Integer, Size> getS720pSizeMap() {
        return this.s720pSizeMap;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Size getPreviewSize() {
        return this.previewSize;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Map<Integer, Size> getS1440pSizeMap() {
        return this.s1440pSizeMap;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Size getRecordSize() {
        return this.recordSize;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Map<Integer, Size> getMaximumSizeMap() {
        return this.maximumSizeMap;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Map<Integer, Size> getMaximum4x3SizeMap() {
        return this.maximum4x3SizeMap;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Map<Integer, Size> getMaximum16x9SizeMap() {
        return this.maximum16x9SizeMap;
    }

    @Override // androidx.camera.core.impl.SurfaceSizeDefinition
    public Map<Integer, Size> getUltraMaximumSizeMap() {
        return this.ultraMaximumSizeMap;
    }

    public String toString() {
        return "SurfaceSizeDefinition{analysisSize=" + this.analysisSize + ", s720pSizeMap=" + this.s720pSizeMap + ", previewSize=" + this.previewSize + ", s1440pSizeMap=" + this.s1440pSizeMap + ", recordSize=" + this.recordSize + ", maximumSizeMap=" + this.maximumSizeMap + ", maximum4x3SizeMap=" + this.maximum4x3SizeMap + ", maximum16x9SizeMap=" + this.maximum16x9SizeMap + ", ultraMaximumSizeMap=" + this.ultraMaximumSizeMap + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof SurfaceSizeDefinition)) {
            return false;
        }
        SurfaceSizeDefinition that = (SurfaceSizeDefinition) o;
        return this.analysisSize.equals(that.getAnalysisSize()) && this.s720pSizeMap.equals(that.getS720pSizeMap()) && this.previewSize.equals(that.getPreviewSize()) && this.s1440pSizeMap.equals(that.getS1440pSizeMap()) && this.recordSize.equals(that.getRecordSize()) && this.maximumSizeMap.equals(that.getMaximumSizeMap()) && this.maximum4x3SizeMap.equals(that.getMaximum4x3SizeMap()) && this.maximum16x9SizeMap.equals(that.getMaximum16x9SizeMap()) && this.ultraMaximumSizeMap.equals(that.getUltraMaximumSizeMap());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((((h$ ^ this.analysisSize.hashCode()) * 1000003) ^ this.s720pSizeMap.hashCode()) * 1000003) ^ this.previewSize.hashCode()) * 1000003) ^ this.s1440pSizeMap.hashCode()) * 1000003) ^ this.recordSize.hashCode()) * 1000003) ^ this.maximumSizeMap.hashCode()) * 1000003) ^ this.maximum4x3SizeMap.hashCode()) * 1000003) ^ this.maximum16x9SizeMap.hashCode()) * 1000003) ^ this.ultraMaximumSizeMap.hashCode();
    }
}
