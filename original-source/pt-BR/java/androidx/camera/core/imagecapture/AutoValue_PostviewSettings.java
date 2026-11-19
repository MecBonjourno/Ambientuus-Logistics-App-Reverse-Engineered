package androidx.camera.core.imagecapture;

import android.util.Size;

/* carregado de: classes.dex */
final class AutoValue_PostviewSettings extends PostviewSettings {
    private final int inputFormat;
    private final Size resolution;

    AutoValue_PostviewSettings(Size resolution, int inputFormat) {
        if (resolution == null) {
            throw new NullPointerException("Null resolution");
        }
        this.resolution = resolution;
        this.inputFormat = inputFormat;
    }

    @Override // androidx.camera.core.imagecapture.PostviewSettings
    public Size getResolution() {
        return this.resolution;
    }

    @Override // androidx.camera.core.imagecapture.PostviewSettings
    public int getInputFormat() {
        return this.inputFormat;
    }

    public String toString() {
        return "PostviewSettings{resolution=" + this.resolution + ", inputFormat=" + this.inputFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof PostviewSettings)) {
            return false;
        }
        PostviewSettings that = (PostviewSettings) o;
        return this.resolution.equals(that.getResolution()) && this.inputFormat == that.getInputFormat();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.resolution.hashCode()) * 1000003) ^ this.inputFormat;
    }
}
