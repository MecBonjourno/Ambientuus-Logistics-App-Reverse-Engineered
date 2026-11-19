package androidx.camera.core.internal.compat.quirk;

import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.QuirkSettings;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes.dex */
public class DeviceQuirksLoader {
    private DeviceQuirksLoader() {
    }

    static List<Quirk> loadQuirks(QuirkSettings quirkSettings) {
        List<Quirk> quirks = new ArrayList<>();
        if (quirkSettings.shouldEnableQuirk(ImageCaptureRotationOptionQuirk.class, ImageCaptureRotationOptionQuirk.load())) {
            quirks.add(new ImageCaptureRotationOptionQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(SurfaceOrderQuirk.class, SurfaceOrderQuirk.load())) {
            quirks.add(new SurfaceOrderQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CaptureFailedRetryQuirk.class, CaptureFailedRetryQuirk.load())) {
            quirks.add(new CaptureFailedRetryQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(LowMemoryQuirk.class, LowMemoryQuirk.load())) {
            quirks.add(new LowMemoryQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(LargeJpegImageQuirk.class, LargeJpegImageQuirk.load())) {
            quirks.add(new LargeJpegImageQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(IncorrectJpegMetadataQuirk.class, IncorrectJpegMetadataQuirk.load())) {
            quirks.add(new IncorrectJpegMetadataQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ImageCaptureFailedForSpecificCombinationQuirk.class, ImageCaptureFailedForSpecificCombinationQuirk.load())) {
            quirks.add(new ImageCaptureFailedForSpecificCombinationQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(PreviewGreenTintQuirk.class, PreviewGreenTintQuirk.load())) {
            quirks.add(PreviewGreenTintQuirk.INSTANCE);
        }
        return quirks;
    }
}
