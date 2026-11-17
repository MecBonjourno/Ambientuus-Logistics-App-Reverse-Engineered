package androidx.camera.core.internal.compat.workaround;

import androidx.camera.core.UseCase;
import androidx.camera.core.internal.compat.quirk.DeviceQuirks;
import androidx.camera.core.internal.compat.quirk.ImageCaptureFailedForSpecificCombinationQuirk;
import androidx.camera.core.internal.compat.quirk.PreviewGreenTintQuirk;
import java.util.Collection;

/* loaded from: classes.dex */
public class StreamSharingForceEnabler {
    private final ImageCaptureFailedForSpecificCombinationQuirk mSpecificCombinationQuirk = (ImageCaptureFailedForSpecificCombinationQuirk) DeviceQuirks.get(ImageCaptureFailedForSpecificCombinationQuirk.class);
    private final PreviewGreenTintQuirk mPreviewGreenTintQuirk = (PreviewGreenTintQuirk) DeviceQuirks.get(PreviewGreenTintQuirk.class);

    public boolean shouldForceEnableStreamSharing(String cameraId, Collection<UseCase> appUseCases) {
        if (this.mSpecificCombinationQuirk != null) {
            return this.mSpecificCombinationQuirk.shouldForceEnableStreamSharing(cameraId, appUseCases);
        }
        if (this.mPreviewGreenTintQuirk != null) {
            return PreviewGreenTintQuirk.shouldForceEnableStreamSharing(cameraId, appUseCases);
        }
        return false;
    }
}
