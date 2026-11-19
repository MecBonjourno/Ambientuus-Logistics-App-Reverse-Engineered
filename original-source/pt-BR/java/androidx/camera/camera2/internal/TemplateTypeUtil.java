package androidx.camera.camera2.internal;

import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.PreviewUnderExposureQuirk;
import androidx.camera.core.impl.UseCaseConfigFactory;

/* carregado de: classes.dex */
public class TemplateTypeUtil {
    private TemplateTypeUtil() {
    }

    public static int getSessionConfigTemplateType(UseCaseConfigFactory.CaptureType captureType, int captureMode) {
        switch (captureType) {
            case IMAGE_CAPTURE:
                if (captureMode == 2) {
                }
                break;
            case VIDEO_CAPTURE:
                if (DeviceQuirks.get(PreviewUnderExposureQuirk.class) != null) {
                }
                break;
        }
        return 1;
    }

    public static int getCaptureConfigTemplateType(UseCaseConfigFactory.CaptureType captureType, int captureMode) {
        switch (captureType) {
            case IMAGE_CAPTURE:
                if (captureMode == 2) {
                }
                break;
            case VIDEO_CAPTURE:
                if (DeviceQuirks.get(PreviewUnderExposureQuirk.class) != null) {
                }
                break;
        }
        return 1;
    }
}
