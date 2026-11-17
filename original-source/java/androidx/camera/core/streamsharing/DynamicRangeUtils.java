package androidx.camera.core.streamsharing;

import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.UseCaseConfig;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/* loaded from: classes.dex */
public class DynamicRangeUtils {
    private DynamicRangeUtils() {
    }

    public static DynamicRange resolveDynamicRange(Set<UseCaseConfig<?>> useCaseConfigs) {
        List<DynamicRange> dynamicRanges = new ArrayList<>();
        for (UseCaseConfig<?> useCaseConfig : useCaseConfigs) {
            dynamicRanges.add(useCaseConfig.getDynamicRange());
        }
        return intersectDynamicRange(dynamicRanges);
    }

    private static DynamicRange intersectDynamicRange(List<DynamicRange> dynamicRanges) {
        if (dynamicRanges.isEmpty()) {
            return null;
        }
        DynamicRange firstDynamicRange = dynamicRanges.get(0);
        Integer resultEncoding = Integer.valueOf(firstDynamicRange.getEncoding());
        Integer resultBitDepth = Integer.valueOf(firstDynamicRange.getBitDepth());
        for (int i = 1; i < dynamicRanges.size(); i++) {
            DynamicRange childDynamicRange = dynamicRanges.get(i);
            resultEncoding = intersectDynamicRangeEncoding(resultEncoding, Integer.valueOf(childDynamicRange.getEncoding()));
            resultBitDepth = intersectDynamicRangeBitDepth(resultBitDepth, Integer.valueOf(childDynamicRange.getBitDepth()));
            if (resultEncoding == null || resultBitDepth == null) {
                return null;
            }
        }
        return new DynamicRange(resultEncoding.intValue(), resultBitDepth.intValue());
    }

    private static Integer intersectDynamicRangeEncoding(Integer encoding1, Integer encoding2) {
        if (encoding1.equals(0)) {
            return encoding2;
        }
        if (encoding2.equals(0)) {
            return encoding1;
        }
        if (encoding1.equals(2) && !encoding2.equals(1)) {
            return encoding2;
        }
        if (encoding2.equals(2) && !encoding1.equals(1)) {
            return encoding1;
        }
        if (encoding1.equals(encoding2)) {
            return encoding1;
        }
        return null;
    }

    private static Integer intersectDynamicRangeBitDepth(Integer bitDepth1, Integer bitDepth2) {
        if (bitDepth1.equals(0)) {
            return bitDepth2;
        }
        if (bitDepth2.equals(0)) {
            return bitDepth1;
        }
        if (bitDepth1.equals(bitDepth2)) {
            return bitDepth1;
        }
        return null;
    }
}
