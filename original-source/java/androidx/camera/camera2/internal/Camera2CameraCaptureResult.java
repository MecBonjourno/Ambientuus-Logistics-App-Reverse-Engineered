package androidx.camera.camera2.internal;

import android.hardware.camera2.CaptureResult;
import android.os.Build;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureMetaData;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.TagBundle;
import androidx.camera.core.impl.utils.ExifData;
import java.nio.BufferUnderflowException;

/* loaded from: classes.dex */
public class Camera2CameraCaptureResult implements CameraCaptureResult {
    private static final String TAG = "C2CameraCaptureResult";
    private final CaptureResult mCaptureResult;
    private final TagBundle mTagBundle;

    public Camera2CameraCaptureResult(TagBundle tagBundle, CaptureResult captureResult) {
        this.mTagBundle = tagBundle;
        this.mCaptureResult = captureResult;
    }

    public Camera2CameraCaptureResult(CaptureResult captureResult) {
        this(TagBundle.emptyBundle(), captureResult);
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AfMode getAfMode() {
        Integer mode = (Integer) this.mCaptureResult.get(CaptureResult.CONTROL_AF_MODE);
        if (mode == null) {
            return CameraCaptureMetaData.AfMode.UNKNOWN;
        }
        switch (mode.intValue()) {
            case 0:
            case 5:
                break;
            case 1:
            case 2:
                break;
            case 3:
            case 4:
                break;
            default:
                Logger.e(TAG, "Undefined af mode: " + mode);
                break;
        }
        return CameraCaptureMetaData.AfMode.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AfState getAfState() {
        Integer state = (Integer) this.mCaptureResult.get(CaptureResult.CONTROL_AF_STATE);
        if (state == null) {
            return CameraCaptureMetaData.AfState.UNKNOWN;
        }
        switch (state.intValue()) {
            case 0:
                break;
            case 1:
            case 3:
                break;
            case 2:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            default:
                Logger.e(TAG, "Undefined af state: " + state);
                break;
        }
        return CameraCaptureMetaData.AfState.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AeState getAeState() {
        Integer state = (Integer) this.mCaptureResult.get(CaptureResult.CONTROL_AE_STATE);
        if (state == null) {
            return CameraCaptureMetaData.AeState.UNKNOWN;
        }
        switch (state.intValue()) {
            case 0:
                break;
            case 1:
            case 5:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            default:
                Logger.e(TAG, "Undefined ae state: " + state);
                break;
        }
        return CameraCaptureMetaData.AeState.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AwbState getAwbState() {
        Integer state = (Integer) this.mCaptureResult.get(CaptureResult.CONTROL_AWB_STATE);
        if (state == null) {
            return CameraCaptureMetaData.AwbState.UNKNOWN;
        }
        switch (state.intValue()) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            default:
                Logger.e(TAG, "Undefined awb state: " + state);
                break;
        }
        return CameraCaptureMetaData.AwbState.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.FlashState getFlashState() {
        Integer state = (Integer) this.mCaptureResult.get(CaptureResult.FLASH_STATE);
        if (state == null) {
            return CameraCaptureMetaData.FlashState.UNKNOWN;
        }
        switch (state.intValue()) {
            case 0:
            case 1:
                break;
            case 2:
                break;
            case 3:
            case 4:
                break;
            default:
                Logger.e(TAG, "Undefined flash state: " + state);
                break;
        }
        return CameraCaptureMetaData.FlashState.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AeMode getAeMode() {
        Integer aeMode = (Integer) this.mCaptureResult.get(CaptureResult.CONTROL_AE_MODE);
        if (aeMode == null) {
            return CameraCaptureMetaData.AeMode.UNKNOWN;
        }
        switch (aeMode.intValue()) {
            case 5:
                if (Build.VERSION.SDK_INT < 28) {
                    break;
                } else {
                    break;
                }
        }
        return CameraCaptureMetaData.AeMode.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AwbMode getAwbMode() {
        Integer awbMode = (Integer) this.mCaptureResult.get(CaptureResult.CONTROL_AWB_MODE);
        if (awbMode == null) {
            return CameraCaptureMetaData.AwbMode.UNKNOWN;
        }
        switch (awbMode.intValue()) {
        }
        return CameraCaptureMetaData.AwbMode.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public long getTimestamp() {
        Long timestamp = (Long) this.mCaptureResult.get(CaptureResult.SENSOR_TIMESTAMP);
        if (timestamp == null) {
            return -1L;
        }
        return timestamp.longValue();
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public TagBundle getTagBundle() {
        return this.mTagBundle;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public void populateExifData(ExifData.Builder exifData) {
        Integer postRawSensitivityBoost;
        CameraCaptureResult.CC.$default$populateExifData(this, exifData);
        try {
            Integer jpegOrientation = (Integer) this.mCaptureResult.get(CaptureResult.JPEG_ORIENTATION);
            if (jpegOrientation != null) {
                exifData.setOrientationDegrees(jpegOrientation.intValue());
            }
        } catch (BufferUnderflowException e) {
            Logger.w(TAG, "Failed to get JPEG orientation.");
        }
        Long exposureTimeNs = (Long) this.mCaptureResult.get(CaptureResult.SENSOR_EXPOSURE_TIME);
        if (exposureTimeNs != null) {
            exifData.setExposureTimeNanos(exposureTimeNs.longValue());
        }
        Float aperture = (Float) this.mCaptureResult.get(CaptureResult.LENS_APERTURE);
        if (aperture != null) {
            exifData.setLensFNumber(aperture.floatValue());
        }
        Integer iso = (Integer) this.mCaptureResult.get(CaptureResult.SENSOR_SENSITIVITY);
        if (iso != null) {
            if (Build.VERSION.SDK_INT >= 24 && (postRawSensitivityBoost = (Integer) this.mCaptureResult.get(CaptureResult.CONTROL_POST_RAW_SENSITIVITY_BOOST)) != null) {
                iso = Integer.valueOf(iso.intValue() * ((int) (postRawSensitivityBoost.intValue() / 100.0f)));
            }
            exifData.setIso(iso.intValue());
        }
        Float focalLength = (Float) this.mCaptureResult.get(CaptureResult.LENS_FOCAL_LENGTH);
        if (focalLength != null) {
            exifData.setFocalLength(focalLength.floatValue());
        }
        Integer whiteBalanceMode = (Integer) this.mCaptureResult.get(CaptureResult.CONTROL_AWB_MODE);
        if (whiteBalanceMode != null) {
            ExifData.WhiteBalanceMode wbMode = ExifData.WhiteBalanceMode.AUTO;
            if (whiteBalanceMode.intValue() == 0) {
                wbMode = ExifData.WhiteBalanceMode.MANUAL;
            }
            exifData.setWhiteBalanceMode(wbMode);
        }
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CaptureResult getCaptureResult() {
        return this.mCaptureResult;
    }
}
