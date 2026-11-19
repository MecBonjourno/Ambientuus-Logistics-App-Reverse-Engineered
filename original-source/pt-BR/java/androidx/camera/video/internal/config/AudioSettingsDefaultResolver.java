package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Rational;
import androidx.camera.core.Logger;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.internal.audio.AudioSettings;
import androidx.camera.video.internal.workaround.DefaultEncoderProfilesProvider;
import androidx.core.util.Supplier;

/* carregado de: classes.dex */
public final class AudioSettingsDefaultResolver implements Supplier<AudioSettings> {
    private static final String TAG = "DefAudioResolver";
    private final AudioSpec mAudioSpec;
    private final Rational mCaptureToEncodeRatio;

    public AudioSettingsDefaultResolver(AudioSpec audioSpec, Rational captureToEncodeRatio) {
        this.mAudioSpec = audioSpec;
        this.mCaptureToEncodeRatio = captureToEncodeRatio;
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // androidx.core.util.Supplier
    public AudioSettings get() {
        int resolvedChannelCount;
        int targetSampleRate;
        int resolvedAudioSource = AudioConfigUtil.resolveAudioSource(this.mAudioSpec);
        int resolvedSourceFormat = AudioConfigUtil.resolveAudioSourceFormat(this.mAudioSpec);
        int audioSpecChannelCount = this.mAudioSpec.getChannelCount();
        if (audioSpecChannelCount == -1) {
            resolvedChannelCount = 1;
            Logger.d(TAG, "Using fallback AUDIO channel count: 1");
        } else {
            resolvedChannelCount = audioSpecChannelCount;
            Logger.d(TAG, "Using supplied AUDIO channel count: " + audioSpecChannelCount);
        }
        Range<Integer> audioSpecSampleRateRange = this.mAudioSpec.getSampleRate();
        if (AudioSpec.SAMPLE_RATE_RANGE_AUTO.equals(audioSpecSampleRateRange)) {
            targetSampleRate = DefaultEncoderProfilesProvider.DEFAULT_AUDIO_SAMPLE_RATE;
        } else {
            targetSampleRate = audioSpecSampleRateRange.getUpper().intValue();
        }
        CaptureEncodeRates resolvedSampleRates = AudioConfigUtil.resolveSampleRates(audioSpecSampleRateRange, targetSampleRate, resolvedChannelCount, resolvedAudioSource, this.mCaptureToEncodeRatio);
        Logger.d(TAG, "Using AUDIO sample rate resolved from AudioSpec: Capture sample rate: " + resolvedSampleRates.getCaptureRate() + "Hz. Encode sample rate: " + resolvedSampleRates.getEncodeRate() + "Hz.");
        return AudioSettings.builder().setAudioSource(resolvedAudioSource).setAudioFormat(resolvedSourceFormat).setChannelCount(resolvedChannelCount).setCaptureSampleRate(resolvedSampleRates.getCaptureRate()).setEncodeSampleRate(resolvedSampleRates.getEncodeRate()).build();
    }
}
