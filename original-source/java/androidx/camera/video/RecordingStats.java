package androidx.camera.video;

import androidx.core.util.Preconditions;

/* loaded from: classes.dex */
public abstract class RecordingStats {
    public abstract AudioStats getAudioStats();

    public abstract long getNumBytesRecorded();

    public abstract long getRecordedDurationNanos();

    RecordingStats() {
    }

    static RecordingStats of(long duration, long bytes, AudioStats audioStats) {
        Preconditions.checkArgument(duration >= 0, "duration must be positive value.");
        Preconditions.checkArgument(bytes >= 0, "bytes must be positive value.");
        return new AutoValue_RecordingStats(duration, bytes, audioStats);
    }
}
