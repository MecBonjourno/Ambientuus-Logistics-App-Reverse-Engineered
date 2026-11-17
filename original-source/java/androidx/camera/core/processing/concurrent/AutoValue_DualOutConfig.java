package androidx.camera.core.processing.concurrent;

import androidx.camera.core.processing.util.OutConfig;

/* loaded from: classes.dex */
final class AutoValue_DualOutConfig extends DualOutConfig {
    private final OutConfig primaryOutConfig;
    private final OutConfig secondaryOutConfig;

    AutoValue_DualOutConfig(OutConfig primaryOutConfig, OutConfig secondaryOutConfig) {
        if (primaryOutConfig == null) {
            throw new NullPointerException("Null primaryOutConfig");
        }
        this.primaryOutConfig = primaryOutConfig;
        if (secondaryOutConfig == null) {
            throw new NullPointerException("Null secondaryOutConfig");
        }
        this.secondaryOutConfig = secondaryOutConfig;
    }

    @Override // androidx.camera.core.processing.concurrent.DualOutConfig
    public OutConfig getPrimaryOutConfig() {
        return this.primaryOutConfig;
    }

    @Override // androidx.camera.core.processing.concurrent.DualOutConfig
    public OutConfig getSecondaryOutConfig() {
        return this.secondaryOutConfig;
    }

    public String toString() {
        return "DualOutConfig{primaryOutConfig=" + this.primaryOutConfig + ", secondaryOutConfig=" + this.secondaryOutConfig + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof DualOutConfig)) {
            return false;
        }
        DualOutConfig that = (DualOutConfig) o;
        return this.primaryOutConfig.equals(that.getPrimaryOutConfig()) && this.secondaryOutConfig.equals(that.getSecondaryOutConfig());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.primaryOutConfig.hashCode()) * 1000003) ^ this.secondaryOutConfig.hashCode();
    }
}
