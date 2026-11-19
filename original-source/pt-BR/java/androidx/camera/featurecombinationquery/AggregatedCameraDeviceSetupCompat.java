package androidx.camera.featurecombinationquery;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.params.SessionConfiguration;
import androidx.camera.featurecombinationquery.CameraDeviceSetupCompat;
import java.util.List;

/* carregado de: classes.dex */
final class AggregatedCameraDeviceSetupCompat implements CameraDeviceSetupCompat {
    private final List<CameraDeviceSetupCompat> mCameraDeviceSetupImpls;

    AggregatedCameraDeviceSetupCompat(List<CameraDeviceSetupCompat> cameraDeviceSetupImpls) {
        this.mCameraDeviceSetupImpls = cameraDeviceSetupImpls;
    }

    @Override // androidx.camera.featurecombinationquery.CameraDeviceSetupCompat
    public CameraDeviceSetupCompat.SupportQueryResult isSessionConfigurationSupported(SessionConfiguration sessionConfig) throws CameraAccessException {
        for (CameraDeviceSetupCompat impl : this.mCameraDeviceSetupImpls) {
            CameraDeviceSetupCompat.SupportQueryResult result = impl.isSessionConfigurationSupported(sessionConfig);
            if (result.getSupported() != 0) {
                return result;
            }
        }
        return new CameraDeviceSetupCompat.SupportQueryResult(0, 0, 0L);
    }

    @Override // androidx.camera.featurecombinationquery.CameraDeviceSetupCompat
    public CameraDeviceSetupCompat.SupportQueryResult isSessionConfigurationSupportedLegacy(SessionConfigurationLegacy sessionConfig) {
        for (CameraDeviceSetupCompat impl : this.mCameraDeviceSetupImpls) {
            if (impl instanceof Camera2CameraDeviceSetupCompat) {
                throw new IllegalStateException("This device supports CameraDeviceSetup. Please use Camera2 SessionConfiguration for querying instead.");
            }
        }
        for (CameraDeviceSetupCompat impl2 : this.mCameraDeviceSetupImpls) {
            CameraDeviceSetupCompat.SupportQueryResult result = impl2.isSessionConfigurationSupportedLegacy(sessionConfig);
            if (result.getSupported() != 0) {
                return result;
            }
        }
        return new CameraDeviceSetupCompat.SupportQueryResult(0, 0, 0L);
    }
}
