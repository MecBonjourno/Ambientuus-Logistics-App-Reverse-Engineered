package androidx.camera.video;

/* loaded from: classes.dex */
final class AutoValue_AudioStats extends AudioStats {
    private final double audioAmplitudeInternal;
    private final long audioBytesRecorded;
    private final int audioState;
    private final Throwable errorCause;

    AutoValue_AudioStats(int audioState, double audioAmplitudeInternal, long audioBytesRecorded, Throwable errorCause) {
        this.audioState = audioState;
        this.audioAmplitudeInternal = audioAmplitudeInternal;
        this.audioBytesRecorded = audioBytesRecorded;
        this.errorCause = errorCause;
    }

    @Override // androidx.camera.video.AudioStats
    public int getAudioState() {
        return this.audioState;
    }

    @Override // androidx.camera.video.AudioStats
    double getAudioAmplitudeInternal() {
        return this.audioAmplitudeInternal;
    }

    @Override // androidx.camera.video.AudioStats
    public long getAudioBytesRecorded() {
        return this.audioBytesRecorded;
    }

    @Override // androidx.camera.video.AudioStats
    public Throwable getErrorCause() {
        return this.errorCause;
    }

    public String toString() {
        return "AudioStats{audioState=" + this.audioState + ", audioAmplitudeInternal=" + this.audioAmplitudeInternal + ", audioBytesRecorded=" + this.audioBytesRecorded + ", errorCause=" + this.errorCause + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof AudioStats)) {
            return false;
        }
        AudioStats that = (AudioStats) o;
        if (this.audioState == that.getAudioState() && Double.doubleToLongBits(this.audioAmplitudeInternal) == Double.doubleToLongBits(that.getAudioAmplitudeInternal()) && this.audioBytesRecorded == that.getAudioBytesRecorded()) {
            if (this.errorCause == null) {
                if (that.getErrorCause() == null) {
                    return true;
                }
            } else if (this.errorCause.equals(that.getErrorCause())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.audioState) * 1000003) ^ ((int) ((Double.doubleToLongBits(this.audioAmplitudeInternal) >>> 32) ^ Double.doubleToLongBits(this.audioAmplitudeInternal)))) * 1000003) ^ ((int) ((this.audioBytesRecorded >>> 32) ^ this.audioBytesRecorded))) * 1000003) ^ (this.errorCause == null ? 0 : this.errorCause.hashCode());
    }
}
