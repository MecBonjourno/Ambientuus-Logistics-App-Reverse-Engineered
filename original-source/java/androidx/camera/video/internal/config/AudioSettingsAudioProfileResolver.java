package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Rational;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.internal.audio.AudioSettings;
import androidx.core.util.Supplier;

/* loaded from: classes.dex */
public final class AudioSettingsAudioProfileResolver implements Supplier<AudioSettings> {
    private static final String TAG = "AudioSrcAdPrflRslvr";
    private final EncoderProfilesProxy.AudioProfileProxy mAudioProfile;
    private final AudioSpec mAudioSpec;
    private final Rational mCaptureToEncodeRatio;

    public AudioSettingsAudioProfileResolver(AudioSpec audioSpec, EncoderProfilesProxy.AudioProfileProxy audioProfile, Rational captureToEncodeRatio) {
        this.mAudioSpec = audioSpec;
        this.mAudioProfile = audioProfile;
        this.mCaptureToEncodeRatio = captureToEncodeRatio;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.core.util.Supplier
    public AudioSettings get() {
        int resolvedChannelCount;
        int resolvedAudioSource = AudioConfigUtil.resolveAudioSource(this.mAudioSpec);
        int resolvedSourceFormat = AudioConfigUtil.resolveAudioSourceFormat(this.mAudioSpec);
        int audioSpecChannelCount = this.mAudioSpec.getChannelCount();
        int audioProfileChannelCount = this.mAudioProfile.getChannels();
        if (audioSpecChannelCount == -1) {
            resolvedChannelCount = audioProfileChannelCount;
            Logger.d(TAG, "Resolved AUDIO channel count from AudioProfile: " + resolvedChannelCount);
        } else {
            resolvedChannelCount = audioSpecChannelCount;
            Logger.d(TAG, "Media spec AUDIO channel count overrides AudioProfile [AudioProfile channel count: " + audioProfileChannelCount + ", Resolved Channel Count: " + resolvedChannelCount + "]");
        }
        Range<Integer> audioSpecSampleRate = this.mAudioSpec.getSampleRate();
        int audioProfileSampleRate = this.mAudioProfile.getSampleRate();
        CaptureEncodeRates resolvedSampleRates = AudioConfigUtil.resolveSampleRates(audioSpecSampleRate, audioProfileSampleRate, resolvedChannelCount, resolvedSourceFormat, this.mCaptureToEncodeRatio);
        Logger.d(TAG, "Using resolved AUDIO sample rate or nearest supported from AudioProfile: Capture sample rate: " + resolvedSampleRates.getCaptureRate() + "Hz. Encode sample rate: " + resolvedSampleRates.getEncodeRate() + "Hz. [AudioProfile sample rate: " + audioProfileSampleRate + "Hz]");
        return AudioSettings.builder().setAudioSource(resolvedAudioSource).setAudioFormat(resolvedSourceFormat).setChannelCount(resolvedChannelCount).setCaptureSampleRate(resolvedSampleRates.getCaptureRate()).setEncodeSampleRate(resolvedSampleRates.getEncodeRate()).build();
    }
}
