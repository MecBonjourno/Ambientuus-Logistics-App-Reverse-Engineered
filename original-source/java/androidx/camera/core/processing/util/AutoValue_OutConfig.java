package androidx.camera.core.processing.util;

import android.graphics.Rect;
import android.util.Size;
import java.util.UUID;

/* loaded from: classes.dex */
final class AutoValue_OutConfig extends OutConfig {
    private final Rect getCropRect;
    private final int getFormat;
    private final int getRotationDegrees;
    private final Size getSize;
    private final int getTargets;
    private final UUID getUuid;
    private final boolean isMirroring;
    private final boolean shouldRespectInputCropRect;

    AutoValue_OutConfig(UUID getUuid, int getTargets, int getFormat, Rect getCropRect, Size getSize, int getRotationDegrees, boolean isMirroring, boolean shouldRespectInputCropRect) {
        if (getUuid == null) {
            throw new NullPointerException("Null getUuid");
        }
        this.getUuid = getUuid;
        this.getTargets = getTargets;
        this.getFormat = getFormat;
        if (getCropRect == null) {
            throw new NullPointerException("Null getCropRect");
        }
        this.getCropRect = getCropRect;
        if (getSize == null) {
            throw new NullPointerException("Null getSize");
        }
        this.getSize = getSize;
        this.getRotationDegrees = getRotationDegrees;
        this.isMirroring = isMirroring;
        this.shouldRespectInputCropRect = shouldRespectInputCropRect;
    }

    @Override // androidx.camera.core.processing.util.OutConfig
    UUID getUuid() {
        return this.getUuid;
    }

    @Override // androidx.camera.core.processing.util.OutConfig
    public int getTargets() {
        return this.getTargets;
    }

    @Override // androidx.camera.core.processing.util.OutConfig
    public int getFormat() {
        return this.getFormat;
    }

    @Override // androidx.camera.core.processing.util.OutConfig
    public Rect getCropRect() {
        return this.getCropRect;
    }

    @Override // androidx.camera.core.processing.util.OutConfig
    public Size getSize() {
        return this.getSize;
    }

    @Override // androidx.camera.core.processing.util.OutConfig
    public int getRotationDegrees() {
        return this.getRotationDegrees;
    }

    @Override // androidx.camera.core.processing.util.OutConfig
    public boolean isMirroring() {
        return this.isMirroring;
    }

    @Override // androidx.camera.core.processing.util.OutConfig
    public boolean shouldRespectInputCropRect() {
        return this.shouldRespectInputCropRect;
    }

    public String toString() {
        return "OutConfig{getUuid=" + this.getUuid + ", getTargets=" + this.getTargets + ", getFormat=" + this.getFormat + ", getCropRect=" + this.getCropRect + ", getSize=" + this.getSize + ", getRotationDegrees=" + this.getRotationDegrees + ", isMirroring=" + this.isMirroring + ", shouldRespectInputCropRect=" + this.shouldRespectInputCropRect + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof OutConfig)) {
            return false;
        }
        OutConfig that = (OutConfig) o;
        return this.getUuid.equals(that.getUuid()) && this.getTargets == that.getTargets() && this.getFormat == that.getFormat() && this.getCropRect.equals(that.getCropRect()) && this.getSize.equals(that.getSize()) && this.getRotationDegrees == that.getRotationDegrees() && this.isMirroring == that.isMirroring() && this.shouldRespectInputCropRect == that.shouldRespectInputCropRect();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((h$ ^ this.getUuid.hashCode()) * 1000003) ^ this.getTargets) * 1000003) ^ this.getFormat) * 1000003) ^ this.getCropRect.hashCode()) * 1000003) ^ this.getSize.hashCode()) * 1000003) ^ this.getRotationDegrees) * 1000003) ^ (this.isMirroring ? 1231 : 1237)) * 1000003) ^ (this.shouldRespectInputCropRect ? 1231 : 1237);
    }
}
