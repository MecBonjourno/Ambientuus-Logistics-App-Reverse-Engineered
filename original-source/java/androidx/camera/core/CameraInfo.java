package androidx.camera.core;

import android.util.Range;
import androidx.camera.core.internal.compat.MediaActionSoundCompat;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Set;

/* loaded from: classes.dex */
public interface CameraInfo {
    public static final String IMPLEMENTATION_TYPE_CAMERA2 = "androidx.camera.camera2";
    public static final String IMPLEMENTATION_TYPE_CAMERA2_LEGACY = "androidx.camera.camera2.legacy";
    public static final String IMPLEMENTATION_TYPE_FAKE = "androidx.camera.fake";
    public static final String IMPLEMENTATION_TYPE_UNKNOWN = "<unknown>";
    public static final float INTRINSIC_ZOOM_RATIO_UNKNOWN = 1.0f;
    public static final int TORCH_STRENGTH_LEVEL_UNSUPPORTED = 0;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ImplementationType {
    }

    CameraIdentifier getCameraIdentifier();

    CameraSelector getCameraSelector();

    LiveData<CameraState> getCameraState();

    ExposureState getExposureState();

    String getImplementationType();

    float getIntrinsicZoomRatio();

    int getLensFacing();

    LiveData<Integer> getLowLightBoostState();

    int getMaxTorchStrengthLevel();

    Set<CameraInfo> getPhysicalCameraInfos();

    int getSensorRotationDegrees();

    int getSensorRotationDegrees(int i);

    Set<Range<Integer>> getSupportedFrameRateRanges();

    Set<Range<Integer>> getSupportedFrameRateRanges(SessionConfig sessionConfig);

    LiveData<Integer> getTorchState();

    LiveData<Integer> getTorchStrengthLevel();

    LiveData<ZoomState> getZoomState();

    boolean hasFlashUnit();

    boolean isFeatureGroupSupported(SessionConfig sessionConfig);

    boolean isFocusMeteringSupported(FocusMeteringAction focusMeteringAction);

    boolean isLogicalMultiCameraSupported();

    boolean isLowLightBoostSupported();

    boolean isPrivateReprocessingSupported();

    boolean isTorchStrengthSupported();

    boolean isZslSupported();

    Set<DynamicRange> querySupportedDynamicRanges(Set<DynamicRange> set);

    /* renamed from: androidx.camera.core.CameraInfo$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static boolean mustPlayShutterSound() {
            return MediaActionSoundCompat.mustPlayShutterSound();
        }

        public static int $default$getLensFacing(CameraInfo _this) {
            return -1;
        }

        public static float $default$getIntrinsicZoomRatio(CameraInfo _this) {
            return 1.0f;
        }

        public static boolean $default$isFocusMeteringSupported(CameraInfo _this, FocusMeteringAction action) {
            return false;
        }

        public static boolean $default$isZslSupported(CameraInfo _this) {
            return false;
        }

        public static boolean $default$isLogicalMultiCameraSupported(CameraInfo _this) {
            return false;
        }

        public static boolean $default$isPrivateReprocessingSupported(CameraInfo _this) {
            return false;
        }

        public static int $default$getMaxTorchStrengthLevel(CameraInfo _this) {
            return 0;
        }

        public static LiveData $default$getTorchStrengthLevel(CameraInfo _this) {
            return new MutableLiveData(0);
        }

        public static boolean $default$isTorchStrengthSupported(CameraInfo _this) {
            return false;
        }

        public static boolean $default$isLowLightBoostSupported(CameraInfo _this) {
            return false;
        }

        public static LiveData $default$getLowLightBoostState(CameraInfo _this) {
            return new MutableLiveData(-1);
        }

        public static boolean $default$isFeatureGroupSupported(CameraInfo _this, SessionConfig sessionConfig) {
            return false;
        }

        public static CameraIdentifier $default$getCameraIdentifier(CameraInfo _this) {
            return null;
        }
    }
}
