package androidx.camera.core.processing.util;

import androidx.camera.core.processing.util.GraphicDeviceInfo;

/* carregado de: classes.dex */
final class AutoValue_GraphicDeviceInfo extends GraphicDeviceInfo {
    private final String eglExtensions;
    private final String eglVersion;
    private final String glExtensions;
    private final String glVersion;

    private AutoValue_GraphicDeviceInfo(String glVersion, String eglVersion, String glExtensions, String eglExtensions) {
        this.glVersion = glVersion;
        this.eglVersion = eglVersion;
        this.glExtensions = glExtensions;
        this.eglExtensions = eglExtensions;
    }

    @Override // androidx.camera.core.processing.util.GraphicDeviceInfo
    public String getGlVersion() {
        return this.glVersion;
    }

    @Override // androidx.camera.core.processing.util.GraphicDeviceInfo
    public String getEglVersion() {
        return this.eglVersion;
    }

    @Override // androidx.camera.core.processing.util.GraphicDeviceInfo
    public String getGlExtensions() {
        return this.glExtensions;
    }

    @Override // androidx.camera.core.processing.util.GraphicDeviceInfo
    public String getEglExtensions() {
        return this.eglExtensions;
    }

    public String toString() {
        return "GraphicDeviceInfo{glVersion=" + this.glVersion + ", eglVersion=" + this.eglVersion + ", glExtensions=" + this.glExtensions + ", eglExtensions=" + this.eglExtensions + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof GraphicDeviceInfo)) {
            return false;
        }
        GraphicDeviceInfo that = (GraphicDeviceInfo) o;
        return this.glVersion.equals(that.getGlVersion()) && this.eglVersion.equals(that.getEglVersion()) && this.glExtensions.equals(that.getGlExtensions()) && this.eglExtensions.equals(that.getEglExtensions());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.glVersion.hashCode()) * 1000003) ^ this.eglVersion.hashCode()) * 1000003) ^ this.glExtensions.hashCode()) * 1000003) ^ this.eglExtensions.hashCode();
    }

    static final class Builder extends GraphicDeviceInfo.Builder {
        private String eglExtensions;
        private String eglVersion;
        private String glExtensions;
        private String glVersion;

        Builder() {
        }

        @Override // androidx.camera.core.processing.util.GraphicDeviceInfo.Builder
        public GraphicDeviceInfo.Builder setGlVersion(String glVersion) {
            if (glVersion == null) {
                throw new NullPointerException("Null glVersion");
            }
            this.glVersion = glVersion;
            return this;
        }

        @Override // androidx.camera.core.processing.util.GraphicDeviceInfo.Builder
        public GraphicDeviceInfo.Builder setEglVersion(String eglVersion) {
            if (eglVersion == null) {
                throw new NullPointerException("Null eglVersion");
            }
            this.eglVersion = eglVersion;
            return this;
        }

        @Override // androidx.camera.core.processing.util.GraphicDeviceInfo.Builder
        public GraphicDeviceInfo.Builder setGlExtensions(String glExtensions) {
            if (glExtensions == null) {
                throw new NullPointerException("Null glExtensions");
            }
            this.glExtensions = glExtensions;
            return this;
        }

        @Override // androidx.camera.core.processing.util.GraphicDeviceInfo.Builder
        public GraphicDeviceInfo.Builder setEglExtensions(String eglExtensions) {
            if (eglExtensions == null) {
                throw new NullPointerException("Null eglExtensions");
            }
            this.eglExtensions = eglExtensions;
            return this;
        }

        @Override // androidx.camera.core.processing.util.GraphicDeviceInfo.Builder
        public GraphicDeviceInfo build() {
            String missing = this.glVersion == null ? " glVersion" : "";
            if (this.eglVersion == null) {
                missing = missing + " eglVersion";
            }
            if (this.glExtensions == null) {
                missing = missing + " glExtensions";
            }
            if (this.eglExtensions == null) {
                missing = missing + " eglExtensions";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_GraphicDeviceInfo(this.glVersion, this.eglVersion, this.glExtensions, this.eglExtensions);
        }
    }
}
