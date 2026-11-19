package androidx.camera.camera2.internal;

import android.util.Size;
import androidx.camera.camera2.internal.Camera2CameraImpl;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import java.util.List;

/* carregado de: classes.dex */
final class AutoValue_Camera2CameraImpl_UseCaseInfo extends Camera2CameraImpl.UseCaseInfo {
    private final List<UseCaseConfigFactory.CaptureType> captureTypes;
    private final SessionConfig sessionConfig;
    private final StreamSpec streamSpec;
    private final Size surfaceResolution;
    private final UseCaseConfig<?> useCaseConfig;
    private final String useCaseId;
    private final Class<?> useCaseType;

    AutoValue_Camera2CameraImpl_UseCaseInfo(String useCaseId, Class<?> useCaseType, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, Size surfaceResolution, StreamSpec streamSpec, List<UseCaseConfigFactory.CaptureType> captureTypes) {
        if (useCaseId == null) {
            throw new NullPointerException("Null useCaseId");
        }
        this.useCaseId = useCaseId;
        if (useCaseType == null) {
            throw new NullPointerException("Null useCaseType");
        }
        this.useCaseType = useCaseType;
        if (sessionConfig == null) {
            throw new NullPointerException("Null sessionConfig");
        }
        this.sessionConfig = sessionConfig;
        if (useCaseConfig == null) {
            throw new NullPointerException("Null useCaseConfig");
        }
        this.useCaseConfig = useCaseConfig;
        this.surfaceResolution = surfaceResolution;
        this.streamSpec = streamSpec;
        this.captureTypes = captureTypes;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    String getUseCaseId() {
        return this.useCaseId;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    Class<?> getUseCaseType() {
        return this.useCaseType;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    SessionConfig getSessionConfig() {
        return this.sessionConfig;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    UseCaseConfig<?> getUseCaseConfig() {
        return this.useCaseConfig;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    Size getSurfaceResolution() {
        return this.surfaceResolution;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    StreamSpec getStreamSpec() {
        return this.streamSpec;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    List<UseCaseConfigFactory.CaptureType> getCaptureTypes() {
        return this.captureTypes;
    }

    public String toString() {
        return "UseCaseInfo{useCaseId=" + this.useCaseId + ", useCaseType=" + this.useCaseType + ", sessionConfig=" + this.sessionConfig + ", useCaseConfig=" + this.useCaseConfig + ", surfaceResolution=" + this.surfaceResolution + ", streamSpec=" + this.streamSpec + ", captureTypes=" + this.captureTypes + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Camera2CameraImpl.UseCaseInfo)) {
            return false;
        }
        Camera2CameraImpl.UseCaseInfo that = (Camera2CameraImpl.UseCaseInfo) o;
        if (this.useCaseId.equals(that.getUseCaseId()) && this.useCaseType.equals(that.getUseCaseType()) && this.sessionConfig.equals(that.getSessionConfig()) && this.useCaseConfig.equals(that.getUseCaseConfig()) && (this.surfaceResolution != null ? this.surfaceResolution.equals(that.getSurfaceResolution()) : that.getSurfaceResolution() == null) && (this.streamSpec != null ? this.streamSpec.equals(that.getStreamSpec()) : that.getStreamSpec() == null)) {
            if (this.captureTypes == null) {
                if (that.getCaptureTypes() == null) {
                    return true;
                }
            } else if (this.captureTypes.equals(that.getCaptureTypes())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((h$ ^ this.useCaseId.hashCode()) * 1000003) ^ this.useCaseType.hashCode()) * 1000003) ^ this.sessionConfig.hashCode()) * 1000003) ^ this.useCaseConfig.hashCode()) * 1000003) ^ (this.surfaceResolution == null ? 0 : this.surfaceResolution.hashCode())) * 1000003) ^ (this.streamSpec == null ? 0 : this.streamSpec.hashCode())) * 1000003) ^ (this.captureTypes != null ? this.captureTypes.hashCode() : 0);
    }
}
