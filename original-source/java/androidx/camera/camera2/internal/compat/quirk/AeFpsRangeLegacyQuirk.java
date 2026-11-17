package androidx.camera.camera2.internal.compat.quirk;

import android.hardware.camera2.CameraCharacteristics;
import android.util.Range;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.internal.compat.quirk.AeFpsRangeQuirk;

/* loaded from: classes.dex */
public class AeFpsRangeLegacyQuirk implements AeFpsRangeQuirk {
    private final Range<Integer> mAeFpsRange;

    public AeFpsRangeLegacyQuirk(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        Range<Integer>[] availableFpsRanges = (Range[]) cameraCharacteristicsCompat.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
        this.mAeFpsRange = pickSuitableFpsRange(availableFpsRanges);
    }

    static boolean load(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        Integer level = (Integer) cameraCharacteristicsCompat.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        return level != null && level.intValue() == 2;
    }

    private Range<Integer> pickSuitableFpsRange(Range<Integer>[] availableFpsRanges) {
        if (availableFpsRanges == null || availableFpsRanges.length == 0) {
            return null;
        }
        Range<Integer> pickedRange = null;
        for (Range<Integer> range : availableFpsRanges) {
            Range<Integer> fpsRange = getCorrectedFpsRange(range);
            if (fpsRange.getUpper().intValue() == 30) {
                if (pickedRange == null) {
                    pickedRange = fpsRange;
                } else if (fpsRange.getLower().intValue() < pickedRange.getLower().intValue()) {
                    pickedRange = fpsRange;
                }
            }
        }
        return pickedRange;
    }

    private Range<Integer> getCorrectedFpsRange(Range<Integer> fpsRange) {
        int newUpper = fpsRange.getUpper().intValue();
        int newLower = fpsRange.getLower().intValue();
        if (fpsRange.getUpper().intValue() >= 1000) {
            newUpper = fpsRange.getUpper().intValue() / 1000;
        }
        if (fpsRange.getLower().intValue() >= 1000) {
            newLower = fpsRange.getLower().intValue() / 1000;
        }
        return new Range<>(Integer.valueOf(newLower), Integer.valueOf(newUpper));
    }

    @Override // androidx.camera.core.internal.compat.quirk.AeFpsRangeQuirk
    public Range<Integer> getTargetAeFpsRange() {
        return this.mAeFpsRange != null ? this.mAeFpsRange : StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
    }
}
