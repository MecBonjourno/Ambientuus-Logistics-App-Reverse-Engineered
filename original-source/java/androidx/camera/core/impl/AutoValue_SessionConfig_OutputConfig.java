package androidx.camera.core.impl;

import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.SessionConfig;
import java.util.List;

/* loaded from: classes.dex */
final class AutoValue_SessionConfig_OutputConfig extends SessionConfig.OutputConfig {
    private final DynamicRange dynamicRange;
    private final int mirrorMode;
    private final String physicalCameraId;
    private final List<DeferrableSurface> sharedSurfaces;
    private final DeferrableSurface surface;
    private final int surfaceGroupId;

    private AutoValue_SessionConfig_OutputConfig(DeferrableSurface surface, List<DeferrableSurface> sharedSurfaces, String physicalCameraId, int mirrorMode, int surfaceGroupId, DynamicRange dynamicRange) {
        this.surface = surface;
        this.sharedSurfaces = sharedSurfaces;
        this.physicalCameraId = physicalCameraId;
        this.mirrorMode = mirrorMode;
        this.surfaceGroupId = surfaceGroupId;
        this.dynamicRange = dynamicRange;
    }

    @Override // androidx.camera.core.impl.SessionConfig.OutputConfig
    public DeferrableSurface getSurface() {
        return this.surface;
    }

    @Override // androidx.camera.core.impl.SessionConfig.OutputConfig
    public List<DeferrableSurface> getSharedSurfaces() {
        return this.sharedSurfaces;
    }

    @Override // androidx.camera.core.impl.SessionConfig.OutputConfig
    public String getPhysicalCameraId() {
        return this.physicalCameraId;
    }

    @Override // androidx.camera.core.impl.SessionConfig.OutputConfig
    public int getMirrorMode() {
        return this.mirrorMode;
    }

    @Override // androidx.camera.core.impl.SessionConfig.OutputConfig
    public int getSurfaceGroupId() {
        return this.surfaceGroupId;
    }

    @Override // androidx.camera.core.impl.SessionConfig.OutputConfig
    public DynamicRange getDynamicRange() {
        return this.dynamicRange;
    }

    public String toString() {
        return "OutputConfig{surface=" + this.surface + ", sharedSurfaces=" + this.sharedSurfaces + ", physicalCameraId=" + this.physicalCameraId + ", mirrorMode=" + this.mirrorMode + ", surfaceGroupId=" + this.surfaceGroupId + ", dynamicRange=" + this.dynamicRange + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof SessionConfig.OutputConfig)) {
            return false;
        }
        SessionConfig.OutputConfig that = (SessionConfig.OutputConfig) o;
        return this.surface.equals(that.getSurface()) && this.sharedSurfaces.equals(that.getSharedSurfaces()) && (this.physicalCameraId != null ? this.physicalCameraId.equals(that.getPhysicalCameraId()) : that.getPhysicalCameraId() == null) && this.mirrorMode == that.getMirrorMode() && this.surfaceGroupId == that.getSurfaceGroupId() && this.dynamicRange.equals(that.getDynamicRange());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((h$ ^ this.surface.hashCode()) * 1000003) ^ this.sharedSurfaces.hashCode()) * 1000003) ^ (this.physicalCameraId == null ? 0 : this.physicalCameraId.hashCode())) * 1000003) ^ this.mirrorMode) * 1000003) ^ this.surfaceGroupId) * 1000003) ^ this.dynamicRange.hashCode();
    }

    static final class Builder extends SessionConfig.OutputConfig.Builder {
        private DynamicRange dynamicRange;
        private Integer mirrorMode;
        private String physicalCameraId;
        private List<DeferrableSurface> sharedSurfaces;
        private DeferrableSurface surface;
        private Integer surfaceGroupId;

        Builder() {
        }

        @Override // androidx.camera.core.impl.SessionConfig.OutputConfig.Builder
        public SessionConfig.OutputConfig.Builder setSurface(DeferrableSurface surface) {
            if (surface == null) {
                throw new NullPointerException("Null surface");
            }
            this.surface = surface;
            return this;
        }

        @Override // androidx.camera.core.impl.SessionConfig.OutputConfig.Builder
        public SessionConfig.OutputConfig.Builder setSharedSurfaces(List<DeferrableSurface> sharedSurfaces) {
            if (sharedSurfaces == null) {
                throw new NullPointerException("Null sharedSurfaces");
            }
            this.sharedSurfaces = sharedSurfaces;
            return this;
        }

        @Override // androidx.camera.core.impl.SessionConfig.OutputConfig.Builder
        public SessionConfig.OutputConfig.Builder setPhysicalCameraId(String physicalCameraId) {
            this.physicalCameraId = physicalCameraId;
            return this;
        }

        @Override // androidx.camera.core.impl.SessionConfig.OutputConfig.Builder
        public SessionConfig.OutputConfig.Builder setMirrorMode(int mirrorMode) {
            this.mirrorMode = Integer.valueOf(mirrorMode);
            return this;
        }

        @Override // androidx.camera.core.impl.SessionConfig.OutputConfig.Builder
        public SessionConfig.OutputConfig.Builder setSurfaceGroupId(int surfaceGroupId) {
            this.surfaceGroupId = Integer.valueOf(surfaceGroupId);
            return this;
        }

        @Override // androidx.camera.core.impl.SessionConfig.OutputConfig.Builder
        public SessionConfig.OutputConfig.Builder setDynamicRange(DynamicRange dynamicRange) {
            if (dynamicRange == null) {
                throw new NullPointerException("Null dynamicRange");
            }
            this.dynamicRange = dynamicRange;
            return this;
        }

        @Override // androidx.camera.core.impl.SessionConfig.OutputConfig.Builder
        public SessionConfig.OutputConfig build() {
            String missing = this.surface == null ? " surface" : "";
            if (this.sharedSurfaces == null) {
                missing = missing + " sharedSurfaces";
            }
            if (this.mirrorMode == null) {
                missing = missing + " mirrorMode";
            }
            if (this.surfaceGroupId == null) {
                missing = missing + " surfaceGroupId";
            }
            if (this.dynamicRange == null) {
                missing = missing + " dynamicRange";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_SessionConfig_OutputConfig(this.surface, this.sharedSurfaces, this.physicalCameraId, this.mirrorMode.intValue(), this.surfaceGroupId.intValue(), this.dynamicRange);
        }
    }
}
