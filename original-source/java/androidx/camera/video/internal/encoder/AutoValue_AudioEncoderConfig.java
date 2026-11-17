package androidx.camera.video.internal.encoder;

import androidx.camera.core.impl.Timebase;
import androidx.camera.video.internal.encoder.AudioEncoderConfig;

/* loaded from: classes.dex */
final class AutoValue_AudioEncoderConfig extends AudioEncoderConfig {
    private final int bitrate;
    private final int captureSampleRate;
    private final int channelCount;
    private final int encodeSampleRate;
    private final Timebase inputTimebase;
    private final String mimeType;
    private final int profile;

    private AutoValue_AudioEncoderConfig(String mimeType, int profile, Timebase inputTimebase, int bitrate, int captureSampleRate, int encodeSampleRate, int channelCount) {
        this.mimeType = mimeType;
        this.profile = profile;
        this.inputTimebase = inputTimebase;
        this.bitrate = bitrate;
        this.captureSampleRate = captureSampleRate;
        this.encodeSampleRate = encodeSampleRate;
        this.channelCount = channelCount;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public String getMimeType() {
        return this.mimeType;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public int getProfile() {
        return this.profile;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public Timebase getInputTimebase() {
        return this.inputTimebase;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig
    public int getBitrate() {
        return this.bitrate;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig
    public int getCaptureSampleRate() {
        return this.captureSampleRate;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig
    public int getEncodeSampleRate() {
        return this.encodeSampleRate;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig
    public int getChannelCount() {
        return this.channelCount;
    }

    public String toString() {
        return "AudioEncoderConfig{mimeType=" + this.mimeType + ", profile=" + this.profile + ", inputTimebase=" + this.inputTimebase + ", bitrate=" + this.bitrate + ", captureSampleRate=" + this.captureSampleRate + ", encodeSampleRate=" + this.encodeSampleRate + ", channelCount=" + this.channelCount + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof AudioEncoderConfig)) {
            return false;
        }
        AudioEncoderConfig that = (AudioEncoderConfig) o;
        return this.mimeType.equals(that.getMimeType()) && this.profile == that.getProfile() && this.inputTimebase.equals(that.getInputTimebase()) && this.bitrate == that.getBitrate() && this.captureSampleRate == that.getCaptureSampleRate() && this.encodeSampleRate == that.getEncodeSampleRate() && this.channelCount == that.getChannelCount();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((h$ ^ this.mimeType.hashCode()) * 1000003) ^ this.profile) * 1000003) ^ this.inputTimebase.hashCode()) * 1000003) ^ this.bitrate) * 1000003) ^ this.captureSampleRate) * 1000003) ^ this.encodeSampleRate) * 1000003) ^ this.channelCount;
    }

    static final class Builder extends AudioEncoderConfig.Builder {
        private Integer bitrate;
        private Integer captureSampleRate;
        private Integer channelCount;
        private Integer encodeSampleRate;
        private Timebase inputTimebase;
        private String mimeType;
        private Integer profile;

        Builder() {
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setMimeType(String mimeType) {
            if (mimeType == null) {
                throw new NullPointerException("Null mimeType");
            }
            this.mimeType = mimeType;
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setProfile(int profile) {
            this.profile = Integer.valueOf(profile);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setInputTimebase(Timebase inputTimebase) {
            if (inputTimebase == null) {
                throw new NullPointerException("Null inputTimebase");
            }
            this.inputTimebase = inputTimebase;
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setBitrate(int bitrate) {
            this.bitrate = Integer.valueOf(bitrate);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setCaptureSampleRate(int captureSampleRate) {
            this.captureSampleRate = Integer.valueOf(captureSampleRate);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setEncodeSampleRate(int encodeSampleRate) {
            this.encodeSampleRate = Integer.valueOf(encodeSampleRate);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setChannelCount(int channelCount) {
            this.channelCount = Integer.valueOf(channelCount);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        AudioEncoderConfig autoBuild() {
            String missing = this.mimeType == null ? " mimeType" : "";
            if (this.profile == null) {
                missing = missing + " profile";
            }
            if (this.inputTimebase == null) {
                missing = missing + " inputTimebase";
            }
            if (this.bitrate == null) {
                missing = missing + " bitrate";
            }
            if (this.captureSampleRate == null) {
                missing = missing + " captureSampleRate";
            }
            if (this.encodeSampleRate == null) {
                missing = missing + " encodeSampleRate";
            }
            if (this.channelCount == null) {
                missing = missing + " channelCount";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_AudioEncoderConfig(this.mimeType, this.profile.intValue(), this.inputTimebase, this.bitrate.intValue(), this.captureSampleRate.intValue(), this.encodeSampleRate.intValue(), this.channelCount.intValue());
        }
    }
}
