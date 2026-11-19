package androidx.camera.video;

import j$.util.DesugarCollections;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* carregado de: classes.dex */
public abstract class AudioStats {
    public static final double AUDIO_AMPLITUDE_NONE = 0.0d;
    public static final int AUDIO_STATE_ACTIVE = 0;
    public static final int AUDIO_STATE_DISABLED = 1;
    public static final int AUDIO_STATE_ENCODER_ERROR = 3;
    public static final int AUDIO_STATE_MUTED = 5;
    public static final int AUDIO_STATE_SOURCE_ERROR = 4;
    public static final int AUDIO_STATE_SOURCE_SILENCED = 2;
    private static final Set<Integer> ERROR_STATES = DesugarCollections.unmodifiableSet(new HashSet(Arrays.asList(2, 3, 4)));

    @Retention(RetentionPolicy.SOURCE)
    public @interface AudioState {
    }

    abstract double getAudioAmplitudeInternal();

    public abstract long getAudioBytesRecorded();

    public abstract int getAudioState();

    public abstract Throwable getErrorCause();

    AudioStats() {
    }

    static AudioStats of(int state, Throwable errorCause, double audioAmplitude, long audioBytes) {
        return new AutoValue_AudioStats(state, audioAmplitude, audioBytes, errorCause);
    }

    public boolean hasAudio() {
        return getAudioState() == 0;
    }

    public boolean hasError() {
        return ERROR_STATES.contains(Integer.valueOf(getAudioState()));
    }

    public double getAudioAmplitude() {
        if (getAudioState() == 1) {
            return AUDIO_AMPLITUDE_NONE;
        }
        return getAudioAmplitudeInternal();
    }
}
