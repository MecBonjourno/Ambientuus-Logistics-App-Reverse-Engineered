package androidx.camera.video.internal.compat.quirk;

import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.QuirkSettings;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class DeviceQuirksLoader {
    private DeviceQuirksLoader() {
    }

    static List<Quirk> loadQuirks(QuirkSettings quirkSettings) {
        List<Quirk> quirks = new ArrayList<>();
        if (quirkSettings.shouldEnableQuirk(MediaFormatMustNotUseFrameRateToFindEncoderQuirk.class, MediaFormatMustNotUseFrameRateToFindEncoderQuirk.load())) {
            quirks.add(new MediaFormatMustNotUseFrameRateToFindEncoderQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(MediaCodecInfoReportIncorrectInfoQuirk.class, MediaCodecInfoReportIncorrectInfoQuirk.load())) {
            quirks.add(new MediaCodecInfoReportIncorrectInfoQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(DeactivateEncoderSurfaceBeforeStopEncoderQuirk.class, DeactivateEncoderSurfaceBeforeStopEncoderQuirk.load())) {
            quirks.add(new DeactivateEncoderSurfaceBeforeStopEncoderQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CameraUseInconsistentTimebaseQuirk.class, CameraUseInconsistentTimebaseQuirk.load())) {
            quirks.add(new CameraUseInconsistentTimebaseQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ReportedVideoQualityNotSupportedQuirk.class, ReportedVideoQualityNotSupportedQuirk.load())) {
            quirks.add(new ReportedVideoQualityNotSupportedQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(EncoderNotUsePersistentInputSurfaceQuirk.class, EncoderNotUsePersistentInputSurfaceQuirk.load())) {
            quirks.add(new EncoderNotUsePersistentInputSurfaceQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(VideoEncoderCrashQuirk.class, VideoEncoderCrashQuirk.load())) {
            quirks.add(new VideoEncoderCrashQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ExcludeStretchedVideoQualityQuirk.class, ExcludeStretchedVideoQualityQuirk.load())) {
            quirks.add(new ExcludeStretchedVideoQualityQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(MediaStoreVideoCannotWrite.class, MediaStoreVideoCannotWrite.load())) {
            quirks.add(new MediaStoreVideoCannotWrite());
        }
        if (quirkSettings.shouldEnableQuirk(AudioEncoderIgnoresInputTimestampQuirk.class, AudioEncoderIgnoresInputTimestampQuirk.load())) {
            quirks.add(new AudioEncoderIgnoresInputTimestampQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk.class, VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk.load())) {
            quirks.add(new VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(NegativeLatLongSavesIncorrectlyQuirk.class, NegativeLatLongSavesIncorrectlyQuirk.load())) {
            quirks.add(new NegativeLatLongSavesIncorrectlyQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(AudioTimestampFramePositionIncorrectQuirk.class, AudioTimestampFramePositionIncorrectQuirk.load())) {
            quirks.add(new AudioTimestampFramePositionIncorrectQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ExtraSupportedResolutionQuirk.class, ExtraSupportedResolutionQuirk.load())) {
            quirks.add(new ExtraSupportedResolutionQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(StretchedVideoResolutionQuirk.class, StretchedVideoResolutionQuirk.load())) {
            quirks.add(new StretchedVideoResolutionQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(CodecStuckOnFlushQuirk.class, CodecStuckOnFlushQuirk.load())) {
            quirks.add(new CodecStuckOnFlushQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(StopCodecAfterSurfaceRemovalCrashMediaServerQuirk.class, StopCodecAfterSurfaceRemovalCrashMediaServerQuirk.load())) {
            quirks.add(new StopCodecAfterSurfaceRemovalCrashMediaServerQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(ExtraSupportedQualityQuirk.class, ExtraSupportedQualityQuirk.load())) {
            quirks.add(new ExtraSupportedQualityQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(SignalEosOutputBufferNotComeQuirk.class, SignalEosOutputBufferNotComeQuirk.load())) {
            quirks.add(new SignalEosOutputBufferNotComeQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(SizeCannotEncodeVideoQuirk.class, SizeCannotEncodeVideoQuirk.load())) {
            quirks.add(new SizeCannotEncodeVideoQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(PreviewBlackScreenQuirk.class, PreviewBlackScreenQuirk.load())) {
            quirks.add(new PreviewBlackScreenQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(PrematureEndOfStreamVideoQuirk.class, PrematureEndOfStreamVideoQuirk.load())) {
            quirks.add(PrematureEndOfStreamVideoQuirk.INSTANCE);
        }
        if (quirkSettings.shouldEnableQuirk(MediaCodecDefaultDataSpaceQuirk.class, MediaCodecDefaultDataSpaceQuirk.load())) {
            quirks.add(new MediaCodecDefaultDataSpaceQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(HdrRepeatingRequestFailureQuirk.class, HdrRepeatingRequestFailureQuirk.load())) {
            quirks.add(new HdrRepeatingRequestFailureQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(PreviewFreezeAfterHighSpeedRecordingQuirk.class, PreviewFreezeAfterHighSpeedRecordingQuirk.load())) {
            quirks.add(PreviewFreezeAfterHighSpeedRecordingQuirk.INSTANCE);
        }
        return quirks;
    }
}
