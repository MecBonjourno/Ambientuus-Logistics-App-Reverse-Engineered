package androidx.camera.camera2.internal.compat.workaround;

import android.hardware.camera2.CaptureRequest;
import androidx.camera.camera2.internal.compat.quirk.CaptureIntentPreviewQuirk;
import androidx.camera.camera2.internal.compat.quirk.ImageCaptureFailedForVideoSnapshotQuirk;
import androidx.camera.core.impl.Quirks;
import j$.util.DesugarCollections;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public class TemplateParamsOverride {
    private final boolean mWorkaroundByCaptureIntentPreview;
    private final boolean mWorkaroundByCaptureIntentStillCapture;

    public TemplateParamsOverride(Quirks quirks) {
        this.mWorkaroundByCaptureIntentPreview = CaptureIntentPreviewQuirk.CC.workaroundByCaptureIntentPreview(quirks);
        this.mWorkaroundByCaptureIntentStillCapture = quirks.contains(ImageCaptureFailedForVideoSnapshotQuirk.class);
    }

    public Map<CaptureRequest.Key<?>, Object> getOverrideParams(int template) {
        if (template == 3 && this.mWorkaroundByCaptureIntentPreview) {
            Map<CaptureRequest.Key<?>, Object> params = new HashMap<>();
            params.put(CaptureRequest.CONTROL_CAPTURE_INTENT, 1);
            return DesugarCollections.unmodifiableMap(params);
        }
        if (template == 4 && this.mWorkaroundByCaptureIntentStillCapture) {
            Map<CaptureRequest.Key<?>, Object> params2 = new HashMap<>();
            params2.put(CaptureRequest.CONTROL_CAPTURE_INTENT, 2);
            return DesugarCollections.unmodifiableMap(params2);
        }
        return Collections.emptyMap();
    }
}
