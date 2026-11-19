package androidx.camera.featurecombinationquery;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.params.SessionConfiguration;
import androidx.camera.featurecombinationquery.CameraDeviceSetupCompat;

/* carregado de: classes.dex */
class Camera2CameraDeviceSetupCompat implements CameraDeviceSetupCompat {
    private final CameraDevice.CameraDeviceSetup mCameraDeviceSetup;

    Camera2CameraDeviceSetupCompat(CameraManager cameraManager, String cameraId) throws CameraAccessException {
        this.mCameraDeviceSetup = cameraManager.getCameraDeviceSetup(cameraId);
    }

    @Override // androidx.camera.featurecombinationquery.CameraDeviceSetupCompat
    public CameraDeviceSetupCompat.SupportQueryResult isSessionConfigurationSupported(SessionConfiguration sessionConfig) throws CameraAccessException {
        return new CameraDeviceSetupCompat.SupportQueryResult(this.mCameraDeviceSetup.isSessionConfigurationSupported(sessionConfig) ? 1 : 2, 2, getBuildTimeEpochMillis());
    }

    @Override // androidx.camera.featurecombinationquery.CameraDeviceSetupCompat
    public CameraDeviceSetupCompat.SupportQueryResult isSessionConfigurationSupportedLegacy(SessionConfigurationLegacy sessionConfig) {
        throw new IllegalStateException("This device supports CameraDeviceSetup. Please use Camera2 SessionConfiguration for querying instead.");
    }

    public static long getBuildTimeEpochMillis() {
        String value = System.getProperty("ro.build.date.utc");
        if (value != null) {
            try {
                return Long.parseLong(value) * 1000;
            } catch (NumberFormatException e) {
                return 0L;
            }
        }
        return 0L;
    }
}
