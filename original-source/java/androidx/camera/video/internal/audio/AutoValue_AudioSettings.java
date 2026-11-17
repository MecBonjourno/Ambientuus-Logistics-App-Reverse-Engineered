package androidx.camera.video.internal.audio;

import androidx.camera.video.internal.audio.AudioSettings;

/* loaded from: classes.dex */
final class AutoValue_AudioSettings extends AudioSettings {
    private final int audioFormat;
    private final int audioSource;
    private final int captureSampleRate;
    private final int channelCount;
    private final int encodeSampleRate;

    private AutoValue_AudioSettings(int audioSource, int captureSampleRate, int encodeSampleRate, int channelCount, int audioFormat) {
        this.audioSource = audioSource;
        this.captureSampleRate = captureSampleRate;
        this.encodeSampleRate = encodeSampleRate;
        this.channelCount = channelCount;
        this.audioFormat = audioFormat;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getAudioSource() {
        return this.audioSource;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getCaptureSampleRate() {
        return this.captureSampleRate;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getEncodeSampleRate() {
        return this.encodeSampleRate;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getChannelCount() {
        return this.channelCount;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getAudioFormat() {
        return this.audioFormat;
    }

    public String toString() {
        return "AudioSettings{audioSource=" + this.audioSource + ", captureSampleRate=" + this.captureSampleRate + ", encodeSampleRate=" + this.encodeSampleRate + ", channelCount=" + this.channelCount + ", audioFormat=" + this.audioFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof AudioSettings)) {
            return false;
        }
        AudioSettings that = (AudioSettings) o;
        return this.audioSource == that.getAudioSource() && this.captureSampleRate == that.getCaptureSampleRate() && this.encodeSampleRate == that.getEncodeSampleRate() && this.channelCount == that.getChannelCount() && this.audioFormat == that.getAudioFormat();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((h$ ^ this.audioSource) * 1000003) ^ this.captureSampleRate) * 1000003) ^ this.encodeSampleRate) * 1000003) ^ this.channelCount) * 1000003) ^ this.audioFormat;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public AudioSettings.Builder toBuilder() {
        return new Builder(this);
    }

    static final class Builder extends AudioSettings.Builder {
        private Integer audioFormat;
        private Integer audioSource;
        private Integer captureSampleRate;
        private Integer channelCount;
        private Integer encodeSampleRate;

        Builder() {
        }

        private Builder(AudioSettings source) {
            this.audioSource = Integer.valueOf(source.getAudioSource());
            this.captureSampleRate = Integer.valueOf(source.getCaptureSampleRate());
            this.encodeSampleRate = Integer.valueOf(source.getEncodeSampleRate());
            this.channelCount = Integer.valueOf(source.getChannelCount());
            this.audioFormat = Integer.valueOf(source.getAudioFormat());
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setAudioSource(int audioSource) {
            this.audioSource = Integer.valueOf(audioSource);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setCaptureSampleRate(int captureSampleRate) {
            this.captureSampleRate = Integer.valueOf(captureSampleRate);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setEncodeSampleRate(int encodeSampleRate) {
            this.encodeSampleRate = Integer.valueOf(encodeSampleRate);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setChannelCount(int channelCount) {
            this.channelCount = Integer.valueOf(channelCount);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setAudioFormat(int audioFormat) {
            this.audioFormat = Integer.valueOf(audioFormat);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        AudioSettings autoBuild() {
            String missing = this.audioSource == null ? " audioSource" : "";
            if (this.captureSampleRate == null) {
                missing = missing + " captureSampleRate";
            }
            if (this.encodeSampleRate == null) {
                missing = missing + " encodeSampleRate";
            }
            if (this.channelCount == null) {
                missing = missing + " channelCount";
            }
            if (this.audioFormat == null) {
                missing = missing + " audioFormat";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_AudioSettings(this.audioSource.intValue(), this.captureSampleRate.intValue(), this.encodeSampleRate.intValue(), this.channelCount.intValue(), this.audioFormat.intValue());
        }
    }
}
