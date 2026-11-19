package androidx.camera.video.internal.encoder;

import android.media.MediaFormat;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.internal.encoder.AutoValue_AudioEncoderConfig;
import androidx.camera.video.internal.workaround.DefaultEncoderProfilesProvider;
import com.google.android.gms.common.Scopes;
import j$.util.Objects;

/* carregado de: classes.dex */
public abstract class AudioEncoderConfig implements EncoderConfig {
    public abstract int getBitrate();

    public abstract int getCaptureSampleRate();

    public abstract int getChannelCount();

    public abstract int getEncodeSampleRate();

    @Override // androidx.camera.video.internal.encoder.EncoderConfig
    public abstract Timebase getInputTimebase();

    @Override // androidx.camera.video.internal.encoder.EncoderConfig
    public abstract String getMimeType();

    @Override // androidx.camera.video.internal.encoder.EncoderConfig
    public abstract int getProfile();

    AudioEncoderConfig() {
    }

    public static Builder builder() {
        return new AutoValue_AudioEncoderConfig.Builder().setProfile(-1);
    }

    @Override // androidx.camera.video.internal.encoder.EncoderConfig
    public MediaFormat toMediaFormat() {
        MediaFormat mediaFormat = MediaFormat.createAudioFormat(getMimeType(), getEncodeSampleRate(), getChannelCount());
        mediaFormat.setInteger("bitrate", getBitrate());
        if (getProfile() != -1) {
            if (getMimeType().equals(DefaultEncoderProfilesProvider.DEFAULT_AUDIO_MIME_TYPE)) {
                mediaFormat.setInteger("aac-profile", getProfile());
            } else {
                mediaFormat.setInteger(Scopes.PROFILE, getProfile());
            }
        }
        return mediaFormat;
    }

    public static abstract class Builder {
        abstract AudioEncoderConfig autoBuild();

        public abstract Builder setBitrate(int i);

        public abstract Builder setCaptureSampleRate(int i);

        public abstract Builder setChannelCount(int i);

        public abstract Builder setEncodeSampleRate(int i);

        public abstract Builder setInputTimebase(Timebase timebase);

        public abstract Builder setMimeType(String str);

        public abstract Builder setProfile(int i);

        Builder() {
        }

        public AudioEncoderConfig build() {
            AudioEncoderConfig config = autoBuild();
            if (Objects.equals(config.getMimeType(), DefaultEncoderProfilesProvider.DEFAULT_AUDIO_MIME_TYPE) && config.getProfile() == -1) {
                throw new IllegalArgumentException("Encoder mime set to AAC, but no AAC profile was provided.");
            }
            return config;
        }
    }
}
