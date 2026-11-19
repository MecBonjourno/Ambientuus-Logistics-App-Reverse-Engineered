package androidx.camera.camera2.internal.compat.params;

import android.hardware.camera2.params.OutputConfiguration;
import android.view.Surface;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.Collections;
import java.util.List;

/* carregado de: classes.dex */
class OutputConfigurationCompatApi24Impl extends OutputConfigurationCompatBaseImpl {
    OutputConfigurationCompatApi24Impl(Surface surface) {
        this(new OutputConfigurationParamsApi24(new OutputConfiguration(surface)));
    }

    OutputConfigurationCompatApi24Impl(int surfaceGroupId, Surface surface) {
        this(new OutputConfigurationParamsApi24(new OutputConfiguration(surfaceGroupId, surface)));
    }

    OutputConfigurationCompatApi24Impl(Object outputConfiguration) {
        super(outputConfiguration);
    }

    static OutputConfigurationCompatApi24Impl wrap(OutputConfiguration outputConfiguration) {
        return new OutputConfigurationCompatApi24Impl(new OutputConfigurationParamsApi24(outputConfiguration));
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public void enableSurfaceSharing() {
        ((OutputConfigurationParamsApi24) this.mObject).mIsShared = true;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl
    boolean isSurfaceSharingEnabled() {
        return ((OutputConfigurationParamsApi24) this.mObject).mIsShared;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public void setPhysicalCameraId(String physicalCameraId) {
        ((OutputConfigurationParamsApi24) this.mObject).mPhysicalCameraId = physicalCameraId;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public String getPhysicalCameraId() {
        return ((OutputConfigurationParamsApi24) this.mObject).mPhysicalCameraId;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public long getDynamicRangeProfile() {
        return ((OutputConfigurationParamsApi24) this.mObject).mDynamicRangeProfile;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public void setDynamicRangeProfile(long profile) {
        ((OutputConfigurationParamsApi24) this.mObject).mDynamicRangeProfile = profile;
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public Surface getSurface() {
        return ((OutputConfiguration) getOutputConfiguration()).getSurface();
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public List<Surface> getSurfaces() {
        return Collections.singletonList(getSurface());
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public int getSurfaceGroupId() {
        return ((OutputConfiguration) getOutputConfiguration()).getSurfaceGroupId();
    }

    @Override // androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatBaseImpl, androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat.OutputConfigurationCompatImpl
    public Object getOutputConfiguration() {
        Preconditions.checkArgument(this.mObject instanceof OutputConfigurationParamsApi24);
        return ((OutputConfigurationParamsApi24) this.mObject).mOutputConfiguration;
    }

    private static final class OutputConfigurationParamsApi24 {
        long mDynamicRangeProfile = 1;
        boolean mIsShared;
        final OutputConfiguration mOutputConfiguration;
        String mPhysicalCameraId;

        OutputConfigurationParamsApi24(OutputConfiguration configuration) {
            this.mOutputConfiguration = configuration;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof OutputConfigurationParamsApi24)) {
                return false;
            }
            OutputConfigurationParamsApi24 otherOutputConfig = (OutputConfigurationParamsApi24) obj;
            return Objects.equals(this.mOutputConfiguration, otherOutputConfig.mOutputConfiguration) && this.mIsShared == otherOutputConfig.mIsShared && this.mDynamicRangeProfile == otherOutputConfig.mDynamicRangeProfile && Objects.equals(this.mPhysicalCameraId, otherOutputConfig.mPhysicalCameraId);
        }

        public int hashCode() {
            int hashCode = ((1 << 5) - 1) ^ this.mOutputConfiguration.hashCode();
            int i = ((hashCode << 5) - hashCode) ^ (this.mIsShared ? 1 : 0);
            int hashCode2 = ((i << 5) - i) ^ (this.mPhysicalCameraId == null ? 0 : this.mPhysicalCameraId.hashCode());
            return ((hashCode2 << 5) - hashCode2) ^ OutputConfigurationCompatApi24Impl$OutputConfigurationParamsApi24$$ExternalSyntheticBackport0.m(this.mDynamicRangeProfile);
        }
    }
}
