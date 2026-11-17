package androidx.camera.camera2.internal.compat.params;

import android.hardware.camera2.params.OutputConfiguration;
import android.view.Surface;
import androidx.core.util.Preconditions;
import j$.util.Objects;

/* loaded from: classes.dex */
class OutputConfigurationCompatApi28Impl extends OutputConfigurationCompatApi26Impl {
    OutputConfigurationCompatApi28Impl(Surface surface) {
        this(new OutputConfigurationParamsApi28(new OutputConfiguration(surface)));
    }

    OutputConfigurationCompatApi28Impl(int surfaceGroupId, Surface surface) {
        this(new OutputConfigurationParamsApi28(new OutputConfiguration(surfaceGroupId, surface)));
    }

    OutputConfigurationCompatApi28Impl(Object outputConfiguration) {
        super(outputConfiguration);
    }

    static OutputConfigurationCompatApi28Impl wrap(OutputConfiguration outputConfiguration) {
        return new OutputConfigurationCompatApi28Impl(new OutputConfigurationParamsApi28(outputConfiguration));
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi26Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public void removeSurface(Surface surface) {
        ((OutputConfiguration) getOutputConfiguration()).removeSurface(surface);
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi26Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public int getMaxSharedSurfaceCount() {
        return ((OutputConfiguration) getOutputConfiguration()).getMaxSharedSurfaceCount();
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi26Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi24Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public void setPhysicalCameraId(String physicalCameraId) {
        ((OutputConfiguration) getOutputConfiguration()).setPhysicalCameraId(physicalCameraId);
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi26Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi24Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public String getPhysicalCameraId() {
        return null;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi26Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi24Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public long getDynamicRangeProfile() {
        return ((OutputConfigurationParamsApi28) this.mObject).mDynamicRangeProfile;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi26Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi24Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public void setDynamicRangeProfile(long profile) {
        ((OutputConfigurationParamsApi28) this.mObject).mDynamicRangeProfile = profile;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi26Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi24Impl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public Object getOutputConfiguration() {
        Preconditions.checkArgument(this.mObject instanceof OutputConfigurationParamsApi28);
        return ((OutputConfigurationParamsApi28) this.mObject).mOutputConfiguration;
    }

    private static final class OutputConfigurationParamsApi28 {
        long mDynamicRangeProfile = 1;
        final OutputConfiguration mOutputConfiguration;

        OutputConfigurationParamsApi28(OutputConfiguration configuration) {
            this.mOutputConfiguration = configuration;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof OutputConfigurationParamsApi28)) {
                return false;
            }
            OutputConfigurationParamsApi28 otherOutputConfig = (OutputConfigurationParamsApi28) obj;
            return Objects.equals(this.mOutputConfiguration, otherOutputConfig.mOutputConfiguration) && this.mDynamicRangeProfile == otherOutputConfig.mDynamicRangeProfile;
        }

        public int hashCode() {
            int h = ((1 << 5) - 1) ^ this.mOutputConfiguration.hashCode();
            return ((h << 5) - h) ^ OutputConfigurationCompatApi24Impl$OutputConfigurationParamsApi24$$ExternalSyntheticBackport0.m(this.mDynamicRangeProfile);
        }
    }
}
