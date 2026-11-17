package androidx.camera.core.internal.compat.workaround;

import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.internal.compat.quirk.DeviceQuirks;
import androidx.camera.core.internal.compat.quirk.ImageCaptureRotationOptionQuirk;
import androidx.camera.core.internal.utils.ImageUtil;

/* loaded from: classes.dex */
public class ExifRotationAvailability {
    public boolean isRotationOptionSupported() {
        ImageCaptureRotationOptionQuirk quirk = (ImageCaptureRotationOptionQuirk) DeviceQuirks.get(ImageCaptureRotationOptionQuirk.class);
        return quirk == null || quirk.isSupported(CaptureConfig.OPTION_ROTATION);
    }

    public boolean shouldUseExifOrientation(ImageProxy image) {
        return isRotationOptionSupported() && ImageUtil.isJpegFormats(image.getFormat());
    }
}
