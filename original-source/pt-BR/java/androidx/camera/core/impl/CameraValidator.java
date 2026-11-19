package androidx.camera.core.impl;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.Logger;
import java.util.Set;

/* carregado de: classes.dex */
public final class CameraValidator {
    private static final CameraSelector EXTERNAL_LENS_FACING = new CameraSelector.Builder().requireLensFacing(2).build();
    private static final String TAG = "CameraValidator";

    private CameraValidator() {
    }

    public static void validateCameras(Context context, CameraRepository cameraRepository, CameraSelector availableCamerasSelector) throws CameraIdListIncorrectException {
        if (Build.VERSION.SDK_INT >= 34 && Api34Impl.getDeviceId(context) != 0) {
            Set<CameraInternal> availableCameras = cameraRepository.getCameras();
            Logger.d(TAG, "Virtual device with ID: " + Api34Impl.getDeviceId(context) + " has " + availableCameras.size() + " cameras. Skipping validation.");
            return;
        }
        Integer lensFacing = null;
        if (availableCamerasSelector != null) {
            try {
                Integer lensFacing2 = availableCamerasSelector.getLensFacing();
                lensFacing = lensFacing2;
                if (lensFacing2 == null) {
                    Logger.w(TAG, "No lens facing info in the availableCamerasSelector, don't verify the camera lens facing.");
                    return;
                }
            } catch (IllegalStateException e) {
                Logger.e(TAG, "Cannot get lens facing from the availableCamerasSelector don't verify the camera lens facing.", e);
                return;
            }
        }
        Logger.d(TAG, "Verifying camera lens facing on " + Build.DEVICE + ", lensFacingInteger: " + lensFacing);
        PackageManager pm = context.getPackageManager();
        Throwable exception = null;
        int availableCameraCount = 0;
        try {
            if (pm.hasSystemFeature("android.hardware.camera") && (availableCamerasSelector == null || lensFacing.intValue() == 1)) {
                CameraSelector.DEFAULT_BACK_CAMERA.select(cameraRepository.getCameras());
                availableCameraCount = 0 + 1;
            }
        } catch (IllegalArgumentException e2) {
            Logger.w(TAG, "Camera LENS_FACING_BACK verification failed", e2);
            exception = e2;
        }
        try {
            if (pm.hasSystemFeature("android.hardware.camera.front") && (availableCamerasSelector == null || lensFacing.intValue() == 0)) {
                CameraSelector.DEFAULT_FRONT_CAMERA.select(cameraRepository.getCameras());
                availableCameraCount++;
            }
        } catch (IllegalArgumentException e3) {
            Logger.w(TAG, "Camera LENS_FACING_FRONT verification failed", e3);
            exception = e3;
        }
        try {
            EXTERNAL_LENS_FACING.select(cameraRepository.getCameras());
            Logger.d(TAG, "Found a LENS_FACING_EXTERNAL camera");
            availableCameraCount++;
        } catch (IllegalArgumentException e4) {
        }
        if (exception != null) {
            Logger.e(TAG, "Camera LensFacing verification failed, existing cameras: " + cameraRepository.getCameras());
            throw new CameraIdListIncorrectException("Expected camera missing from device.", availableCameraCount, exception);
        }
    }

    public static class CameraIdListIncorrectException extends Exception {
        private final int mAvailableCameraCount;

        public CameraIdListIncorrectException(String message, int availableCameraCount, Throwable cause) {
            super(message, cause);
            this.mAvailableCameraCount = availableCameraCount;
        }

        public int getAvailableCameraCount() {
            return this.mAvailableCameraCount;
        }
    }

    private static class Api34Impl {
        private Api34Impl() {
        }

        static int getDeviceId(Context context) {
            return context.getDeviceId();
        }
    }
}
