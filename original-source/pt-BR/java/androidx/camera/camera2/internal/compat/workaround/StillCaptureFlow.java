package androidx.camera.camera2.internal.compat.workaround;

import android.hardware.camera2.CaptureRequest;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.StillCaptureFlashStopRepeatingQuirk;
import java.util.List;

/* carregado de: classes.dex */
public class StillCaptureFlow {
    private final boolean mShouldStopRepeatingBeforeStillCapture;

    public StillCaptureFlow() {
        StillCaptureFlashStopRepeatingQuirk quirk = (StillCaptureFlashStopRepeatingQuirk) DeviceQuirks.get(StillCaptureFlashStopRepeatingQuirk.class);
        this.mShouldStopRepeatingBeforeStillCapture = quirk != null;
    }

    public boolean shouldStopRepeatingBeforeCapture(List<CaptureRequest> captureRequests, boolean isStillCapture) {
        if (!this.mShouldStopRepeatingBeforeStillCapture || !isStillCapture) {
            return false;
        }
        for (CaptureRequest request : captureRequests) {
            int aeMode = ((Integer) request.get(CaptureRequest.CONTROL_AE_MODE)).intValue();
            if (aeMode == 2 || aeMode == 3) {
                return true;
            }
        }
        return false;
    }
}
