package androidx.camera.camera2.internal.compat.quirk;

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
        if (quirkSettings.shouldEnableQuirk(ImageCapturePixelHDRPlusQuirk.class, ImageCapturePixelHDRPlusQuirk.load())) {
            quirks.add(new ImageCapturePixelHDRPlusQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ExtraCroppingQuirk.class, ExtraCroppingQuirk.load())) {
            quirks.add(new ExtraCroppingQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(Nexus4AndroidLTargetAspectRatioQuirk.class, Nexus4AndroidLTargetAspectRatioQuirk.load())) {
            quirks.add(new Nexus4AndroidLTargetAspectRatioQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ExcludedSupportedSizesQuirk.class, ExcludedSupportedSizesQuirk.load())) {
            quirks.add(new ExcludedSupportedSizesQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CrashWhenTakingPhotoWithAutoFlashAEModeQuirk.class, CrashWhenTakingPhotoWithAutoFlashAEModeQuirk.load())) {
            quirks.add(new CrashWhenTakingPhotoWithAutoFlashAEModeQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(PreviewPixelHDRnetQuirk.class, PreviewPixelHDRnetQuirk.load())) {
            quirks.add(new PreviewPixelHDRnetQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(StillCaptureFlashStopRepeatingQuirk.class, StillCaptureFlashStopRepeatingQuirk.load())) {
            quirks.add(new StillCaptureFlashStopRepeatingQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ExtraSupportedSurfaceCombinationsQuirk.class, ExtraSupportedSurfaceCombinationsQuirk.load())) {
            quirks.add(new ExtraSupportedSurfaceCombinationsQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(FlashAvailabilityBufferUnderflowQuirk.class, FlashAvailabilityBufferUnderflowQuirk.load())) {
            quirks.add(new FlashAvailabilityBufferUnderflowQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(RepeatingStreamConstraintForVideoRecordingQuirk.class, RepeatingStreamConstraintForVideoRecordingQuirk.load())) {
            quirks.add(new RepeatingStreamConstraintForVideoRecordingQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(TextureViewIsClosedQuirk.class, TextureViewIsClosedQuirk.load())) {
            quirks.add(new TextureViewIsClosedQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CaptureSessionOnClosedNotCalledQuirk.class, CaptureSessionOnClosedNotCalledQuirk.load())) {
            quirks.add(new CaptureSessionOnClosedNotCalledQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(TorchIsClosedAfterImageCapturingQuirk.class, TorchIsClosedAfterImageCapturingQuirk.load())) {
            quirks.add(new TorchIsClosedAfterImageCapturingQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ZslDisablerQuirk.class, ZslDisablerQuirk.load())) {
            quirks.add(new ZslDisablerQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ExtraSupportedOutputSizeQuirk.class, ExtraSupportedOutputSizeQuirk.load())) {
            quirks.add(new ExtraSupportedOutputSizeQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(InvalidVideoProfilesQuirk.class, InvalidVideoProfilesQuirk.load())) {
            quirks.add(new InvalidVideoProfilesQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(Preview3AThreadCrashQuirk.class, Preview3AThreadCrashQuirk.load())) {
            quirks.add(new Preview3AThreadCrashQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(SmallDisplaySizeQuirk.class, SmallDisplaySizeQuirk.load())) {
            quirks.add(new SmallDisplaySizeQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(PreviewUnderExposureQuirk.class, PreviewUnderExposureQuirk.load())) {
            quirks.add(PreviewUnderExposureQuirk.INSTANCE);
        }
        if (quirkSettings.shouldEnableQuirk(CaptureSessionShouldUseMrirQuirk.class, CaptureSessionShouldUseMrirQuirk.load())) {
            quirks.add(new CaptureSessionShouldUseMrirQuirk());
        }
        return quirks;
    }
}
