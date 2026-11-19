package androidx.camera.camera2.internal;

import android.util.Range;
import androidx.camera.camera2.internal.SupportedSurfaceCombination;

/* carregado de: classes.dex */
final class AutoValue_SupportedSurfaceCombination_FeatureSettings extends SupportedSurfaceCombination.FeatureSettings {
    private final int getCameraMode;
    private final int getRequiredMaxBitDepth;
    private final Range<Integer> getTargetFpsRange;
    private final boolean hasVideoCapture;
    private final boolean isFeatureComboInvocation;
    private final boolean isHighSpeedOn;
    private final boolean isPreviewStabilizationOn;
    private final boolean isStrictFpsRequired;
    private final boolean isUltraHdrOn;
    private final boolean requiresFeatureComboQuery;

    AutoValue_SupportedSurfaceCombination_FeatureSettings(int getCameraMode, boolean hasVideoCapture, int getRequiredMaxBitDepth, boolean isPreviewStabilizationOn, boolean isUltraHdrOn, boolean isHighSpeedOn, boolean isFeatureComboInvocation, boolean requiresFeatureComboQuery, Range<Integer> getTargetFpsRange, boolean isStrictFpsRequired) {
        this.getCameraMode = getCameraMode;
        this.hasVideoCapture = hasVideoCapture;
        this.getRequiredMaxBitDepth = getRequiredMaxBitDepth;
        this.isPreviewStabilizationOn = isPreviewStabilizationOn;
        this.isUltraHdrOn = isUltraHdrOn;
        this.isHighSpeedOn = isHighSpeedOn;
        this.isFeatureComboInvocation = isFeatureComboInvocation;
        this.requiresFeatureComboQuery = requiresFeatureComboQuery;
        if (getTargetFpsRange == null) {
            throw new NullPointerException("Null getTargetFpsRange");
        }
        this.getTargetFpsRange = getTargetFpsRange;
        this.isStrictFpsRequired = isStrictFpsRequired;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    int getCameraMode() {
        return this.getCameraMode;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    boolean hasVideoCapture() {
        return this.hasVideoCapture;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    int getRequiredMaxBitDepth() {
        return this.getRequiredMaxBitDepth;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    boolean isPreviewStabilizationOn() {
        return this.isPreviewStabilizationOn;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    boolean isUltraHdrOn() {
        return this.isUltraHdrOn;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    boolean isHighSpeedOn() {
        return this.isHighSpeedOn;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    boolean isFeatureComboInvocation() {
        return this.isFeatureComboInvocation;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    boolean requiresFeatureComboQuery() {
        return this.requiresFeatureComboQuery;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    Range<Integer> getTargetFpsRange() {
        return this.getTargetFpsRange;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    boolean isStrictFpsRequired() {
        return this.isStrictFpsRequired;
    }

    public String toString() {
        return "FeatureSettings{getCameraMode=" + this.getCameraMode + ", hasVideoCapture=" + this.hasVideoCapture + ", getRequiredMaxBitDepth=" + this.getRequiredMaxBitDepth + ", isPreviewStabilizationOn=" + this.isPreviewStabilizationOn + ", isUltraHdrOn=" + this.isUltraHdrOn + ", isHighSpeedOn=" + this.isHighSpeedOn + ", isFeatureComboInvocation=" + this.isFeatureComboInvocation + ", requiresFeatureComboQuery=" + this.requiresFeatureComboQuery + ", getTargetFpsRange=" + this.getTargetFpsRange + ", isStrictFpsRequired=" + this.isStrictFpsRequired + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof SupportedSurfaceCombination.FeatureSettings)) {
            return false;
        }
        SupportedSurfaceCombination.FeatureSettings that = (SupportedSurfaceCombination.FeatureSettings) o;
        return this.getCameraMode == that.getCameraMode() && this.hasVideoCapture == that.hasVideoCapture() && this.getRequiredMaxBitDepth == that.getRequiredMaxBitDepth() && this.isPreviewStabilizationOn == that.isPreviewStabilizationOn() && this.isUltraHdrOn == that.isUltraHdrOn() && this.isHighSpeedOn == that.isHighSpeedOn() && this.isFeatureComboInvocation == that.isFeatureComboInvocation() && this.requiresFeatureComboQuery == that.requiresFeatureComboQuery() && this.getTargetFpsRange.equals(that.getTargetFpsRange()) && this.isStrictFpsRequired == that.isStrictFpsRequired();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((((((h$ ^ this.getCameraMode) * 1000003) ^ (this.hasVideoCapture ? 1231 : 1237)) * 1000003) ^ this.getRequiredMaxBitDepth) * 1000003) ^ (this.isPreviewStabilizationOn ? 1231 : 1237)) * 1000003) ^ (this.isUltraHdrOn ? 1231 : 1237)) * 1000003) ^ (this.isHighSpeedOn ? 1231 : 1237)) * 1000003) ^ (this.isFeatureComboInvocation ? 1231 : 1237)) * 1000003) ^ (this.requiresFeatureComboQuery ? 1231 : 1237)) * 1000003) ^ this.getTargetFpsRange.hashCode()) * 1000003) ^ (this.isStrictFpsRequired ? 1231 : 1237);
    }
}
