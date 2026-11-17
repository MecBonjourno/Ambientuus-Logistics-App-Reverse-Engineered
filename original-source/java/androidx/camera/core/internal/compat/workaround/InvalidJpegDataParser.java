package androidx.camera.core.internal.compat.workaround;

import androidx.camera.core.internal.compat.quirk.DeviceQuirks;
import androidx.camera.core.internal.compat.quirk.LargeJpegImageQuirk;

/* loaded from: classes.dex */
public class InvalidJpegDataParser {
    private final LargeJpegImageQuirk mQuirk = (LargeJpegImageQuirk) DeviceQuirks.get(LargeJpegImageQuirk.class);

    public int getValidDataLength(byte[] bytes) {
        if (this.mQuirk == null || !this.mQuirk.shouldCheckInvalidJpegData(bytes)) {
            return bytes.length;
        }
        int jfifEoiMarkEndPosition = getJfifEoiMarkEndPosition(bytes);
        return jfifEoiMarkEndPosition != -1 ? jfifEoiMarkEndPosition : bytes.length;
    }

    public static int getJfifEoiMarkEndPosition(byte[] bytes) {
        int markPosition = 2;
        while (markPosition + 4 <= bytes.length && bytes[markPosition] == -1) {
            int segmentLength = ((bytes[markPosition + 2] & 255) << 8) | (bytes[markPosition + 3] & 255);
            if (bytes[markPosition] != -1 || bytes[markPosition + 1] != -38) {
                markPosition += segmentLength + 2;
            } else {
                for (int eoiPosition = markPosition + 2; eoiPosition + 2 <= bytes.length; eoiPosition++) {
                    if (bytes[eoiPosition] == -1 && bytes[eoiPosition + 1] == -39) {
                        return eoiPosition + 2;
                    }
                }
                return -1;
            }
        }
        return -1;
    }
}
