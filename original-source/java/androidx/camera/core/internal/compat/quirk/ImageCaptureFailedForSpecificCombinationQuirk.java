package androidx.camera.core.internal.compat.quirk;

import android.os.Build;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* loaded from: classes.dex */
public final class ImageCaptureFailedForSpecificCombinationQuirk implements Quirk {
    private static final Set<String> PIXEL_MODELS = new HashSet(Arrays.asList("pixel 4a", "pixel 4a (5g)", "pixel 5", "pixel 5a"));

    static boolean load() {
        return isOnePlus12() || isPixelProblematicDevice();
    }

    private static boolean isOnePlus12() {
        return "oneplus".equalsIgnoreCase(Build.BRAND) && "cph2583".equalsIgnoreCase(Build.MODEL);
    }

    private static boolean isPixelProblematicDevice() {
        return "google".equalsIgnoreCase(Build.BRAND) && PIXEL_MODELS.contains(Build.MODEL.toLowerCase());
    }

    public boolean shouldForceEnableStreamSharing(String cameraId, Collection<UseCase> appUseCases) {
        if (isOnePlus12()) {
            return shouldForceEnableStreamSharingForOnePlus12(cameraId, appUseCases);
        }
        if (isPixelProblematicDevice()) {
            return shouldForceEnableStreamSharingForPixelDevice(cameraId, appUseCases);
        }
        return false;
    }

    private boolean shouldForceEnableStreamSharingForOnePlus12(String cameraId, Collection<UseCase> appUseCases) {
        return cameraId.equals("1") && isVideoCapturePreviewImageCaptureCombination(appUseCases);
    }

    private boolean shouldForceEnableStreamSharingForPixelDevice(String cameraId, Collection<UseCase> appUseCases) {
        return cameraId.equals("1") && isVideoCapturePreviewImageCaptureCombination(appUseCases);
    }

    private boolean isVideoCapturePreviewImageCaptureCombination(Collection<UseCase> appUseCases) {
        if (appUseCases.size() != 3) {
            return false;
        }
        boolean hasPreview = false;
        boolean hasVideoCapture = false;
        boolean hasImageCapture = false;
        Iterator<UseCase> it = appUseCases.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            UseCase useCase = it.next();
            if (useCase instanceof Preview) {
                hasPreview = true;
            } else if (useCase instanceof ImageCapture) {
                hasImageCapture = true;
            } else if (useCase.getCurrentConfig().containsOption(UseCaseConfig.OPTION_CAPTURE_TYPE)) {
                hasVideoCapture = useCase.getCurrentConfig().getCaptureType() == UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE;
            }
        }
        return hasPreview && hasVideoCapture && hasImageCapture;
    }
}
