package androidx.camera.video.internal.config;

import android.util.Range;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.internal.audio.AudioSettings;
import androidx.camera.video.internal.encoder.AudioEncoderConfig;
import androidx.core.util.Supplier;

/* carregado de: classes.dex */
public final class AudioEncoderConfigDefaultResolver implements Supplier<AudioEncoderConfig> {
    private static final int AUDIO_BITRATE_BASE = 156000;
    private static final int AUDIO_CHANNEL_COUNT_BASE = 2;
    private static final int AUDIO_SAMPLE_RATE_BASE = 48000;
    private static final String TAG = "AudioEncCfgDefaultRslvr";
    private final int mAudioProfile;
    private final AudioSettings mAudioSettings;
    private final AudioSpec mAudioSpec;
    private final Timebase mInputTimeBase;
    private final String mMimeType;

    public AudioEncoderConfigDefaultResolver(String mimeType, int audioProfile, Timebase inputTimebase, AudioSpec audioSpec, AudioSettings audioSettings) {
        this.mMimeType = mimeType;
        this.mAudioProfile = audioProfile;
        this.mInputTimeBase = inputTimebase;
        this.mAudioSpec = audioSpec;
        this.mAudioSettings = audioSettings;
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // androidx.core.util.Supplier
    public AudioEncoderConfig get() {
        Range<Integer> audioSpecBitrateRange = this.mAudioSpec.getBitrate();
        Logger.d(TAG, "Using fallback AUDIO bitrate");
        int resolvedBitrate = AudioConfigUtil.scaleAndClampBitrate(AUDIO_BITRATE_BASE, this.mAudioSettings.getChannelCount(), 2, this.mAudioSettings.getEncodeSampleRate(), AUDIO_SAMPLE_RATE_BASE, audioSpecBitrateRange);
        return AudioEncoderConfig.builder().setMimeType(this.mMimeType).setProfile(this.mAudioProfile).setInputTimebase(this.mInputTimeBase).setChannelCount(this.mAudioSettings.getChannelCount()).setCaptureSampleRate(this.mAudioSettings.getCaptureSampleRate()).setEncodeSampleRate(this.mAudioSettings.getEncodeSampleRate()).setBitrate(resolvedBitrate).build();
    }
}
