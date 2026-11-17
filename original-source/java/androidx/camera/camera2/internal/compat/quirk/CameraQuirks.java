package androidx.camera.camera2.internal.compat.quirk;

import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.QuirkSettings;
import androidx.camera.core.impl.QuirkSettingsHolder;
import androidx.camera.core.impl.Quirks;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class CameraQuirks {
    private static final String TAG = "CameraQuirks";

    private CameraQuirks() {
    }

    public static Quirks get(String cameraId, CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        QuirkSettings quirkSettings = QuirkSettingsHolder.instance().get();
        List<Quirk> quirks = new ArrayList<>();
        if (quirkSettings.shouldEnableQuirk(AeFpsRangeLegacyQuirk.class, AeFpsRangeLegacyQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new AeFpsRangeLegacyQuirk(cameraCharacteristicsCompat));
        }
        if (quirkSettings.shouldEnableQuirk(AspectRatioLegacyApi21Quirk.class, AspectRatioLegacyApi21Quirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new AspectRatioLegacyApi21Quirk());
        }
        if (quirkSettings.shouldEnableQuirk(JpegHalCorruptImageQuirk.class, JpegHalCorruptImageQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new JpegHalCorruptImageQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(JpegCaptureDownsizingQuirk.class, JpegCaptureDownsizingQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new JpegCaptureDownsizingQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CamcorderProfileResolutionQuirk.class, CamcorderProfileResolutionQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new CamcorderProfileResolutionQuirk(cameraCharacteristicsCompat));
        }
        if (quirkSettings.shouldEnableQuirk(CaptureNoResponseQuirk.class, CaptureNoResponseQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new CaptureNoResponseQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(LegacyCameraOutputConfigNullPointerQuirk.class, LegacyCameraOutputConfigNullPointerQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new LegacyCameraOutputConfigNullPointerQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(LegacyCameraSurfaceCleanupQuirk.class, LegacyCameraSurfaceCleanupQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new LegacyCameraSurfaceCleanupQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ImageCaptureWashedOutImageQuirk.class, ImageCaptureWashedOutImageQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new ImageCaptureWashedOutImageQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CameraNoResponseWhenEnablingFlashQuirk.class, CameraNoResponseWhenEnablingFlashQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new CameraNoResponseWhenEnablingFlashQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(YuvImageOnePixelShiftQuirk.class, YuvImageOnePixelShiftQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new YuvImageOnePixelShiftQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(FlashTooSlowQuirk.class, FlashTooSlowQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new FlashTooSlowQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(AfRegionFlipHorizontallyQuirk.class, AfRegionFlipHorizontallyQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new AfRegionFlipHorizontallyQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ConfigureSurfaceToSecondarySessionFailQuirk.class, ConfigureSurfaceToSecondarySessionFailQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new ConfigureSurfaceToSecondarySessionFailQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(PreviewOrientationIncorrectQuirk.class, PreviewOrientationIncorrectQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new PreviewOrientationIncorrectQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CaptureSessionStuckQuirk.class, CaptureSessionStuckQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new CaptureSessionStuckQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ImageCaptureFlashNotFireQuirk.class, ImageCaptureFlashNotFireQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new ImageCaptureFlashNotFireQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ImageCaptureWithFlashUnderexposureQuirk.class, ImageCaptureWithFlashUnderexposureQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new ImageCaptureWithFlashUnderexposureQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ImageCaptureFailWithAutoFlashQuirk.class, ImageCaptureFailWithAutoFlashQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new ImageCaptureFailWithAutoFlashQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(IncorrectCaptureStateQuirk.class, IncorrectCaptureStateQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new IncorrectCaptureStateQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(TorchFlashRequiredFor3aUpdateQuirk.class, TorchFlashRequiredFor3aUpdateQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new TorchFlashRequiredFor3aUpdateQuirk(cameraCharacteristicsCompat));
        }
        if (quirkSettings.shouldEnableQuirk(PreviewStretchWhenVideoCaptureIsBoundQuirk.class, PreviewStretchWhenVideoCaptureIsBoundQuirk.load())) {
            quirks.add(new PreviewStretchWhenVideoCaptureIsBoundQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(PreviewDelayWhenVideoCaptureIsBoundQuirk.class, PreviewDelayWhenVideoCaptureIsBoundQuirk.load())) {
            quirks.add(new PreviewDelayWhenVideoCaptureIsBoundQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ImageCaptureFailedWhenVideoCaptureIsBoundQuirk.class, ImageCaptureFailedWhenVideoCaptureIsBoundQuirk.load())) {
            quirks.add(new ImageCaptureFailedWhenVideoCaptureIsBoundQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(TemporalNoiseQuirk.class, TemporalNoiseQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new TemporalNoiseQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ImageCaptureFailedForVideoSnapshotQuirk.class, ImageCaptureFailedForVideoSnapshotQuirk.load())) {
            quirks.add(new ImageCaptureFailedForVideoSnapshotQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CaptureSessionStuckWhenCreatingBeforeClosingCameraQuirk.class, CaptureSessionStuckWhenCreatingBeforeClosingCameraQuirk.load(cameraCharacteristicsCompat))) {
            quirks.add(new CaptureSessionStuckWhenCreatingBeforeClosingCameraQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(AbnormalStreamWhenImageAnalysisBindWithTemplateRecordQuirk.class, AbnormalStreamWhenImageAnalysisBindWithTemplateRecordQuirk.load())) {
            quirks.add(new AbnormalStreamWhenImageAnalysisBindWithTemplateRecordQuirk());
        }
        Quirks cameraQuirks = new Quirks(quirks);
        Logger.d(TAG, "camera2 CameraQuirks = " + Quirks.toString(cameraQuirks));
        return cameraQuirks;
    }
}
